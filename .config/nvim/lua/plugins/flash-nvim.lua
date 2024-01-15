-- Navigate your code with search labels, enhanced character motions and Treesitter integration
-- @see https://github.com/folke/flash.nvim
return {
	"folke/flash.nvim",
	event = "VeryLazy",
	config = function()
		require("flash").setup({
			-- modes = {
			-- 	char = {
			-- 		jump_labels = true,
			-- 	},
			-- },
		})
	end,
}
