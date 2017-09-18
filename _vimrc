set history=700

filetype plugin indent on

set autoread

let mapleader = ","
let g:mapleader = ","

execute pathogen#infect()

set wildmenu

set number
set ruler

set hid

set ignorecase

set smartcase

set hlsearch

set incsearch

set magic

syntax enable

set background=dark

colorscheme kolor
set guifont=Consolas:h11

set encoding=utf8

set nobackup

set nowb
set noswapfile

set cursorline

set noexpandtab

set smarttab

set shiftwidth=4
set tabstop=4

set listchars=tab:>-,trail:-
set list

set lbr
set tw=500

set ai "Auto indent"
set si "Smart indent"
set wrap "Wrap lines"

set backspace=indent,eol,start

set clipboard=unnamed

set lines=30 columns=200

" Maps
nmap J gJ
silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>

let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"
