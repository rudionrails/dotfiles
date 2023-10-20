-- tmux setup
return {
	"christoomey/vim-tmux-navigator",
	dependencies = {
		"jby/tmux.vim",
	},
	init = function()
		-- ' Don't allow any default key-mappings.
		vim.cmd("let g:tmux_navigator_no_mappings = 1")

		vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>", { silent = true })
		vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>", { silent = true })
		vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>", { silent = true })
		vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>", { silent = true })
	end,
}
