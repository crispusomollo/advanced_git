#!/bin/bash

echo "🔄 Starting Git Collaboration Workflow"
# Step 1: Pull from main
echo "➡️ Switching to main and pulling latest changes..."
git checkout chris
git pull origin chris

# Step 2: Create new branch
read -p "📝 Enter your new branch name (e.g. feature/my-task): " branch
git checkout -b $branch
echo "✅ New branch '$branch' created."

# Step 3: Prompt to continue editing
read -p "⏳ Press [Enter] once you're done making changes to continue..."
# Step 4: Stage, commit, and push
git add .
read -p "📄 Enter your commit message: " msg
git commit -m "$msg"
git push -u origin $branch
echo "🚀 Pushed to GitHub: $branch"

# Step 5: Pull Request details
read -p "🧾 Enter Pull Request title: " pr_title
read -p "✏️  Enter Pull Request description/body: " pr_body
read -p "👥 Enter GitHub usernames of reviewers (comma-separated, no spaces): " reviewers
read -p "🏷️  Enter labels (comma-separated, e.g., bug,enhancement): " labels
read -p "🙋 Enter assignees (comma-separated GitHub usernames): " assignees
read -p "🌐 Open PR in browser after creation? (y/n): " open_browser

# Step 6: Create PR with GitHub CLI
pr_command="gh pr create \
  --base chris \
  --head $branch \
  --title \"$pr_title\" \
  --body \"$pr_body\" \
  --reviewer ${reviewers//,/ } \
  --label \"$labels\" \
  --assignee ${assignees//,/ }"

# Optional: open in browser
if [[ "$open_browser" == "y" ]]; then
  pr_command+=" --web"
fi
# Execute the command
eval $pr_command

echo "✅ Pull Request created successfully!"

