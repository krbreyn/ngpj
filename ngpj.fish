#!/usr/bin/env fish

if test (count $argv) -lt 2
    echo "Usage: $0 <folder-name> <go-module-name> [-gh public|private]"
    exit 1
end

set FOLDER_NAME $argv[1]
set GO_MODULE_NAME $argv[2]
set GITHUB_VISBILITY ""

if test (count $argv) -ge 3
    if test $argv[3] = -gh
        if test (count $argv) -ge 4
            if test $argv[4] = public -o $argv[4] = private
                set GITHUB_VISIBILITY $argv[4]
            else
                echo "Error: You must specify 'public' or 'private' after -gh."
                exit 1
            end
        else
            echo "Error: Missing visibility value after -gh."
            exit 1
        end
    end
end

mkdir -p "$FOLDER_NAME"
cd "$FOLDER_NAME"; or exit 1
go mod init "$GO_MODULE_NAME"

git init .

if test -n "$GITHUB_VISIBILITY"
    gh repo create --source=. --$GITHUB_VISIBILITY
end

echo "Project created!"
