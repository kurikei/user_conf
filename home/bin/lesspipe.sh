#!/bin/sh
#
# To use this filter with less, define LESSOPEN:
# export LESSOPEN="|/usr/bin/lesspipe.sh %s"

lesspipe() {
  case "$1" in
  *.[1-9n]|*.[1-9]x|*.man|*.[1-9n].bz2|*.[1-9]x.bz2|*.man.bz2|*.[1-9n].[gx]z|*.[1-9]x.[gx]z|*.man.[gx]z|*.[1-9n].lzma|*.[1-9]x.lzma|*.man.lzma)
        case "$1" in
                *.gz)           DECOMPRESSOR="gzip -dc" ;;
                *.bz2)          DECOMPRESSOR="bzip2 -dc" ;;
                *.xz|*.lzma)    DECOMPRESSOR="xz -dc" ;;
                *)              DECOMPRESSOR="cat" ;;
        esac
        if $DECOMPRESSOR -- "$1" | file - | grep -q troff; then
                $DECOMPRESSOR -- "$1" | groff -Tascii -mandoc -
        else
                $DECOMPRESSOR -- "$1"
        fi ;;
  *.tar) tar tvvf "$1" ;;
  *.tgz|*.tar.gz|*.tar.[zZ]) tar tzvvf "$1" ;;
  *.tar.xz) tar Jtvvf "$1" ;;
  *.xz|*.lzma) xz -dc -- "$1" ;;
  *.tar.bz2|*.tbz2) bzip2 -dc -- "$1" | tar tvvf - ;;
  *.[zZ]|*.gz) gzip -dc -- "$1" ;;
  *.bz2) bzip2 -dc -- "$1" ;;
  *.zip|*.jar|*.nbm) zipinfo -- "$1" ;;
  *.rpm) rpm -qpivl --changelog -- "$1" ;;
  *.cpi|*.cpio) cpio -itv < "$1" ;;
  *.gif|*.jpeg|*.jpg|*.pcd|*.png|*.tga|*.tiff|*.tif)
   if [ -x /usr/local/bin/identify ]; then
     identify "$1"
   elif [ -x /usr/bin/gm ]; then
     gm identify "$1"
   else
     echo "No identify available"
     echo "Install ImageMagick or GraphicsMagick to browse images"
   fi ;;
  *)
  esac
}

if [ -d "$1" ] ; then
        /bin/ls -alF -- "$1"
else
        lesspipe "$1" 2> /dev/null
fi
