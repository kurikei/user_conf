#!/bin/sh
# Crontab Usage:
# 0 */3 * * * /path/to/this_file/auto_commit_push.sh > /dev/null
GIT_DIR=$(cd $(dirname $0) && pwd)

cd $GIT_DIR
git add -A > /dev/null 2>&1
git commit -m "auto commit `date +%Y-%m-%dT%H:%M:%S%z`" 2>&1
GIT_SSH=./git-ssh.sh git push
