-- fancy top buffer manager
return {
	-- @see https://github.com/akinsho/bufferline.nvim
	"akinsho/bufferline.nvim",
	version = false,
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<left>", "<CMD> BufferLineCyclePrev <CR>", silent = true, desc = "Goto left buffer" },
		{ "<right>", "<CMD> BufferLineCycleNext <CR>", silent = true, desc = "Goto right buffer" },
		{ "<up>", "<CMD> BufferLineCloseOthers <CR>", silent = true, desc = "Close other buffers" },
		{ "<down>", ":e#<CR>", silent = true, desc = "Toggle to previous buffer" },
	},
	-- init = function()
	-- 	local map = vim.keymap.set
	--
	-- 	map("n", "<left>", "<CMD> BufferLineCyclePrev <CR>", { silent = true, desc = "Goto left buffer" })
	-- 	map("n", "<right>", "<CMD> BufferLineCycleNext <CR>", { silent = true, desc = "Goto right buffer" })
	-- 	map("n", "<up>", "<CMD> BufferLineCloseOthers <CR>", { silent = true, desc = "Close other buffers" })
	-- 	map("n", "<down>", ":e#<CR>", { silent = true, desc = "Toggle to previous buffer" })
	-- end,
	config = function()
		-- :h bufferline-configuration
		require("bufferline").setup({
			options = {
				separator_style = { "|", "|" }, -- "slant", | "slope" | "thick" | "thin" | { 'any', 'any' },
				diagnostics = "nvim_lsp",
				-- numbers = "id",
				offsets = {
					-- { filetype = "NvimTree", text = "NvimTree", highlight = "Directory", text_align = "left" },
					{ filetype = "neo-tree", text_align = "left" },
				},
			},
		})
	end,
}
