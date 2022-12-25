-- [[ Setting options ]]
-- See `:help vim.o`

vim.opt.termguicolors = true -- true color setup
vim.opt.laststatus = 3

vim.opt.number = true -- line numbers are good
vim.opt.relativenumber = true -- relative line numbers are veven better

vim.opt.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience
vim.opt.clipboard = 'unnamedplus' -- yank to clipboard
vim.o.mouse = 'a' -- Enable mouse mode
vim.o.hlsearch = false -- Set highlight on search

vim.opt.updatetime = 250
vim.opt.signcolumn = 'yes' -- keep sign (gutter) column visible all times
vim.opt.cursorline = true -- line on the cursor, d'uh
vim.opt.cmdheight = 2 -- command line is better with 2 lines
-- vim.opt.timeoutlen = 100 -- time in ms to complete a key code sequence

-- scrolling
vim.opt.scrolloff = 8 -- start scrolling when 8 lines away from the margin
vim.opt.sidescrolloff = 15
vim.opt.sidescroll = 1

-- line wrapping
vim.opt.wrap = true -- line wrapping on
vim.opt.linebreak = true -- wrap lines at convenient points

-- Case insensitive searching UNLESS /C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

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
local backupdir = vim.fn.stdpath("data") .. "/backups"
if not vim.loop.fs_stat(backupdir) then
  vim.fn.system({ 'mkdir', backupdir, '>', '/dev/null', '2>&1' })
end
vim.opt.undodir = backupdir
vim.opt.undofile = true

vim.opt.list = true
