# === Git Collaboration Script Alias ===

# Run this to automate branch, commit, push, and PR creation
alias gitcollab='git-collab.sh'
alias gitstart='git-workflow.sh'

# Ensure script is executable
if [ -f git-collab.sh ]; then
  chmod +x git-collab.sh
fi

# Ensure script is executable
if [ -f git-workflow.sh ]; then
  chmod +x git-workflow.sh
fi
