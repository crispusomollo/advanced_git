#!/bin/bash

echo "🔄 Starting Git Collaboration Workflow"

# Step 1: Pull from main
echo "➡️  Switching to main and pulling latest changes..."
git checkout eugine
git pull origin eugine

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

# Optional: Show status and PR reminder
git status
echo "💡 Don't forget to create a Pull Request on GitHub!"

# Push branch to GitHub
git push -u origin $branch
echo "🚀 Pushed to GitHub: $branch"

# Step 5: Auto-create a pull request
read -p "🧾 Enter Pull Request title: " pr_title
read -p "✏️ Enter Pull Request body/description: " pr_body

read -p "👥 Enter GitHub usernames of reviewers (comma-separated, no spaces): " reviewers
read -p "🏷️ Enter labels (comma-separated, e.g., bug, enhancement): " labels

# Create PR using GitHub CLI with reviewers and labels
gh pr create \
  --base main \
  --head $branch \
  --title "$pr_title" \
  --body "$pr_body" \
  --reviewer "${reviewers//,/ }" \
  --label "$labels"

echo "✅ Pull Request created with reviewers and labels!"
