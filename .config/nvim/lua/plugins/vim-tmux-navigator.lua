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
	keys = {
		{ "<C-h>", "<CMD> TmuxNavigateLeft <CR>", silent = true },
		{ "<C-j>", "<CMD> TmuxNavigateDown <CR>", silent = true },
		{ "<C-k>", "<CMD> TmuxNavigateUp <CR>", silent = true },
		{ "<C-l>", "<CMD> TmuxNavigateRight <CR>", silent = true },
	},
}
