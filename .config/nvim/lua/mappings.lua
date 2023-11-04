local map = vim.keymap.set

-- make Yank consistent with C and D
map("n", "Y", "y$", { noremap = true, desc = "Yank Line" })

-- Jump to start / end of line
map("n", "H", "^", { noremap = true, desc = "Go to beginning of line" })
map("n", "L", "$", { noremap = true, desc = "Go to end of line" })

-- Remap for dealing with word wrap
map("n", "j", 'v:count == 0 ? "gj" : "j"', { expr = true, silent = true })
map("n", "k", 'v:count == 0 ? "gk" : "k"', { expr = true, silent = true })

-- Create window splits easier. The default' way is Ctrl-w,v and Ctrl-w,s. I remap this to vv and ss
map("n", "vv", "<C-w>v", { desc = "Create vertical split" })
map("n", "ss", "<C-w>s", { desc = "Create horizontal split" })

-- Clear current search highlight by double tapping //
-- map('n', '//', ':nohlsearch<CR>', { noremap = true, silent = true })
