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

-- -- similar alternative, but requires nvim-0.10+
-- return {
-- 	"Bekaboo/dropbar.nvim",
-- 	-- optional, but required for fuzzy finder support
-- 	dependencies = {
-- 		"nvim-telescope/telescope-fzf-native.nvim",
-- 	},
-- }
