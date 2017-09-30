#!/bin/sh
# Crontab Usage:
# 0 */3 * * * $HOME/.homesick/repos/user_conf/auto_commit_push.sh >> /tmp/git_auto_commit_push.txt.`date +%Y%m%d` 2>&1
GIT_DIR=$(cd $(dirname $0) && pwd)

cd $GIT_DIR
echo "[`date +%Y-%m-%dT%H:%M:%S%z`] $GIT_DIR"
[[ `git pull --ff-only` ]] && git push || echo "cannot pull cause of not fast-forward"

function git(){
  GIT_SSH=./git-ssh.sh git
};
