-- fancy top buffer manager
return {
	"akinsho/bufferline.nvim",
	version = "*",
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("bufferline").setup({
			options = {
				-- separator_style = "slant",
				-- separator_style = 'thick',
				diagnostics = "nvim_lsp",
				offsets = {
					{ filetype = "NvimTree", text = "NvimTree", highlight = "Directory", text_align = "left" },
					{ filetype = "neo-tree", text_align = "left" },
				},
			},
		})

		vim.keymap.set("n", "<Left>", ":BufferLineCyclePrev<CR>", { silent = true, desc = "Goto left buffer" })
		vim.keymap.set("n", "<Right>", ":BufferLineCycleNext<CR>", { silent = true, desc = "Goto right buffer" })
		vim.keymap.set("n", "<Up>", ":BufferLineCloseOthers<CR>", { silent = true, desc = "Close other buffers" })
		vim.keymap.set("n", "<Down>", ":e#<CR>", { silent = true, desc = "Toggle to previous buffer" })
	end,
}
