#!/bin/bash
# Setup script for maintainer bash completion

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Create completion directory if it doesn't exist
mkdir -p "$HOME/.local/share/bash-completion/completions"

# Create completion script
cat > "$HOME/.local/share/bash-completion/completions/maintainer" << 'EOF'
# Maintainer command completion
_maintainer() {
    local cur prev words cword
    _init_completion || return

    # Get completion from the script itself
    local completions
    completions=$("$SCRIPT_DIR/maintainer" --complete "$c" "${words[@]}" "$cur" 2>/dev/null)
    
    if [ $? -eq 0 ]; then
        COMPREPLY=($(compgen -W "$completions" -- "$cur"))
        return 0
    fi
}

complete -F _maintainer ./maintainer
EOF

echo "Bash completion has been set up!"
echo "To start using it, run:"
echo "  source ~/.bashrc  # or restart your terminal"
echo "Then try: ./maintainer <TAB>"
