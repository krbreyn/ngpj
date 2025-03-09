#!/bin/bash

if [ $# -lt 2 ]; then
  echo "Usage: $0 <folder-name> <go-module-name> [-gh public|private]"
  exit 1
fi

FOLDER_NAME="$1"
GO_MODULE_NAME="$2"
GITHUB_VISBILITY=""

if [[ "$3" == "-gh" ]]; then
  if [[ "$4" == "public" || "$4" == "private" ]]; then
    GITHUB_VISIBILITY="$4"
  else
    echo "Error: You must specify 'public' or 'private' after -gh."
    exit 1
  fi
fi

mkdir -p "$FOLDER_NAME"
cd "$FOLDER_NAME" || exit
go mod init "$GO_MODULE_NAME"

git init .

if [[ -n "$GITHUB_VISIBILITY" ]]; then
  gh repo create --source=. --"$GITHUB_VISIBILITY"
fi

echo "Project created!"  
