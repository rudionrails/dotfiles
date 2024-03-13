-- A tree like view for symbols in Neovim using the Language Server Protocol. Supports all your favourite languages.
--
-- @see https://github.com/simrat39/symbols-outline.nvim
return {
	"simrat39/symbols-outline.nvim",
	event = "VeryLazy",
	config = function()
		require("symbols-outline").setup()
	end,
}
