-- [[ Setting options ]]
-- See `:help vim.opt`

local icons = require("core.icons")

vim.g.mapleader = "," -- remap leader key

vim.opt.background = "dark"

-- vim.opt.colorcolumn = "80"
vim.opt.termguicolors = true -- true color setup
vim.opt.laststatus = 3
-- vim.opt.showtabline = 2

vim.opt.number = true -- line numbers are good
vim.opt.relativenumber = true -- relative line numbers are veven better

vim.opt.completeopt = { "menuone", "noselect" } -- better completion experience
vim.opt.clipboard = "unnamedplus" -- yank to clipboard
vim.opt.mouse = "a" -- Enable mouse mode

vim.opt.signcolumn = "yes" -- keep sign (gutter) column visible all times
vim.opt.cursorline = true -- line on the cursor, d'uh
vim.opt.cmdheight = 2 -- command line is better with 2 lines
vim.opt.timeoutlen = 500 -- time in ms to complete a key code sequence
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files

-- scrolling
vim.opt.scrolloff = 8 -- minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 15 -- minimal numbeenable break indentr of screen lines to keep left and right of the cursor
vim.opt.sidescroll = 1

-- line wrapping
vim.opt.wrap = true -- disable line wrap
vim.opt.linebreak = true -- break lines on word boundary
vim.opt.breakindent = true -- every wrapped line will continue visully indented
vim.cmd("let &showbreak = '" .. icons.ui.Forward .. " '")

-- Case insensitive searching UNLESS /C or capital in search
-- vim.opt.incsearch = true
vim.opt.hlsearch = true -- Set highlight on search
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.smartcase = true -- smart case

-- tabs and indentation
vim.opt.shiftround = true -- Round indent to multiple of `shiftwidth`
vim.opt.smartindent = true -- do smart indentation when starting a new line
vim.opt.tabstop = 2 -- number of spaces a <Tab> counts for
vim.opt.shiftwidth = 2 -- number of psaces to use for each step of indent
vim.opt.expandtab = true -- always use spaces instead of tabs

-- autowrite
vim.opt.autowrite = true -- automatically write to file
vim.opt.updatetime = 500 -- duration in ms to a) write to swapfile or b) trigger CursorHold autocommand event

-- Keep undo history across sessions. Only works all the time ;)
vim.opt.undodir = vim.fn.stdpath("data") .. "/backups" -- set an undodir
vim.opt.undofile = true -- enable persistent undo
vim.opt.undolevels = 10000

-- turn off swapfiles
vim.opt.backup = false
vim.opt.swapfile = false -- do not create swapfiles
vim.opt.writebackup = false -- if a file is being edited by another program, it is not allowed to be edited

vim.opt.spelllang:append("cjk") -- disable spellchecking for asian characters (VIM algorithm does not support it)
vim.opt.shortmess:append("c") -- don't show redundant messages from ins-completion-menu
vim.opt.shortmess:append("I") -- don't show the default intro message
vim.opt.whichwrap:append("<,>,[,],h,l")
