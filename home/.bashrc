# ~/.bash_profile など優先度の高い場所で
# ・ このファイルのsource
# を行って下さい

# 変数定義
_CWD=$(cd $(dirname $(realpath ${BASH_SOURCE:-$0})); pwd)
USER_CONF_DIR="${_CWD}/../"

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# peco
# http://qiita.com/tukiyo3/items/1548e50fe04d44b9a342
## scp時、「bind: 警告: 行編集が有効になっていません」対策
if [ -z "$PS1" ]; then
    return;
fi

# http://qiita.com/yungsang/items/09890a06d204bf398eea
peco-history() {
  local NUM=$(history | wc -l)
  local FIRST=$((-1*(NUM-1)))

  if [ $FIRST -eq 0 ] ; then
    # Remove the last entry, "peco-history"
    history -d $((HISTCMD-1))
    echo "No history" >&2
    return
  fi

  local CMD=$(fc -l $FIRST | sort -k 2 -k 1nr | uniq -f 1 | sort -nr | sed -E 's/^[0-9]+[[:blank:]]+//' | peco | head -n 1)

  if [ -n "$CMD" ] ; then
    # Replace the last entry, "peco-history", with $CMD
    history -s $CMD

    if type osascript > /dev/null 2>&1 ; then
      # Send UP keystroke to console
      (osascript -e 'tell application "System Events" to keystroke (ASCII character 30)' &)
    fi

    # Uncomment below to execute it here directly
    # echo $CMD >&2
    # eval $CMD
  else
    # Remove the last entry, "peco-history"
    history -d $((HISTCMD-1))
  fi
}

# bind
bind -x '"\C-r": peco-history'

# export
export EDITOR=$(which vim)

## 空白を履歴に追記しない、重複履歴を保存しない(ignoreboth = ignorespace + ignoredups)
export HISTCONTROL=ignoreboth:erasedups

## 保存件数の設定
export HISTSIZE=100000

## ヒストリに時刻を導入する
export HISTTIMEFORMAT='%Y/%m/%d %T ' # YYYY/MM/DD hh:mm:ss

export LANG=en_US.UTF-8

## less コマンド時に自動でつけるオプション
export LESS='-FRX'
### -F or --quit-if-one-screen
### -R or --RAW-CONTROL-CHARS
### -X or --no-init

## less コマンド時に自動で通すフィルター
export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'

##  PATH
export PATH="$HOME/bin":$PATH
export PATH=/usr/local/bin:$PATH # homebrew 用に/usr/local/bin の優先度を上げる

## PS1
export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

# source
source $HOME/.aliases
if [ -d $HOME/.shellrc/ ]; then
  for file in $HOME/.shellrc/**/.bashrc; do
    source $file
  done
fi
## git コマンドでブランチ名などの補完が出来るようにする
if [ -d  $HOME/git/github.com/git/git ]; then
  source $HOME/git/github.com/git/git/contrib/completion/git-prompt.sh
  source $HOME/git/github.com/git/git/contrib/completion/git-completion.bash
fi
