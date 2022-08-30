set nocompatible " Use Vim settings, rather then Vi settings (much better!).
let mapleader="," " Change leader to a comma

" ---------------------------------------------------
" Init {{{
if empty(glob("~/.vim/autoload/plug.vim"))
  silent! execute '!curl --create-dirs -fsSLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * silent! PlugInstall
endif

call plug#begin('~/.vim/plugged')

" Plug 'flazz/vim-colorschemes'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'rudionrails/daywalker.vim', { 'as': 'daywalker' }
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  " let g:tokyonight_style = "day"
  " let g:tokyonight_style = 'storm' " available: night, storm
  let g:tokyonight_enable_italic = 1
Plug 'ayu-theme/ayu-vim'

Plug 'rcarriga/nvim-notify'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdateSync'}

Plug 'BurntSushi/ripgrep'
Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope.nvim'
  nnoremap <leader>f <cmd>Telescope find_files<cr>
  nnoremap <leader>g <cmd>Telescope live_grep<cr>
  nnoremap <leader>b <cmd>Telescope buffers<cr>
  " nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Elm language support
Plug 'ElmCast/elm-vim', { 'do': 'npm install -g elm elm-test elm-oracle elm-format' }
  
" open file given a line, e.g. vim index.html:20
Plug 'bogado/file-line'

" find code definitions and references
Plug 'pechorin/any-jump.vim'
  " Normal mode: Jump to definition under cursore
  nnoremap <leader>j :AnyJump<CR>
  " Visual mode: jump to selected text in visual mode
  xnoremap <leader>j :AnyJumpVisual<CR>
  " Normal mode: open previous opened file (after jump)
  nnoremap <leader>ab :AnyJumpBack<CR>
  " Normal mode: open last closed search window again
  nnoremap <leader>al :AnyJumpLastResults<CR>

Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install() }}
  let g:coc_global_extensions = [
    \ 'coc-marketplace',
    \ 'coc-highlight',
    \ 'coc-explorer',
    \ 'coc-json', 
    \ 'coc-styled-components',
    \ 'coc-jest',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-git',
    \ 'coc-prettier'
    \ ]

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  " Use tab for trigger completion with characters ahead and navigate.
  " inoremap <silent><expr> <TAB>
  "       \   pumvisible() ? "\<C-n>" :
  "       \   <SID>check_back_space() ? "\<TAB>" :
  "       \   coc#refresh()
  " Use <Tab> and <S-Tab> to navigate the completion list:
  " inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  " inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  " Use <cr> to confirm completion
  " inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  " To make <cr> select the first completion item and confirm the completion when no item has been selected
  " inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
  " Close the preview window when completion is done
  autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
  " Use K to show documentation in preview window
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " coc-explorer
  nnoremap <leader>e :CocCommand explorer<CR>

Plug 'rcarriga/nvim-notify'
Plug 'vim-scripts/BufOnly.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'folke/which-key.nvim'
Plug 'mg979/vim-visual-multi' " MultiCursor Editing

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
  " Automatically displays all buffers when there's only one tab open.
  let g:airline#extensions#tabline#enabled = 1

Plug 'jby/tmux.vim'
Plug 'christoomey/vim-tmux-navigator'
  " Don't allow any default key-mappings.
  let g:tmux_navigator_no_mappings = 1
  nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
  nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
  nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
  nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

Plug 'chrisbra/Recover.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-repeat'

Plug 'scrooloose/nerdcommenter'
  " Add spaces after comment delimiters by default
  let g:NERDSpaceDelims = 1
  " Use compact syntax for prettified multi-line comments
  let g:NERDCompactSexyComs = 0
  " Align line-wise comment delimiters flush left instead of following code indentation
  let g:NERDDefaultAlign = 'left'
  " Allow commenting and inverting empty lines (useful when commenting a region)
  let g:NERDCommentEmptyLines = 1
  " Enable trimming of trailing whitespace when uncommenting
  let g:NERDTrimTrailingWhitespace = 1

Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'craigemery/vim-autotag'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
" Plug 'ryanoasis/vim-devicons'
"   " adding the flags to NERDTree
"   let g:webdevicons_enable_nerdtree = 1
"   " whether or not to show the nerdtree brackets around flags
"   let g:webdevicons_conceal_nerdtree_brackets = 1
"   " enable folder/directory glyph flag (disabled by default with 0)
"   let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"   " enable open and close folder/directory glyph flags (disabled by default with 0)
"   let g:DevIconsEnableFoldersOpenClose = 1
"   " the amount of space to use after the glyph character (default ' ')
"   let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '

call plug#end()
" }}}

" ---------------------------------------------------
" General Config {{{
set number                      " Line numbers are good
set relativenumber              " Relative line numbers are even better
set backspace=indent,eol,start  " Allow backspace in insert mode
set history=1000                " Store lots of :cmdline history
set showcmd                     " Show incomplete cmds down the bottom
set showmode                    " Show current mode down the bottom
set gcr=a:blinkon0              " Disable cursor blink
set visualbell                  " No sounds
" set autoread                    " Reload files changed outside vim
set clipboard+=unnamed          " Yank to clipboard
set mouse=a                     " Enable mouse use in all modes
set cmdheight=2                 " Better display for messages
set timeoutlen=100              " time in ms to omplete a key code sequence
" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden
"turn on syntax highlighting
syntax on

" Turn Off Swap Files
set noswapfile
set nobackup
set nowb

" Persistent Undo
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" Indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
" " Auto indent pasted text
" nnoremap p p=`]<C-o>
" nnoremap P P=`]<C-o>
filetype plugin on
filetype indent on
" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·
" set nowrap       "Don't wrap lines
set wrap " Line wrapping on
let &showbreak = "↳  "
set linebreak " Wrap lines at convenient points
set cursorline
set signcolumn=yes " Keep sign (gutter) column visible all times

" Folds
" set foldmethod=indent " fold based on indent
set foldmethod=manual
" set foldnestmax=3 " deepest fold is 3 levels
set nofoldenable " dont fold by default

" Completion
set wildmode=list:longest
set wildmenu "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=*/vendor/**
set wildignore+=*/node_modules/**
set wildignore+=*/log/**
set wildignore+=*/tmp/**
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so,*.swp,*.zip

" Scrolling
set scrolloff=8 "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Search
set incsearch " Find the next match as we type the search
set hlsearch " Highlight searches by default
set ignorecase " Ignore case when searching...
set smartcase " ...unless we type a capital

" Keymap
"make Y consistent with C and D
nnoremap Y y$
function! YRRunAfterMaps()
  nnoremap Y :<C-U>YRYankCount 'y$'<CR>
endfunction
" " ,q to toggle quickfix window (where you have stuff like Ag)
" " ,oq to open it back up (rare)
" nmap <silent> ,qc :cclose<CR>
" nmap <silent> ,qo :copen<CR>
" " Map Ctrl-x and Ctrl-z to navigate the quickfix error list (normally :cn and :cp)
" nnoremap <silent> <C-x> :cn<CR>
" nnoremap <silent> <C-z> :cp<CR>

" Create window splits easier. The default" way is Ctrl-w,v and Ctrl-w,s. I remap this to vv and ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s
"Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<CR>
" avoid ESC
imap jj <Esc>
" Jump to start/end of line
noremap H ^
noremap L $
" Improve up/down movement on wrapped lines
nnoremap j gj
nnoremap k gk
" remap arrow keys
nnoremap <silent> <Left> :bprev<CR>
nnoremap <silent> <Right> :bnext<CR>
nnoremap <silent> <Up> :BufOnly<CR>
nnoremap <silent> <Down> :e#<CR>
" conveniently toggle plugins on/off

" " folding magic
" nnoremap <space> za
" nnoremap <C-space> zA
" }}}

" ---------------------------------------------------
" Color Schemes {{{

" true color setup for vim 8+
set termguicolors

" light / dark background
set background=dark
if $ITERM_PROFILE =~ 'Light'
  set background=light
endif

" colorschemes for iTerm
" colorscheme dracula " default
  " let g:dracula#palette.fg        = ['#212529', 253] " ['#F8F8F2', 253]
  " let g:dracula#palette.bg        = ['#F8F9FA', 236] " ['#282A36', 236]

" colorscheme daywalker

" colorscheme tokyonight

let ayucolor="mirage"
colorscheme ayu

if $ITERM_PROFILE =~ 'Gruvbox'
  let g:gruvbox_contrast_dark = 'soft'
  let g:gruvbox_contrast_light = 'soft'

  colorscheme gruvbox
endif
" }}}

" -------------------------------------------------
"  Misc {{{
" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

if has("nvim")
lua << EOF
  -- which-key setup
  require("which-key").setup {
  }

  -- treesitter setup
  require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = { "html", "json", "tsx", "elm" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    highlight = {
      enable = true,
      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      -- additional_vim_regex_highlighting = false,
    },

    indent = {
      enable = true,
    },
  }

  local ft_to_parser = require"nvim-treesitter.parsers".filetype_to_parsername
  ft_to_parser.javascript = "tsx" -- the javascript filetype will use the tsx parser

  -- indent blankline setup
  require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
  }

  -- telescope setup
  require('telescope').setup {
  }
  require("telescope").load_extension "file_browser"
EOF
endif

" }}}
