let g:python3_host_prog = '/usr/bin/python3'

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
    let s:search_grey = { "gui": "#8898aa", "cterm": "061", "cterm16" : "0" }
    let s:search_white = { "gui": "#000000", "cterm": "015", "cterm16" : "7" }
    " autocmd ColorScheme * call onedark#extend_highlight("IncSearch", { "fg": { "gui": "#eeeeee", "cterm": "255" } })
    " autocmd ColorScheme * call onedark#extend_highlight("Search", { "bg": { "gui": "#4e4e60", "cterm": "239" } })
    " autocmd ColorScheme * call onedark#extend_highlight("IncSearch", { "fg": { "gui": "#121212", "cterm": "233" } })
    autocmd ColorScheme * call onedark#extend_highlight("Search", { "bg": { "gui": "#AFAFD7", "cterm": "146" } })
    autocmd ColorScheme * call onedark#set_highlight("Search", { "bg": s:search_grey, "fg": s:search_white })
    autocmd ColorScheme * call onedark#set_highlight("IncSearch", { "bg": s:search_grey, "fg": s:search_white })
  augroup END
endif

" call s:h("IncSearch", { "fg": s:yellow, "bg": s:comment_grey }) " 'incsearch' highlighting; also used for the text replaced with ":s///c"

" Vimplug
call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
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
" Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-grepper'
Plug 'vim-scripts/YankRing.vim'

" nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" nvim-snippy & nvim-cmp integration
Plug 'dcampos/nvim-snippy'
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'dcampos/cmp-snippy'

" Initialize plugin system
call plug#end()

" Basic options
set background=dark
colorscheme onedark
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

" " Tab completion
" set wildmenu
" set wildmode=list:longest,list:full
" set wildignore+=*.o,*.obj,.git,*.rbc,tmp/**,*/node_modules/*

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
let g:fzf_preview_window = ['right:50%:hidden', 'ctrl-/']
let g:fzf_layout = {'down': '30%'}

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"" -----------------------------------------------------------------------------
"" coc.nvim config

"" Give more space for displaying messages.
"set cmdheight=2

"" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
"set updatetime=300

"" Use tab for trigger completion with characters ahead and navigate.
"" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
"" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

"" Use <cr> to confirm completion
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
""To make <cr> select the first completion item and confirm the completion when no item has been selected:
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
"" To make coc.nvim format your code on <cr>, use keymap:
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"" Close the preview window when completion is done.
"autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

"" GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references) 

"let g:coc_global_extensions = ['coc-solargraph']

"" end of coc.nvim config
"" -----------------------------------------------------------------------------

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
nnoremap <C-Bslash> :TmuxNavigatePrevious<CR>
nnoremap <C-L> :TmuxNavigateRight<CR>
nnoremap <C-K> :TmuxNavigateUp<CR>
nnoremap <C-J> :TmuxNavigateDown<CR>
nnoremap <C-H> :TmuxNavigateLeft<CR>

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

nmap cp :let @* = expand("%")<cr>

" nvim-lsp setup
lua << EOF
require'lspconfig'.solargraph.setup{}
EOF

lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  -- buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "solargraph" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF

" nvim-cmp setup
set completeopt=menu,menuone,noselect

lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require('cmp')

  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif snippy.can_expand_or_advance() then
          snippy.expand_or_advance()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif snippy.can_jump(-1) then
          snippy.previous()
        else
          fallback()
        end
      end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['solargraph'].setup {
    capabilities = capabilities
  }
EOF
