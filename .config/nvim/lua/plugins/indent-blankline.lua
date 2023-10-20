-- Add indentation guides even on blank lines, see `:help indent_blankline.txt`
return {
	"lukas-reineke/indent-blankline.nvim",
	event = "VeryLazy",
	config = function()
		require("ibl").setup()
	end,
}
