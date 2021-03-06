# ~/.bash_profile など優先度の高い場所で
# ・ このファイルのsource
# を行って下さい

# 変数定義
_CWD=$(cd $(dirname $(realpath ${BASH_SOURCE:-$0})); pwd)
USER_CONF_DIR="${_CWD}/../"

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# direnv
if [ $(command -v direnv) ]; then
  eval "$(direnv hook bash)"
fi

# source
for file in `find $HOME/.shellrc -type f -name ".*" -follow -and -not -name "*.swp"`; do
  source $file;
done

# peco
# http://qiita.com/tukiyo3/items/1548e50fe04d44b9a342
## scp時、「bind: 警告: 行編集が有効になっていません」対策
if [ -z "$PS1" ]; then
    return;
fi

# http://qiita.com/yungsang/items/09890a06d204bf398eea
peco-history() {
  local CMD=$(fc -l 1 | sort -nr | cut -f2 | uniq | peco | head -n 1)
  # local NUM=$(history | wc -l)
  # local FIRST=$((-1*(NUM-1)))
  #
  # if [ $FIRST -eq 0 ] ; then
  #   # Remove the last entry, "peco-history"
  #   history -d $((HISTCMD-1))
  #   echo "No history" >&2
  #   return
  # fi

  # local CMD=$(fc -l $FIRST | sort -k 2 -k 1nr | uniq -f 1 | sort -nr | sed -E 's/^[0-9]+[[:blank:]]+//' | peco | head -n 1)
  # local CMD=$(fc -l $FIRST | cut -f2 | uniq | peco | head -n 1)

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
