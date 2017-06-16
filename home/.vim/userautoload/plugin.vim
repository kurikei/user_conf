if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('~/.vim/dein')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
"call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
"call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
"call dein#add('plasticboy/vim-markdown')
call dein#add('Shougo/neocomplete')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('bronson/vim-trailing-whitespace')
call dein#add('lambdalisue/vim-gista', { 'on_cmd': 'Gista' })
call dein#add('mattn/webapi-vim')
call dein#add('scrooloose/syntastic')
call dein#add('stephpy/vim-yaml')
call dein#add('thinca/vim-quickrun')
call dein#add('tomtom/tcomment_vim')
call dein#add('tpope/vim-endwise')
call dein#add('tpope/vim-surround')
call dein#add('tsuyoshiwada/slack-memo-vim', {'depends': 'mattn/webapi-vim'})
call dein#add('vim-perl/vim-perl')
call dein#add('wakatime/vim-wakatime')
" colorscheme
call dein#add('altercation/vim-colors-solarized')
call dein#add('ciaranm/inkpot')
call dein#add('desert256.vim')
call dein#add('mrkn256.vim')
call dein#add('tomasr/molokai')
call dein#add('yuroyoro/yuroyoro256.vim')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
 call dein#install()
endif

" neocomplete
" see https://github.com/Shougo/neocomplete.vim for additional settings
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" slack-memo-vim
nnoremap smp :SlackMemoPost<CR>
nnoremap sml :SlackMemoList<CR>

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline=[%F%r%h%w]\[%{&fenc==''?&enc:&fenc}]\[POS=%04l,%04v][%p%%]\[LEN=%L]

let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_ruby_rubocop_args = ['--display-cop-names']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_save = 1
let g:syntastic_check_on_wq = 0

" vim-quickrun
let g:quickrun_config = {
\ "_" : {
\   'runner'    : 'vimproc',
\   'runner/vimproc/updatetime' : 60,
\   'outputter' : 'error',
\   'outputter/error/success' : 'buffer',
\   'outputter/error/error'   : 'quickfix',
\   'outputter/buffer/split'  : ':rightbelow 8sp',
\   'outputter/buffer/close_on_empty' : 1,
\ },
\ "ruby.rspec" : {
\   "command": "rspec",
\   "cmdopt": "-c -fd --tty",
\   "exec": "bundle exec %c"
\ },
\ "ruby.rspec_line" : {
\   "command": "rspec",
\   "exec": "%c %s:%{line('.')} %o" ,
\   "cmdopt": '-c -fd --tty'
\ }
\}
