let g:python_host_prog='/usr/local/bin/python'
" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc

" purple -> LightCyan1 (195)
" yellow - Thistle1 (225)
" blue - LightSteelBlue (146)
" red - Cornsilk1 (230)
" dark_red - Cornsilk1 (230)
" cyan - LightSkyBlue1 (153)
" green - Honeydew (194)
let g:onedark_color_overrides = {
\ "red": { "gui": "#AFD7FF", "cterm": "153", "cterm16": "1" },
\ "dark_red": { "gui": "#AFD7FF", "cterm": "153", "cterm16": "1" },
\ "green": { "gui": "#D7FFD7", "cterm": "194", "cterm16": "4" },
\ "yellow": { "gui": "#FFDFFF", "cterm": "225", "cterm16": "1" },
\ "dark_yellow": { "gui": "#FFDFFF", "cterm": "225", "cterm16": "1" },
\ "blue": { "gui": "#AFAFD7", "cterm": "146", "cterm16": "4" },
\ "purple": { "gui": "#DFFFFF", "cterm": "195", "cterm16": "5" },
\ "cyan": { "gui": "#DFFFDF", "cterm": "194", "cterm16": "4" },
\ "black": {"gui": "#121212", "cterm": "233", "cterm16": "0" },
\ "comment_grey": {"gui": "#949494", "cterm": "246", "cterm16": "15" }
\}

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
" if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
" endif

if (has("autocmd"))
  augroup colorextend
    autocmd!
    " Override Search highlights
    autocmd ColorScheme * call onedark#extend_highlight("IncSearch", { "fg": { "gui": "#eeeeee", "cterm": "255" } })
    autocmd ColorScheme * call onedark#extend_highlight("Search", { "bg": { "gui": "#4e4e60", "cterm": "239" } })
  augroup END
endif

" Vimplug
call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dispatch'
" Plug 'nelstrom/vim-textobj-rubyblock' " errors at startup?
Plug 'radenling/vim-dispatch-neovim'
Plug 'janko-m/vim-test'
Plug 'benmills/vimux'
Plug 'skalnik/vim-vroom'
Plug 'christoomey/vim-tmux-navigator'
Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-grepper'

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
" set guifont=Monaco:h14
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
nnoremap <leader>t :Files<CR>
nnoremap <leader>m :History<CR>
nnoremap <leader>b :Buffers<CR>

" coc completion config
" Use <Tab> and <S-Tab> to navigate the completion list:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"To make <cr> select the first completion item and confirm the completion when no item has been selected:
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" To make coc.nvim format your code on <cr>, use keymap:
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Close the preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Lightline colourscheme
let g:lightline = {
    \ 'colorscheme': 'onedark',
		\ 'component': {
		\   'lineinfo': ' %3l:%-2v',
		\ },
		\ 'component_function': {
		\   'readonly': 'LightlineReadonly',
		\   'fugitive': 'LightlineFugitive'
		\ },
		\ 'separator': { 'left': '', 'right': '' },
		\ 'subseparator': { 'left': '', 'right': '' }
		\ }
function! LightlineReadonly()
  return &readonly ? '' : ''
endfunction
function! LightlineFugitive()
  if exists('*FugitiveHead')
    let branch = FugitiveHead()
    return branch !=# '' ? ''.branch : ''
  endif
  return ''
endfunction

" vim-test config
nmap <silent> <leader>R :wall<CR>:TestNearest<CR>
nmap <silent> <leader>r :wall<CR>:TestFile<CR>
nmap <silent> <leader>a :wall<CR>:TestSuite<CR>
nmap <silent> <leader>l :wall<CR>:TestLast<CR>
nmap <silent> <leader>g :wall<CR>:TestVisit<CR>
let test#strategy = "vimux"

" Map Ctrl-6 to Ctrl-^ because Alacritty doesn't recognise Ctrl-6
nnoremap <C-k6> :e #<CR>
" Shortcut for Ctrl-^
nnoremap <leader>p :e #<CR>

" Simpler window navigation
nnoremap <C-Bslash> :TmuxNavigatePrevious<CR>                                                │Coverage report generated for RSpec to /Users/steve/Work/df
nnoremap <C-L> :TmuxNavigateRight<CR>                                                   │e/apply-for-teacher-training/coverage/coverage.xml. 13438 /
nnoremap <C-K> :TmuxNavigateUp<CR>                                                      │ 14005 LOC (95.95%) covered.
nnoremap <C-J> :TmuxNavigateDown<CR>                                                    │Stopped processing SimpleCov as a previous error not relate
nnoremap <C-H> :TmuxNavigateLeft<CR>

" if (has("autocmd"))
"   augroup colorextend
"     autocmd!
"     " Override Search highlights
"     autocmd ColorScheme * call onedark#extend_highlight("IncSearch", { "fg": { "cterm": "NONE" }, "bg": { "cterm": "NONE" } })
"     autocmd ColorScheme * call onedark#extend_highlight("Search", { "fg": { "cterm": "NONE" }, "bg": { "cterm": "NONE" } })
"   augroup END
" endif
" call s:h("IncSearch", { "fg": s:yellow, "bg": s:comment_grey }) " 'incsearch' highlighting; also used for the text replaced with ":s///c"

" Search/vim-grepper config
let g:grepper       = {}
let g:grepper.tools = ['ag', 'rg', 'grep', 'git']

" Search for the current word
nmap g/ :Grepper<CR>
nmap g* :Grepper -cword -noprompt<CR>

" Search for the current selection
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" Shortcuts to show and hide the location and quickfix lists
function! GetBufferList()
  redir =>buflist
  silent! ls
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction
nmap <silent> <leader>l :call ToggleList("Location List", 'l')<CR>
nmap <silent> <leader>e :call ToggleList("Quickfix List", 'c')<CR>
