#!/bin/bash
git_repo="https://github.com/iam-dasari/shell-script-for-devops.git"
backup_dir="/tmp/git_backup"
git clone --mirror "$git_repo" "$backup_dir/shell-script-for-devops.git"