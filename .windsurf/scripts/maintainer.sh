#!/bin/bash

# Maintainer script for task management
# Usage: ./maintainer.sh [command] [args...]

FEATURES_DIR="$(dirname "$0")/../features"
TASKS_DIR="$(dirname "$0")/../tasks"
TEMPLATES_DIR="$(dirname "$0")/../features/templates"

get_next_task_id() {
    local prefix=$1
    local last_num=$(find "$TASKS_DIR/backlog" "$TASKS_DIR/active" -name "${prefix}-*.md" 2>/dev/null | 
                   grep -oE "${prefix}-[0-9]+" | 
                   sort -nrt- -k2 | 
                   head -n 1 | 
                   grep -oE '[0-9]+$' || echo "0")
    echo $((last_num + 1))
}

new_feature() {
    local feature_name="$1"
    local feature_id=$(date +"%Y-%m-%d")-$(echo "${feature_name,,}" | tr ' ' '-' | tr -cd '[a-z0-9-]')
    local feature_file="$FEATURES_DIR/$feature_id.md"
    
    if [ -f "$feature_file" ]; then
        echo "Feature file already exists: $feature_file"
        return 1
    fi
    
    cp "$TEMPLATES_DIR/feature-template.md" "$feature_file"
    
    # Replace placeholders
    sed -i "s/\[Feature Name\]/$feature_name/" "$feature_file"
    sed -i "s/YYYY-MM-DD/$(date +"%Y-%m-%d")/" "$feature_file"
    
    echo "✨ Created new feature: $feature_file"
    echo "Next steps:"
    echo "1. Edit $feature_file to add details"
    echo "2. Add tasks with: /maintainer add task $feature_id 'Task description'"
}

add_task() {
    local feature_id="$1"
    local task_desc="$2"
    local feature_file="$FEATURES_DIR/$feature_id.md"
    
    if [ ! -f "$feature_file" ]; then
        echo "Error: Feature not found: $feature_id"
        return 1
    fi
    
    local prefix=$(echo "${feature_id%%-*}" | tr '[:lower:]' '[:upper:]' | tr -cd '[:alnum:]' | cut -c1-4)
    local next_id=$(get_next_task_id "$prefix")
    local task_id="${prefix}-$(printf "%03d" $next_id)"
    local task_file="$TASKS_DIR/backlog/${task_id}-$(echo "${task_desc,,}" | tr ' ' '-' | tr -cd '[a-z0-9-]').md"
    
    if [ -f "$task_file" ]; then
        echo "Task file already exists: $task_file"
        return 1
    fi
    
    cp "$TEMPLATES_DIR/task-template.md" "$task_file"
    
    # Update task file
    sed -i "s/\[TASK-XXX\]/[${task_id}]/" "$task_file"
    sed -i "s/\[Feature Name\]/${feature_id}/" "$task_file"
    sed -i "s/\[Detailed description of the task\]/${task_desc}/" "$task_file"
    
    # Add to feature file
    if ! grep -q "## Related Tasks" "$feature_file"; then
        echo -e "\n## Related Tasks" >> "$feature_file"
    fi
    
    if ! grep -q "- \[ \] \[${task_id}\]" "$feature_file"; then
        sed -i "/## Related Tasks/a - [ ] [${task_id}] ${task_desc}" "$feature_file"
    fi
    
    echo "🎯 Created new task: $task_file"
    echo "📌 Task added to feature: $feature_id"
}

show_status() {
    echo "📊 Project Status"
    echo "================"
    
    # Show active features
    echo -e "\n🚀 Active Features"
    find "$FEATURES_DIR" -maxdepth 1 -name "*.md" ! -name "README.md" | sort | while read -r f; do
        local status=$(grep -m1 "Status:" "$f" | cut -d: -f2- | xargs)
        if [[ "$status" != *"Done"* && "$status" != *"Archived"* ]]; then
            echo "- $(basename "$f" .md) ($status)"
        fi
    done
    
    # Show active tasks
    echo -e "\n🔧 Active Tasks"
    find "$TASKS_DIR/active" -name "*.md" 2>/dev/null | sort | while read -r f; do
        echo "- $(basename "$f" .md)"
    done
    
    # Show backlog count
    local backlog_count=$(find "$TASKS_DIR/backlog" -name "*.md" 2>/dev/null | wc -l)
    echo -e "\n📥 Backlog: $backlog_count tasks"
}

# Main command handler
case "$1" in
    new)
        case "$2" in
            feature)
                shift 2
                new_feature "$*"
                ;;
            *)
                echo "❌ Unknown new subcommand. Try 'feature'"
                ;;
        esac
        ;;
    add)
        case "$2" in
            task)
                if [ $# -lt 4 ]; then
                    echo "❌ Usage: $0 add task FEATURE-ID 'Task Description'"
                    exit 1
                fi
                add_task "$3" "${@:4}"
                ;;
            *)
                echo "❌ Unknown add subcommand. Try 'task'"
                ;;
        esac
        ;;
    status)
        show_status
        ;;
    *)
        echo "📝 Maintainer - Task Management Helper"
        echo "==================================="
        echo "Usage: $0 {new|add|status} [args...]"
        echo ""
        echo "Commands:"
        echo "  new feature \"Name\"    Create a new feature"
        echo "  add task ID \"Desc\"    Add a task to a feature"
        echo "  status                 Show project status"
        echo ""
        echo "Examples:"
        echo "  $0 new feature \"Add user authentication\""
        echo "  $0 add task 2025-05-24-add-user-auth \"Create login form\""
        ;;
esac
