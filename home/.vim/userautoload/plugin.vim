call plug#begin('~/.vim/plugged')

"Plug 'junegunn/fzf', { 'build': './install --all', 'merged': 0 }
"Plug 'junegunn/fzf.vim', { 'depends': 'fzf' }
"Plug 'plasticboy/vim-markdown'
Plug 'Shougo/neocomplete'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/unite.vim'
" Plug 'Shougo/vimproc.vim', {'build' : 'make'}
Plug 'bronson/vim-trailing-whitespace'
" Plug 'lambdalisue/vim-gista', { 'on_cmd': 'Gista' }
Plug 'mattn/webapi-vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdtree'
Plug 'stephpy/vim-yaml'
Plug 'thinca/vim-quickrun'
Plug 'thoughtbot/vim-rspec'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
" Plug 'tsuyoshiwada/slack-memo-vim', {'depends': 'mattn/webapi-vim'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-perl/vim-perl'
Plug 'w0rp/ale'
Plug 'wakatime/vim-wakatime'
" colorscheme
Plug 'altercation/vim-colors-solarized'
Plug 'ciaranm/inkpot'
Plug 'tomasr/molokai'
Plug 'yuroyoro/yuroyoro256.vim'

call plug#end()

" setting for each plugin

" nerdtree
map <C-n> :NERDTreeToggle<CR>

" vim-indent-guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=lightgrey ctermbg=darkgrey

" neocomplete
" see https://github.com/Shougo/neocomplete.vim for additional settings
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" slack-memo-vim
nnoremap smp :SlackMemoPost<CR>
nnoremap sml :SlackMemoList<CR>

" vim-airline
let g:airline#extensions#ale#enabled = 1

" vim-rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "!bundle exec rspec {spec}"
let g:rspec_runner = "os_x_iterm2"

" vim-quickrun
let g:quickrun_config = {
\ "_" : {
\   'runner'                    : 'vimproc',
\   'runner/vimproc/updatetime' : 60,
\   'outputter'                       : 'error',
\   'outputter/error/success'         : 'buffer',
\   'outputter/error/error'           : 'quickfix',
\   'outputter/buffer/split'          : ':rightbelow 8sp',
\   'outputter/buffer/close_on_empty' : 1,
\ }
\}

let g:quickrun_config['sql'] = {
\ 'command': 'mysql',
\ 'exec': ['%c -u root < %s'],
\ }
