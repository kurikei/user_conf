" curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
" sh ./installer.sh ~/.vim/dein
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
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('scrooloose/nerdtree')
call dein#add('scrooloose/syntastic')
call dein#add('stephpy/vim-yaml')
call dein#add('thinca/vim-quickrun')
call dein#add('thoughtbot/vim-rspec')
call dein#add('tomtom/tcomment_vim')
call dein#add('tpope/vim-endwise')
call dein#add('tpope/vim-surround')
call dein#add('tsuyoshiwada/slack-memo-vim', {'depends': 'mattn/webapi-vim'})
call dein#add('vim-perl/vim-perl')
call dein#add('w0rp/ale')
call dein#add('wakatime/vim-wakatime')
" colorscheme
call dein#add('altercation/vim-colors-solarized')
call dein#add('ciaranm/inkpot')
call dein#add('tomasr/molokai')
call dein#add('yuroyoro/yuroyoro256.vim')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable


" clean disabled plugin
call map(dein#check_clean(), "delete(v:val, 'rf')")

" If you want to install not installed plugins on startup.
if dein#check_install()
 call dein#install()
endif

" setting for each plugin

" ale
let g:ale_emit_conflict_warnings = 0

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

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline=[%F%r%h%w]\[%{&fenc==''?&enc:&fenc}]\[POS=%04l,%04v][%p%%]\[LEN=%L]

let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_ruby_rubocop_args = ['-c ~/.rubocop.yml --display-cop-names']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_save = 1
let g:syntastic_check_on_wq = 0

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
