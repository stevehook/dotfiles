" Vundle packages
filetype off
set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'Lokaltog/powerline'
Bundle 'Valloric/YouCompleteMe'
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'YankRing.vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-commentary'
Bundle 'vim-ruby/vim-ruby'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
"Bundle 'airblade/vim-gitgutter'
Bundle 'majutsushi/tagbar'
Bundle 'godlygeek/tabular'
Bundle 'thoughtbot/vim-rspec'
Bundle 'tpope/vim-dispatch'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'

" Basic options
set background=dark 
colorscheme xoria256
let mapleader=','
set guifont=Monaco:h14
set hidden
set noerrorbells
set history=1000
set undolevels=1000
set title
set guioptions=aAce
set t_vb=
set shell=/bin/bash
set nocompatible
set number
set ruler
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
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,tmp/**,*/node_modules/*

" Status bar
set laststatus=2

" Diff
set diffopt+=iwhite

let g:Powerline_symbols = 'fancy'

" Simpler window navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
map <silent> <F4> :bd #<CR>

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
let NERDTreeIgnore=['\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1

" Command-T configuration
let g:CommandTMaxHeight=20

" ZoomWin configuration
map <Leader><Leader> :ZoomWin<CR>

" Edit files local to current buffer
cnoremap %% <C-R>=expand('%:h').'/'<cr>
"map <leader>e :edit %%

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>

set nocompatible
if has("autocmd")
  filetype indent plugin on
endif

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

function s:setupWrapping()
  set wrap
  set wm=2
  set textwidth=72
endfunction

function s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>p :Mm <CR>
endfunction

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()
au BufRead,BufNewFile *.txt call s:setupWrapping()

" make python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python  set tabstop=4 textwidth=79

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Custom surround.vim mappings
let g:surround_35 = "#{\r}"

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Key-mappings for Ack plugin
nmap g/ :Ack<space>
nmap g* :Ack -w <C-R><C-W><space>

" ctrlp plugin
let g:ctrlp_map = '<leader>t'
nnoremap <leader>g :CtrlPMRU<CR>
nnoremap <leader>m :CtrlPMRU<CR>
nnoremap <leader>b :CtrlPBuffer<CR>

" git gutter plugin
nnoremap <leader>z :ToggleGitGutter<CR>:ToggleGitGutter<CR>

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" Use modeline overrides
set modeline
set modelines=10

nmap <silent> <leader>l :call ToggleList("Location List", 'l')<CR>
nmap <silent> <leader>e :call ToggleList("Quickfix List", 'c')<CR>

" ctags
nmap <F8> :TagbarToggle<CR>
nmap <leader>a :TagbarToggle<CR>

" Default color scheme
" color steve
set t_Co=256
color xoria256

" Trailing whitespace highlighting
highlight ExtraWhitespace ctermbg=1 guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Turn off jslint errors by default
let g:JSLintHighlightErrorLine = 0

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

" % to bounce from do to end etc.
runtime! macros/matchit.vim

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" Fix rspec syntax highlighting in non-Rails projects
autocmd BufRead *_spec.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context let
highlight def link rubyRspec Function
au BufNewFile,BufRead *.ui set filetype=ruby

" Correct the side bar background for Git Gutter
highlight clear SignColumn

" Move by screen lines (not lines) (for wrapped text).
noremap j gj
noremap k gk

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|tmp$',
  \ 'file': '\v\.(exe|so|dll|log|gif|jpg|jpeg|png)$'
  \ }
let g:ctrlp_mruf_relative = 1

"let g:rspec_command = "!rspec {spec}"
map <Leader>rr :call RunCurrentSpecFile()<CR>
map <Leader>rs :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>

filetype plugin indent on

nmap <leader>l :set list!<CR>

