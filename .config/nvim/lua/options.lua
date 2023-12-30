-- [[ Setting options ]]
-- See `:help vim.opt`

local config = require("core.config")

vim.g.mapleader = "," -- remap leader key

-- vim.opt.colorcolumn = "80"
vim.opt.termguicolors = true -- true color setup
vim.opt.laststatus = 3
vim.opt.showtabline = 2

vim.opt.number = true -- line numbers are good
vim.opt.relativenumber = true -- relative line numbers are veven better

vim.opt.completeopt = "menuone,noselect" -- Set completeopt to have a better completion experience
vim.opt.clipboard = "unnamedplus" -- yank to clipboard
vim.opt.mouse = "a" -- Enable mouse mode

vim.opt.updatetime = 200 -- duration in ms to a) write to swapfile or b) trigger CursorHold autocommand event
vim.opt.signcolumn = "yes" -- keep sign (gutter) column visible all times
vim.opt.cursorline = true -- line on the cursor, d'uh
vim.opt.cmdheight = 2 -- command line is better with 2 lines
-- vim.opt.timeoutlen = 100 -- time in ms to complete a key code sequence

-- scrolling
vim.opt.scrolloff = 8 -- start scrolling when 8 lines away from the margin
vim.opt.sidescrolloff = 15
vim.opt.sidescroll = 1

-- line wrapping
vim.opt.wrap = false
vim.opt.linebreak = true -- break lines on word boundary
vim.cmd("let &showbreak = '" .. config.icons.ui.Forward .. " '")

-- Case insensitive searching UNLESS /C or capital in search
-- vim.opt.incsearch = true
vim.opt.hlsearch = false -- Set highlight on search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Enable auto write
vim.opt.autowrite = true

-- tabs and indentation
vim.opt.shiftround = true -- Round indent to multiple of `shiftwidth`
vim.opt.smartindent = true -- do smart indentation when starting a new line
vim.opt.tabstop = 4 -- number of spaces a <Tab> counts for
vim.opt.shiftwidth = 2 -- number of psaces to use for each step of indent
vim.opt.expandtab = true -- always use spaces instead of tabs

-- Keep undo history across sessions. Only works all the time ;)
vim.opt.undodir = vim.fn.stdpath("data") .. "/backups"
vim.opt.undofile = true

-- turn off swapfiles
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
