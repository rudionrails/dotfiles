-- [[ Setting options ]]
-- See `:help vim.o`

vim.g.mapleader = ',' -- remap leader key

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- vim.opt.colorcolumn = "80"
vim.opt.termguicolors = true -- true color setup
vim.opt.laststatus = 3
vim.opt.showtabline = 2

vim.opt.number = true                    -- line numbers are good
vim.opt.relativenumber = true            -- relative line numbers are veven better

vim.opt.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience
vim.opt.clipboard = 'unnamedplus'        -- yank to clipboard
vim.opt.mouse = 'a'                      -- Enable mouse mode
vim.opt.hlsearch = false                 -- Set highlight on search

vim.opt.updatetime = 250
vim.opt.signcolumn = 'yes' -- keep sign (gutter) column visible all times
vim.opt.cursorline = true  -- line on the cursor, d'uh
vim.opt.cmdheight = 2      -- command line is better with 2 lines
-- vim.opt.timeoutlen = 100 -- time in ms to complete a key code sequence

-- scrolling
vim.opt.scrolloff = 8 -- start scrolling when 8 lines away from the margin
vim.opt.sidescrolloff = 15
vim.opt.sidescroll = 1

-- line wrapping
vim.opt.wrap = true
vim.opt.linebreak = true -- break lines on word boundary
vim.cmd [[ let &showbreak = '↳  ' ]]

-- Case insensitive searching UNLESS /C or capital in search
-- vim.opt.hlsearch = true
-- vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Enable auto write
vim.opt.autowrite = true

-- turn off swapfiles
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- tabs and indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Keep undo history across sessions. Only works all the time ;)
vim.opt.undodir = vim.fn.stdpath("data") .. "/backups"
vim.opt.undofile = true
