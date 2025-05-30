#!/bin/bash

while true; do

  echo ""
  echo "=============================="
  echo "🚀 GIT COLLABORATION MENU"
  echo "=============================="
  echo "1️. Start New Feature / Task (gitcollab)"
  echo "2️. Review & Merge Pull Requests (gitreview)"
  echo "3️. Exit"
  echo "------------------------------"

  read -p "👉 Choose an option [1-3]: " choice

  case $choice in
    1)
      /git-collab.sh
      ;;
    2)
      /git-review.sh
      ;;
    3)
      echo "👋 Exiting Git Menu. Happy coding!"
      break
      ;;
    *)
      echo "❗ Invalid option. Please enter 1, 2, or 3."
      ;;
  esac
done
