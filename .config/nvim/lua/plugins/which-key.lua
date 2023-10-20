-- displays a popup with possible key bindings of the command
return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		require("which-key").setup({
			window = {
				border = "shadow", -- none, single, double, shadow
				-- position = "bottom", -- bottom, top
				-- margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
				-- padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
				-- winblend = 0
			},
		})
	end,
}
