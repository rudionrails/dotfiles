local icons = require("core.icons")

return {
	{ import = "plugins.navigation" },

	-- Navigate your code with search labels, enhanced character motions and Treesitter integration
	-- @see https://github.com/folke/flash.nvim
	{
		"folke/flash.nvim",
		event = "VeryLazy", -- "User FileOpened"
		opts = {
			modes = { char = { jump_labels = true } },
		},
	},

	-- tmux navigation
	{
		"christoomey/vim-tmux-navigator",
		dependencies = { "jby/tmux.vim" },
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
		},
		keys = {
			{ "<C-h>", "<CMD> TmuxNavigateLeft <CR>" },
			{ "<C-j>", "<CMD> TmuxNavigateDown <CR>" },
			{ "<C-k>", "<CMD> TmuxNavigateUp <CR>" },
			{ "<C-l>", "<CMD> TmuxNavigateRight <CR>" },
		},
	},

	-- multiple cursors
	{ "mg979/vim-visual-multi", lazy = true },

	-- displays a popup with possible key bindings of the command
	{
		"folke/which-key.nvim",
		event = { "VeryLazy" }, -- User FileOpened"},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
		opts = {
			preset = "helix",
		},
	},
}
