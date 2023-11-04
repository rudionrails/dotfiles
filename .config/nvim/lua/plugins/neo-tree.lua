-- file explorer
return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	},
	cmd = "Neotree",
	keys = {
		{ "<leader>e", "<CMD> Neotree float reveal<CR>", silent = true, desc = "File [E]xplorer (NeoTree)" },
	},
	config = function()
		require("neo-tree").setup({
			window = {
				mappings = {
					["<space>"] = "none",
					["l"] = "open",
					["h"] = "close_node",
				},
			},
		})
	end,
}
