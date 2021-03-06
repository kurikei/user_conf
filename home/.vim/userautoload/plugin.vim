call plug#begin('~/.vim/plugged')

"Plug 'junegunn/fzf', { 'build': './install --all', 'merged': 0 }
"Plug 'junegunn/fzf.vim', { 'depends': 'fzf' }
if has('nvim')
  Plug 'Shougo/denite.nvim'
  Plug 'Shougo/deol.nvim'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/deoppet.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/neocomplete'
  Plug 'Shougo/unite.vim'
  Plug 'Shougo/neosnippet'
  Plug 'Shougo/neosnippet-snippets'
endif
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'bronson/vim-trailing-whitespace'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'mattn/webapi-vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'rizzatti/dash.vim'
Plug 'scrooloose/nerdtree'
Plug 'stephpy/vim-yaml'
Plug 'thinca/vim-quickrun'
Plug 'thoughtbot/vim-rspec'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'wakatime/vim-wakatime'
" colorscheme
Plug 'altercation/vim-colors-solarized'
Plug 'ciaranm/inkpot'
Plug 'tomasr/molokai'
Plug 'yuroyoro/yuroyoro256.vim'

call plug#end()

" setting for each plugin
" ale
map <leader>at :ALEToggle<CR>
let g:ale_linters = {
\ 'go': ['gometalinter'],
\ 'sh': ['shellcheck', 'shfmt'],
\ 'vim': ['vint'],
\ 'yaml': ['swaglint', 'yamllint']
\ }

" dash.vim
nmap <silent> <leader>d <Plug>DashSearch

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

" vim-airline
let g:airline#extensions#ale#enabled = 1

" vim-go
autocmd FileType go nmap <Leader>gd <Plug>(go-doc)
autocmd FileType go nmap <leader>b <Plug>(go-def)
autocmd FileType go nmap <leader>[ <Plug>(go-implements)
let g:go_fmt_autosave = 1
let g:go_fmt_command = 'goimports'
let g:go_fmt_fail_silently = 1
let g:go_gocode_unimported_packages = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_functions = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1

" vim-rspec
autocmd BufRead,BufNewFile *_spec.rb set filetype=ruby.rspec
au FileType ruby.rspec map <Leader>t :call RunCurrentSpecFile()<CR>
au FileType ruby.rspec map <Leader>s :call RunNearestSpec()<CR>
au FileType ruby.rspec map <Leader>l :call RunLastSpec()<CR>
au FileType ruby.rspec map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = '!bundle exec rspec {spec}'
let g:rspec_runner = 'os_x_iterm2'

" vim-quickrun
let g:quickrun_config = {
\ '_' : {
\   'runner'                    : 'vimproc',
\   'runner/vimproc/updatetime' : 60,
\   'outputter'                       : 'error',
\   'outputter/error/success'         : 'buffer',
\   'outputter/error/error'           : 'quickfix',
\   'outputter/buffer/split'          : ':rightbelow 8sp',
\   'outputter/buffer/close_on_empty' : 1,
\ },
\ 'sql': {
\   'command': 'mysql',
\   'exec': ['%c -u root < %s'],
\ }
\}
map <Leader>q :cclose<CR>
