-- A IDE-style winbar for Neovim
return {
	"utilyre/barbecue.nvim",
	version = "*",
	event = "VeryLazy",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons", -- optional dependency
	},
	config = function()
		require("barbecue").setup()
	end,
}
