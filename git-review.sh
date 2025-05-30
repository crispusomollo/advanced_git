#!/bin/bash

echo "🔍 Fetching open pull requests..."

gh pr list --limit 10

read -p "🔢 Enter PR number or branch name to review: " pr_id

# Show PR details
echo "📄 Showing PR details..."
gh pr view "$pr_id" --web

read -p "✅ Approve and merge this PR? (y/n): " decision

if [[ "$decision" == "y" ]]; then

  # Approve and merge the PR
  echo "👍 Approving PR..."
  gh pr review "$pr_id" --approve

  echo "🔀 Merging PR (squash)..."
  gh pr merge "$pr_id" --squash --delete-branch

  echo "✅ PR approved, merged, and branch deleted!"
else
  echo "❌ Review canceled."
fi
