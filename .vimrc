" ---------------------------------------------------
" Init {{{
call plug#begin('~/.vim/plugged')

Plug 'flazz/vim-colorschemes'
Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'kyoz/purify', { 'rtp': 'vim' }
" Plug 'chriskempson/base16-vim'
" Plug 'haishanh/night-owl.vim'
" Plug 'danilo-augusto/vim-afterglow'
" Plug 'rakr/vim-one'

Plug 'sheerun/vim-polyglot'
  " set correct filetype for markdown
  autocmd BufRead,BufNewFile {*.markdown,*.md} set filetype=markdown
  " good bye syntax highlighting for markdown
  let g:polyglot_disabled = ['markdown']

Plug 'scrooloose/nerdtree'
  " Make nerdtree look nice
  let g:NERDTreeMinimalUI = 1
  let g:NERDTreeDirArrows = 1
  let g:NERDTreeWinSize = 45
  let g:NERDTreeShowLineNumbers=1
  " close nerdtree when opening a file
  let g:NERDTreeQuitOnOpen = 1
  " close vim if NERDTree is the last/only buffer
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

Plug 'jeetsukumaran/vim-buffergator'
  let g:buffergator_split_size = 10
  let g:buffergator_viewport_split_policy = 'B'

" @see https://github.com/junegunn/fzf.vim
" brew install fzf
" Plug '/usr/local/opt/fzf'
" Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'neoclide/coc.nvim', {'branch': 'release'}
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction
  inoremap <silent><expr> <TAB>
        \   pumvisible() ? "\<C-n>" :
        \   <SID>check_back_space() ? "\<TAB>" :
        \   coc#refresh()
  " Use <Tab> and <S-Tab> to navigate the completion list:
  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  " Use <cr> to confirm completion
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  " To make <cr> select the first completion item and confirm the completion when no item has been selected
  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
  " Close the preview window when completion is done
  autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

Plug 'vim-scripts/BufOnly.vim'
Plug 'Lokaltog/vim-easymotion'

Plug 'terryma/vim-multiple-cursors' " MultiCursor Editing
  " Turn off default key mappings
  let g:multi_cursor_use_default_mapping=0
  " Switch to multicursor mode with ,mc
  let g:multi_cursor_start_key=',mc'
  " Ctrl-n, Ctrl-p, Ctrl-x, and <Esc> are mapped in the special multicursor
  " mode once you've added at least one virtual cursor to the buffer
  let g:multi_cursor_next_key='<C-n>'
  let g:multi_cursor_prev_key='<C-p>'
  let g:multi_cursor_skip_key='<C-x>'
  let g:multi_cursor_quit_key='<Esc>'

" Plug 'mhinz/vim-startify'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

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
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

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

Plug 'Yggdroot/indentLine'
  let g:indentLine_showFirstIndentLevel = 1
  " let g:indentLine_setColors = 0
  let g:indentLine_fileTypeExclude = ['ghmarkdown']
  let g:indentLine_bufNameExclude = ['NERD_tree.*']
  " let g:indentLine_color_term = 236
  let g:indentLine_indentLevel = 8
  let g:indentLine_faster = 1
  " au BufRead,BufEnter,BufNewFile * IndentLinesReset

Plug 'craigemery/vim-autotag'

Plug 'prettier/vim-prettier', {
  \   'do': 'yarn install'
  \ }
  " only execute automatically when .prettierrc.js is present
  function! PrettierConditionally()
     if filereadable('.prettierrc.js')
       exec 'Prettier'
     endif
  endfunction

  let g:prettier#autoformat = 0
  autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html call PrettierConditionally()

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
set nocompatible                " Use Vim settings, rather then Vi settings (much better!).
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
" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden
"turn on syntax highlighting
syntax on
" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","

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
set wrap  " Line wrapping on
let &showbreak = "↳  "
set linebreak    "Wrap lines at convenient points
set cursorline
set signcolumn=yes " Keep sign (gutter) column visible all times

" Folds
set foldmethod=indent   " fold based on indent
" set foldnestmax=3       " deepest fold is 3 levels
set nofoldenable        " dont fold by default

" Completion
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
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
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Search
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

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
" noremap <silent> <C-n> :NERDTreeToggle<CR>
noremap <silent> <C-f> :NERDTreeFind<CR>
noremap <silent> <C-b> :BuffergatorToggle<CR>
" " folding magic
" nnoremap <space> za
" nnoremap <C-space> zA
" }}}

" ---------------------------------------------------
" Color Schemes {{{
" true color setup for neovim"
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" true color setup for vim 8
if (has("termguicolors"))
  set termguicolors
endif

" light / dark background
set background=dark
if $ITERM_PROFILE =~ 'Light'
  set background=light
endif

" colorschemes for iTerm
if $ITERM_PROFILE =~ 'Gruvbox'
  let g:gruvbox_contrast_dark = 'soft'
  let g:gruvbox_contrast_light = 'soft'

  colorscheme gruvbox
endif
if $ITERM_PROFILE =~ 'Solarized'
  colorscheme solarized
endif
if $ITERM_PROFILE =~ "Dracula"
  colorscheme dracula
endif

" colorschems for Hyper terminal
if $TERM_PROGRAM =~ "Hyper"
  if $HYPER_PROFILE =~ "daywalker"
    colorscheme daywalker
  endif
endif

" colorscheme daywalker

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
" }}}
