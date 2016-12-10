let g:neobundle_default_git_protocol='https'

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'


" My Bundles here:
"NeoBundle 'Shougo/unite.vim'
"NeoBundle 'tpope/vim-surround'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'stephpy/vim-yaml'    " yaml のsyntax 高速化
NeoBundle 'tComment'            " コメント入力補助
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tsuyoshiwada/slack-memo-vim', {'depends': 'mattn/webapi-vim'}
NeoBundle 'vim-perl/vim-perl'
NeoBundle 'wakatime/vim-wakatime'

"colorscheme
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'ciaranm/inkpot'
NeoBundle 'desert256.vim'
NeoBundle 'mrkn256.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'yuroyoro/yuroyoro256.vim'
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" setting for each plugin
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

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_save = 1
let g:syntastic_check_on_wq = 0
