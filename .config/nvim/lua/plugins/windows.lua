-- fancy resize buffers (with animations)
return {
	"anuvyklack/windows.nvim",
	event = "VeryLazy",
	dependencies = {
		{ "anuvyklack/middleclass" },
		{ "anuvyklack/animation.nvim" },
	},
	keys = {
		{ "<C-m>", ":WindowsMaximize<CR>", silent = true, desc = "[M]aximize current buffer" },
	},
	config = function()
		vim.opt.winwidth = 5
		vim.opt.winminwidth = 5
		vim.opt.equalalways = false

		require("windows").setup({
			animation = {
				duration = 150,
			},
		})
	end,
}
