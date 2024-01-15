-- Markdown preview inside NeoVim
-- @see https://github.com/ellisonleao/glow.nvim
return {
	{
		"ellisonleao/glow.nvim",
		cmd = "Glow",
		config = function()
			require("glow").setup({
				border = "rounded",
			})
		end,
	},
}
