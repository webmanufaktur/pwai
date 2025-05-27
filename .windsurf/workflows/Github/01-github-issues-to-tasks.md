---
description: Creates and manages tasks from GitHub Issues
---

# Task: Sync GitHub Issues to Local Tasks

1. **Fetch Issues**:
   - Use `mcp1_list_issues` to fetch all open issues from the repository
   - Include issue details: title, number, body, labels, assignees, and comments

2. **Process Each Issue**:
   - For each issue, check if a corresponding task file exists in `/.issues/`
   - Naming convention: `[ISSUE_NUMBER]-[SLUGIFIED_TITLE].md`
   - Skip if the task file already exists and is up-to-date

3. **Create/Update Task Files**:
   - Create a new Markdown file for each new issue
   - Include the following sections:
     - Issue title and number (as H1)
     - GitHub issue URL
     - Status (New, In Progress, Blocked, Done)
     - Priority (based on labels: P0, P1, P2, P3)
     - Labels (from GitHub)
     - Assignees (from GitHub)
     - Original issue description
     - Comments from GitHub (with timestamps and authors)
     - Implementation Plan (to be filled out)
     - Notes (for additional context)

4. **Implementation Plan**:
   - Analyze the issue and propose a high-level plan
   - Break down into actionable steps
   - Include relevant files/components that need modification
   - Consider dependencies and potential risks

5. **Task Management**:
   - Update status as work progresses
   - Add notes for important decisions or blockers
   - Link related PRs when work is in progress

6. **Sync Back to GitHub**:
   - Update GitHub issue with progress updates
   - Add comments for major milestones or blockers
   - Close the issue when the task is completed

7. **Cleanup**:
   - Archive completed task files after 30 days
   - Remove task files for closed issues that are no longer relevant
