call plug#begin()

Plug 'tpope/vim-sensible'

" Colors and Syntax Highlighting
Plug 'altercation/vim-colors-solarized'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-markdown'
Plug 'slim-template/vim-slim'
Plug 'digitaltoad/vim-jade'
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'
Plug 'pangloss/vim-javascript'
Plug 'chase/vim-ansible-yaml'
Plug 'elzr/vim-json'

" Ruby/Rails Related
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'

" everything else
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'Raimondi/delimitMate'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'bogado/file-line'
Plug 'rizzatti/dash.vim'
Plug 'tpope/vim-obsession'
Plug 'kien/ctrlp.vim'

call plug#end()

" Show Me Things
set background=dark
colorscheme solarized
syntax on
set relativenumber
set number

" Best leader
let mapleader = "\<Space>"
" http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
nnoremap <Leader>w :w<CR>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
map q: :q

" Highlight inaccurately (so its fast)
set ttyfast
set lazyredraw
" http://stackoverflow.com/questions/4775605/vim-syntax-highlight-improve-performance
set nocursorcolumn
set nocursorline

" 80 chars 4 lyfe
set colorcolumn=80
hi ColorColumn ctermbg=darkgrey guibg=grey50

" Backups and Undo
set backupdir=~/.vim/backup
set directory=~/.vim/backup
set undodir=~/.vim/undo
set undofile
set undolevels=1000
set undoreload=10000
set visualbell

" Tab and Indent
set expandtab
set tabstop=2
set shiftwidth=2

" highlight tabs & trailing spaces -- thanks @georgebashi
set list listchars=tab:\ \ ,trail:·

" Search
set hlsearch
set ignorecase

" Insert Conveneinces
imap jj <Esc>
set pastetoggle=<F2>

" Buffers Are Awesome, Remapping close, next, and previous
nmap <leader>c :bp<bar>sp<bar>bn<bar>bd<CR>
map <leader>n :bprevious<CR>
map <leader>p :bnext<CR>
set hidden

" Better split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"
" Fugitive
"
" quickfix window for :Ggrep
autocmd QuickFixCmdPost *grep* cwindow

"
" Syntastic
"
" http://pep8.readthedocs.org/en/latest/intro.html
" E111: whitespace mult of 4
" E121: continuation line mult 4,
" E126: continuation line over-indented for hanging indent
" E127: continuation line over-indented for visual indent
" E203: whitespace before :
" E221: multiple spaces before operator
" E225: whitespace around operator
" E226: whitespace around arithmetic operator
" E501: line too long
" E241: multiple spaces after separator
let g:syntastic_python_flake8_args = '--ignore=E111,E121,E126,E127,E203,E221,E225,E226,E501,E241'

" http://pylint-messages.wikidot.com/all-codes
" W0311: Bad indentation
" C0103: Invalid name for variable
" C0111: Missing docstring
" C0301: Line too long
let g:syntastic_python_pylint_args = '--disable=W0311,C0103,C0111,C0301 --output-format=parseable --reports=n'

let g:syntastic_javascript_checkers = ["eslint"]

let g:syntastic_ruby_checkers = ["rubocop", "ruby-lint", "mri"]

"
" Ctrl-P
"
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_clear_cache_on_exit = 0
