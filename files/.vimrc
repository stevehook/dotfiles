
set rtp+=~/.vim/bundle/Vundle.vim
" set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
call vundle#begin()

Bundle 'gmarik/vundle'

" Bundle 'Lokaltog/powerline'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
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
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-abolish'
Bundle 'vim-ruby/vim-ruby'
" Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'pangloss/vim-javascript'
Bundle 'mxw/vim-jsx'
Bundle 'kchmck/vim-coffee-script'
"Bundle 'airblade/vim-gitgutter'
Bundle 'majutsushi/tagbar'
Bundle 'godlygeek/tabular'
Bundle 'thoughtbot/vim-rspec'
Bundle 'tpope/vim-dispatch'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'tommcdo/vim-exchange'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'rking/ag.vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'benmills/vimux'
Bundle 'skalnik/vim-vroom'
Bundle 'wellle/targets.vim'
Bundle 'janko-m/vim-test'
" Bundle 'wincent/terminus'

" Elixir
Bundle 'elixir-lang/vim-elixir'
Bundle 'mattonrails/vim-mix'

Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'

Bundle 'fatih/vim-go'
Bundle 'w0rp/ale'

" GraphQL
Bundle 'jparise/vim-graphql'

" Colours
Bundle 'liuchengxu/space-vim-dark'
Bundle 'wadackel/vim-dogrun'

Bundle 'sbdchd/neoformat'


call vundle#end()

" Basic options
set background=dark
" colorscheme dogrun
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

" let g:Powerline_symbols = 'fancy'

" Simpler window navigation
" nnoremap <c-j> <c-w>j
" nnoremap <c-k> <c-w>k
" nnoremap <c-h> <c-w>h
" nnoremap <c-l> <c-w>l
" map <silent> <F4> :bd #<CR>

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

" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

" Command-T configuration
let g:CommandTMaxHeight=20

" ZoomWin configuration
" map <Leader><Leader> :ZoomWin<CR>

" Edit files local to current buffer
cnoremap %% <C-R>=expand('%:h').'/'<cr>
"map <leader>e :edit %%

" CTags
" map <Leader>rt :!ctags --extra=+f -R *<CR><CR>

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

function s:setupMarkdown()
  set ft=markdown
  call s:setupWrapping()
endfunction

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkdown()

" make python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python  set tabstop=4 textwidth=79

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" " Opens a tab edit command with the path of the currently edited file filled in
" " Normal mode: <Leader>t
" map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

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
vmap <C-j> ]egv
vmap <C-k> [egv

" mapping for the sudo write trick
cmap w!! w !sudo tee > /dev/null %

" Key-mappings for Ack plugin
nmap g/ :Ag<space>
nmap g* :Ag -w <C-R><C-W><space>

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

" ctags
" nmap <F8> :TagbarToggle<CR>
" nmap <leader>a :TagbarToggle<CR>

" Default color scheme
" color steve
set t_Co=256
" color xoria256
" color plain
color dogrun

" Trailing whitespace highlighting
" highlight ExtraWhitespace ctermbg=1 guibg=red
" au ColorScheme * highlight ExtraWhitespace guibg=red
" au BufEnter * match ExtraWhitespace /\s\+$/
" au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
" au InsertLeave * match ExtraWhiteSpace /\s\+$/

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
" if filereadable(expand("~/.vimrc.local"))
"   source ~/.vimrc.local
" endif

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
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|logs\|tmp\|sahi\|sso_templates\|JMeter$',
  \ 'file': '\v\.(exe|so|dll|log|gif|jpg|jpeg|png)$'
  \ }
let g:ctrlp_mruf_relative = 1

filetype plugin indent on

nmap <leader>l :set list!<CR>

" setup CTRLP to use git repo
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0

" some YouCompleteMe config
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1

" turn on spellchecking in Markdown files
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_gb

" vim-test config
nmap <silent> <leader>R :wall<CR>:TestNearest<CR>
nmap <silent> <leader>r :wall<CR>:TestFile<CR>
nmap <silent> <leader>a :wall<CR>:TestSuite<CR>
nmap <silent> <leader>l :wall<CR>:TestLast<CR>
nmap <silent> <leader>g :wall<CR>:TestVisit<CR>
let test#strategy = "vimux"


" ultisnips
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" go-specific key mappings
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>gt <Plug>(go-test)
au FileType go nmap gd <Plug>(go-def)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

" stop folding
set nofoldenable

" hard mode
" noremap h <NOP>
" noremap j <NOP>
" noremap k <NOP>
" noremap l <NOP>

" mappings to convert Ruby hashrockets to 1.9 syntax
vmap <leader>rh :s/\v:(\w+) \=\>/\1:/g<cr>
map <leader>H :%s/\v:(\w+)(\s*)\=\>/\1: /ge<cr>:%s/ \(\S*\)\.should ==/ expect(\1).to eql/e<cr>:%s/ \(\S*\)\.should/ expect(\1).to/e<cr>:%s/it { should/it { is_expected.to/e<cr>

" old regex engine is faster?
set re=1

" function to move contents of quickfix list in args list
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

" customise Rubocop mappings
let g:vimrubocop_keymap = 0
nmap <Leader>c :RuboCop<CR>

execute 'silent! so' "~/.vim/projects/." . fnamemodify(getcwd(), ':t')

" Allow JSX in JS files too
let g:jsx_ext_required = 0
" And handle the .es6 extension (that react-rails imposes)
autocmd BufNewFile,BufRead *.es6 set filetype=javascript.jsx

" Cursor in Insert mode
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" Manually run prettier.js
nnoremap gp :silent %!prettier --stdin --trailing-comma none --print-width 100 --single-quote<CR>

let g:ale_ruby_rubocop_options = ' --config .rubocop.yml'
let b:ale_ruby_rubocop_options = ' --config .rubocop.yml'

let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_sign_column_always = 1

let g:ale_linters = {
\   'ruby': ['rubocop'],
\   'javascript': ['prettier']
\}

let g:ale_fixers = {
\   'javascript': ['prettier']
\}

let g:ale_pattern_options = {
\   'tmp/.*\.js$': {'ale_enabled': 0}
\}

" Airline configuration
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
" also try 'violet', 'minimal'

" Map Ctrl-6 to Ctrl-^ because Alacritty doesn't recognise Ctrl-6
nnoremap <C-k6> :e #<CR>
nnoremap <leader>p :e #<CR>

command FormatJson :%!jq .
