-- make Yank consistent with C and D
vim.keymap.set("n", "Y", "y$", { noremap = true, desc = "Yank Line" })

-- Jump to start / end of line
vim.keymap.set("n", "H", "^", { noremap = true, desc = "Go to beginning of line" })
vim.keymap.set("n", "L", "$", { noremap = true, desc = "Go to end of line" })

-- Remap for dealing with word wrap
vim.keymap.set("n", "j", 'v:count == 0 ? "gj" : "j"', { expr = true, silent = true })
vim.keymap.set("n", "k", 'v:count == 0 ? "gk" : "k"', { expr = true, silent = true })

-- Create window splits easier. The default' way is Ctrl-w,v and Ctrl-w,s. I remap this to vv and ss
vim.keymap.set("n", "vv", "<C-w>v", { desc = "Create vertical split" })
vim.keymap.set("n", "ss", "<C-w>s", { desc = "Create horizontal split" })

-- Clear current search highlight by double tapping //
-- vim.keymap.set('n', '//', ':nohlsearch<CR>', { noremap = true, silent = true })
