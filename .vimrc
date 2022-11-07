let mapleader="," " Change leader to a comma

" ---------------------------------------------------
" Init {{{
if empty(glob("~/.vim/autoload/plug.vim"))
  silent! execute '!curl --create-dirs -fsSLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * silent! PlugInstall
endif

call plug#begin('~/.vim/plugged')

Plug 'kyazdani42/nvim-web-devicons' " devicons many plugins depend on
Plug 'nvim-lua/plenary.nvim' " Lua functions that many plugins depend on

" Plug 'flazz/vim-colorschemes'
Plug 'catppuccin/nvim'
Plug 'rudionrails/daywalker.vim', { 'as': 'daywalker' }
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  " let g:tokyonight_style = "day"
  " let g:tokyonight_style = 'storm' " available: night, storm
  let g:tokyonight_enable_italic = 1
Plug 'bluz71/vim-nightfly-guicolors'

Plug 'rcarriga/nvim-notify'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdateSync'}
Plug 'nvim-treesitter/nvim-treesitter-context'
" Plug 'ziontee113/syntax-tree-surfer'

Plug 'BurntSushi/ripgrep'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope.nvim'
  nnoremap <leader>ff <cmd>Telescope find_files<cr>
  nnoremap <leader>fg <cmd>Telescope live_grep<cr>
  nnoremap <leader>fb <cmd>Telescope buffers<cr>
  " nnoremap <leader>fh <cmd>Telescope help_tags<cr>
  
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

" Elm language support
Plug 'ElmCast/elm-vim', { 'do': 'npm install -g elm elm-test elm-oracle elm-format' }
Plug 'github/copilot.vim' " Github CopPilot integration

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
    \ 'coc-git'
    \ ]

  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: There's always complete item selected by default, you may want to enable
  " no select by `"suggest.noselect": true` in your configuration file.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#pum#next(1) :
        \ CheckBackspace() ? "\<Tab>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

  " Make <CR> to accept selected completion item or notify coc.nvim to format
  " <C-g>u breaks current undo, please make your own choice.
  inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif

  " Use `[g` and `]g` to navigate diagnostics
  " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window.
  nnoremap <silent> K :call ShowDocumentation()<CR>

  function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
      call CocActionAsync('doHover')
    else
      call feedkeys('K', 'in')
    endif
  endfunction

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)

  " Code formatting
  vmap <leader>p <Plug>(coc-format-selected)
  nmap <leader>p <Plug>(coc-format)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Applying codeAction to the selected region.
  " Example: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap keys for applying codeAction to the current buffer.
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Apply AutoFix to problem on the current line.
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Run the Code Lens action on the current line.
  nmap <leader>cl  <Plug>(coc-codelens-action)

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocActionAsync('format')

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

  " coc-explorer
  nnoremap <leader>e :CocCommand explorer --position floating<CR>

Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim'
Plug 'vim-scripts/BufOnly.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'folke/which-key.nvim'
Plug 'mg979/vim-visual-multi' " MultiCursor Editing

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

Plug 'numToStr/Comment.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'craigemery/vim-autotag'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'

call plug#end()
" }}}

" ---------------------------------------------------
" " General Config {{{

" line numbers
set number                      " Line numbers are good
set relativenumber              " Relative line numbers are even better
set backspace=indent,eol,start  " Allow backspace in insert mode
" set history=1000                " Store lots of :cmdline history
" set showcmd                     " Show incomplete cmds down the bottom
" set showmode                    " Show current mode down the bottom
" set gcr=a:blinkon0              " Disable cursor blink
" set visualbell                  " No sounds
" " set autoread                    " Reload files changed outside vim
set clipboard+=unnamed          " Yank to clipboard
" set mouse=a                     " Enable mouse use in all modes
set cmdheight=2                 " Better display for messages
set timeoutlen=100              " time in ms to complete a key code sequence

" " This makes vim act like all other editors, buffers can
" " exist in the background without being in a window.
" " http://items.sjbach.com/319/configuring-vim-right
" set hidden
" "turn on syntax highlighting
" syntax on

" Turn Off Swap Files
set noswapfile
set nobackup
set nowb
set updatetime=300

" Persistent Undo
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" Tabs & Indentation
" set smartindent
" set smarttab
" set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent

" " " Auto indent pasted text
" " nnoremap p p=`]<C-o>
" " nnoremap P P=`]<C-o>
"
" filetype plugin on
" filetype indent on
" " Display tabs and trailing spaces visually
" set list listchars=tab:\ \ ,trail:·
" " set nowrap       "Don't wrap lines
set wrap " Line wrapping on
let &showbreak = "↳  "
set linebreak " Wrap lines at convenient points

set cursorline " line on the cursor, d'uh
set signcolumn=yes " Keep sign (gutter) column visible all times

" " Folds
" " set foldmethod=indent " fold based on indent
" " set foldmethod=manual
" set foldmethod=expr " treesitter-based folding
" set foldexpr=nvim_treesitter#foldexpr()
" " set foldnestmax=3 " deepest fold is 3 levels
" set nofoldenable " dont fold by default
"
" " Completion
" set wildmode=list:longest
" set wildmenu "enable ctrl-n and ctrl-p to scroll thru matches
" set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
" set wildignore+=*vim/backups*
" set wildignore+=*sass-cache*
" set wildignore+=*DS_Store*
" set wildignore+=*/vendor/**
" set wildignore+=*/node_modules/**
" set wildignore+=*/log/**
" set wildignore+=*/tmp/**
" set wildignore+=*.gem
" set wildignore+=*.png,*.jpg,*.gif
" set wildignore+=*.so,*.swp,*.zip
"
" Scrolling
set scrolloff=8 "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
"
" Search
set ignorecase " Ignore case when searching...
set smartcase " ...unless we type a capital

" Keymap
"
" make Y consistent with C and D
nnoremap Y y$

" Create window splits easier. The default" way is Ctrl-w,v and Ctrl-w,s. I remap this to vv and ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

"Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<CR>

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


" ---------------------------------------------------
" Color Schemes {{{

" true color setup for vim 8+
set termguicolors

" light / dark background
set background=dark
if $ITERM_PROFILE =~ 'Light'
  set background=light
endif

colorscheme tokyonight

if $ITERM_PROFILE =~ 'Nightfly'
  let g:nightflyCursorColor = v:true
  let g:nightflyItalics = v:true
  " let g:nightflyUndercurls = v:false

  colorscheme nightfly
endif
" }}}

" -------------------------------------------------
"  Misc {{{

" " Show syntax highlighting groups for word under cursor
" nmap <C-S-P> :call <SID>SynStack()<CR>
" function! <SID>SynStack()
"   if !exists("*synstack")
"     return
"   endif
"   echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
" endfunc

if has("nvim")
lua << LUA
  -- Statusline
  require("lualine").setup()
  require("bufferline").setup()

  require('Comment').setup()
  require("which-key").setup()

  -- indent blankline setup
  require("indent_blankline").setup({
    -- show_current_context = true,
    -- show_current_context_start = true,
  })

  -- telescope setup
  require('telescope').setup()
  require("telescope").load_extension("file_browser")

  -- treesitter setup
  require('nvim-treesitter.configs').setup({
    -- A list of parser names, or "all"
    ensure_installed = { "markdown", "html", "json", "tsx", "elm", "lua" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

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
  })

  local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
  ft_to_parser.javascript = "tsx" -- the javascript filetype will use the tsx parser

  require("treesitter-context").setup({
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  })
LUA
endif

" }}}
