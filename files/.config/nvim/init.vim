let g:python_host_prog='/usr/local/bin/python'
" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc

" purple -> Aquamarine (86)
" yellow - LightSkyBlue3 (110)
" blue - MediumPurple1 (141)
" red - LightPink1 (217)
" cyan - LightSkyBlue1 (153)
let g:onedark_color_overrides = {
\ "black": {"gui": "D0D0D0", "cterm": "233", "cterm16": "0" },
\ "purple": { "gui": "#5fffd7", "cterm": "86", "cterm16": "5" },
\ "blue": { "gui": "#AF87FF", "cterm": "141", "cterm16": "4" },
\ "red": { "gui": "#FFAFAF", "cterm": "217", "cterm16": "1" },
\ "yellow": { "gui": "#AF87FF", "cterm": "141", "cterm16": "1" },
\ "cyan": { "gui": "#AFD7FF", "cterm": "153", "cterm16": "4" }
\}
 
" Vimplug
call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Initialize plugin system
call plug#end()

" Basic options
set background=dark
colorscheme onedark
" colorscheme plain
let mapleader="\<Space>"
set guifont=Monaco:h14
set hidden
set history=1000
set undolevels=1000
set title
set guioptions=aAce
set t_vb=
set shell=/bin/bash
set nocompatible
set number
set ruler
set noeb vb t_vb=
syntax on

" Set encoding
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set listchars=tab:▸\ ,eol:¬
set nolist

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,tmp/**,*/node_modules/*

" Status bar
set laststatus=2

" Don't create temp/backup files
set nobackup
set nowritebackup
set noswapfile

" Diff
set diffopt+=iwhite

" leader 's' as a faster alternative to :nohlsearch
:nmap <leader>s :nohlsearch<CR>

" jj or jk as a faster alternative to Escape
:imap jj <Esc>
:imap jk <Esc>

" Shortcut to strip trailing whitespace
nmap <leader>w :%s/\s\+$//e<CR>

" Make . work in Visual mode
vnoremap . :norm.<CR>

" NERDTree configuration
let NERDTreeIgnore=['\.rbc$', '\~$', '^main$']
map <Leader>n :NERDTreeToggle<CR>
map <Leader>f :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1

" fzf shortcuts
nnoremap <leader>g :Files<CR>
nnoremap <leader>m :History<CR>
nnoremap <leader>b :Buffers<CR>
