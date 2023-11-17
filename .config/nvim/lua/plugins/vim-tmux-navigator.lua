-- tmux setup
return {
	"christoomey/vim-tmux-navigator",
	dependencies = {
		"jby/tmux.vim",
	},
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
	},
	init = function()
		local map = vim.keymap.set

		-- ' Don't allow any default key-mappings.
		vim.cmd("let g:tmux_navigator_no_mappings = 1")

		map("n", "<C-h>", "<CMD> TmuxNavigateLeft <CR>", { silent = true })
		map("n", "<C-j>", "<CMD> TmuxNavigateDown <CR>", { silent = true })
		map("n", "<C-k>", "<CMD> TmuxNavigateUp <CR>", { silent = true })
		map("n", "<C-l>", "<CMD> TmuxNavigateRight <CR>", { silent = true })
	end,
}
