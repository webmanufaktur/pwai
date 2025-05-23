# Maintainer command completion
_maintainer() {
    local cur prev words cword
    _init_completion || return

    local commands="new add status help"
    local new_commands="feature"
    local add_commands="task"

    case "${prev}" in
        new)
            COMPREPLY=($(compgen -W "${new_commands}" -- "${cur}"))
            return 0
            ;;
        add)
            COMPREPLY=($(compgen -W "${add_commands}" -- "${cur}"))
            return 0
            ;;
        task)
            # Complete feature IDs when adding a task
            if [[ "${words[1]}" == "add" ]]; then
                local features_dir="$(dirname "${BASH_SOURCE[0]}")/../features"
                local features=()
                
                # Find all feature files and extract just the base names
                if [ -d "$features_dir" ]; then
                    while IFS= read -r f; do
                        features+=("$(basename "$f" .md)")
                    done < <(find "$features_dir" -maxdepth 1 -name '*.md' ! -name 'README.md' -type f)
                fi
                
                COMPREPLY=($(compgen -W "${features[*]}" -- "${cur}"))
                return 0
            fi
            ;;
    esac

    if [[ "${cword}" == 1 ]]; then
        COMPREPLY=($(compgen -W "${commands}" -- "${cur}"))
        return 0
    fi
}

# Only set up completion if we're not being sourced for testing
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    complete -F _maintainer ./maintainer
fi
