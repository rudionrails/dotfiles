-- color highlighter
return {
	"NvChad/nvim-colorizer.lua",
	config = function()
		vim.notify("nvim-colorizer")
		require("colorizer").setup({})
	end,
}
