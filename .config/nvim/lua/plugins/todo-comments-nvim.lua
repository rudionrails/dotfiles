-- Highlight, list and search todo comments in your projects
-- @see https://github.com/folke/todo-comments.nvim
return {
	"folke/todo-comments.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	event = "VeryLazy",
	config = function()
		require("todo-comments").setup({})
	end,
}
