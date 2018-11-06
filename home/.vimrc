let $CWD = expand('<sfile>:p:h')

runtime! userautoload/*
if filereadable(expand('~/.local/.vimrc'))
  source ~/.local/.vimrc
endif


" OPTION DESCRIPTION - http://vimdoc.sourceforge.net/htmldoc/quickref.html#option-list
set ambiwidth=double
set autoindent " take indent for new line from previous line
set autoread " autom. read file when changed outside of Vim
" When one of the patterns matches with the name of the file which is written, no backup file is created
" (default: "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*")
set backupskip=/tmp/*,/private/tmp/* " no backup for files that match these patterns
set backspace=2 " how backspace works at start of line
set cursorline " highlight the screen line of the cursor
set directory=$HOME/.vim/swapfiles " list of directory names for the swap file
set encoding=utf8
set expandtab " use spaces when <Tab> is inserted
set fileencodings=utf8,euc-jp,iso-2022-jp-3,iso-2022-jp,euc-jisx0213,ucs-bom,euc-jp,eucjp-ms,cp932,sjis
set history=50          " keep 50 lines of command line history
set hlsearch
set incsearch " highlight match while typing search pattern
set laststatus=2 " 常にステータスラインを表示
set list
set listchars=tab:>-,eol:<,nbsp:%
" set listchars=tab:>-,trail:-,eol:<,extends:-,precedes:-,nbsp:%
set noerrorbells
set number
set ruler               " show the cursor position all the time
set shiftwidth=2 " tabは半角スペース2個分
set showmatch " 括弧の対応をハイライト
set smartindent " 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする
set softtabstop=0
set spell
set spelllang=en,cjk
set statusline=[%F%r%h%w]\[%{&fenc==''?&enc:&fenc}]\[POS=%04l,%04v][%p%%]\[LEN=%L]
set t_Co=256
set tabstop=2  " tabは半角スペース2個分
set termencoding=utf8
set visualbell t_vb=

highlight CursorLine term=reverse cterm=reverse
highlight clear SpellBad
highlight SpellBad cterm=underline
highlight clear SpellCap
highlight SpellCap cterm=underline,bold
colorscheme inkpot

" =============================================================================
" :au[tocmd] [group] {event} {pat} [nested] {cmd}
"
"   Add {cmd} to the list of commands that Vim will
"   execute automatically on {event} for a file matching
"   {pat} autocmd-patterns.
"   Vim always adds the {cmd} after existing autocommands,
"   so that the autocommands execute in the order in which
"   they were given.  See autocmd-nested for [nested].
"
" =============================================================================
" autocmd BufNewFile,BufRead *.tx  set filetype=tt2html " xslate
" autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
autocmd BufRead,BufNewFile *.swift set filetype=swift

autocmd BufNewFile *.rb 0r $HOME/.vim/template/ruby.txt
autocmd BufNewFile *.sh 0r $HOME/.vim/template/sh.txt
autocmd BufNewFile *.sql 0r $HOME/.vim/template/sql.txt
autocmd BufNewFile .envrc 0r $HOME/.vim/template/.envrc.txt
autocmd BufNewFile Gemfile 0r $HOME/.vim/template/gemfile
autocmd BufNewFile package.json 0r $HOME/.vim/template/package.json


" FileType go のときだけハードタブを使用
autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4

"ファイルを開いたときに以前編集していたところに移動
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" =============================================================================
" nnoremap, nn - ノーマルモード時のキーバインド
" =============================================================================
nnoremap <C-c><C-o> /[<=>]\{7\}<Enter>
nnoremap <C-p> :set number! list! paste!<Enter>
" 外部コマンド
" - <silent> から始める
nnoremap <silent> rubo    :! bundle exec rubocop -a % <Enter>
nnoremap <silent> rspec   :! bundle exec rspec % <Enter>
nnoremap <silent> rspec-  :! bundle exec rspec %:
"   git 系
"    - 'git'を'g' に省略
"    - ' 'を'-' に置換
"    - サブコマンドは頭2文字
"    - オプションは'--'の後
"    - '-'で終わる場合、続けての入力が必要(<Enter>はしない)
nnoremap <silent> g-ad    :! git add % <Enter>
nnoremap <silent> g-ad--p :! git add -p % <Enter>
nnoremap <silent> g-bl    :! git blame % <Enter>
nnoremap <silent> g-di    :! git diff --ignore-space-change % <Enter>
nnoremap <silent> g-di--c :! git diff --ignore-space-change --cached % <Enter>
nnoremap <silent> g-di-   :! git diff --ignore-space-change 
nnoremap <silent> g-di-o  :! git diff --ignore-space-change origin/master % <Enter>
nnoremap <silent> g-lo    :! git log % <Enter>
nnoremap <silent> g-lo-p  :! git log -p % <Enter>

" =============================================================================
" :com[mand]
"
"   List all user-defined commands.  When listing commands,
"   the characters in the first two columns are
"       !   Command has the -bang attribute
"       "   Command has the -register attribute
"       b   Command is local to current buffer
"   (see below for details on attributes)
"
" =============================================================================
" Rename <newfilename> でリネーム
" http://vim-jp.org/vim-users-jp/2009/05/27/Hack-17.html
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))
