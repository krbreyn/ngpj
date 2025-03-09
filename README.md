Create a new Go project in a single command.

Usage:
`./ngpj.sh <folder-name> <go-module-name> [-gh public|private]`

This will do the following:
1. Create a new folder with <folder-name>.
2. Run `go mod init <go-module-name>`.
3. Run `git init .`.
4. Optionally, create a new GitHub repo using the CLI (requires the GitHub CLI to be installed).
