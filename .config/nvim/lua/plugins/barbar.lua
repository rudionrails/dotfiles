-- fancy top buffer manager
return {
	"romgrk/barbar.nvim",
	event = "VeryLazy",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	init = function()
		vim.g.barbar_auto_setup = false

		local map = vim.keymap.set

		map("n", "<Left>", "<CMD> BufferPrevious <CR>", { silent = true, desc = "Goto left buffer" })
		map("n", "<Right>", "<CMD> BufferNext <CR>", { silent = true, desc = "Goto right buffer" })
		map("n", "<Up>", "<CMD> BufferCloseAllButCurrent <CR>", { silent = true, desc = "Close other buffers" })
		map("n", "<Down>", ":e#<CR>", { silent = true, desc = "Toggle to previous buffer" })
	end,
	config = function()
		require("barbar").setup()
	end,
}

-- @see https://github.com/akinsho/bufferline.nvim
-- return {
-- 	"akinsho/bufferline.nvim",
-- 	version = false,
-- 	event = "VeryLazy",
-- 	dependencies = {
-- 		"nvim-tree/nvim-web-devicons",
-- 	},
-- 	config = function()
-- 		require("bufferline").setup({
-- 			options = {
-- 				-- separator_style = { "|", "|" }, -- "slant", | "slope" | "thick" | "thin" | { 'any', 'any' },
-- 				diagnostics = "nvim_lsp",
-- 				-- numbers = "id",
-- 				offsets = {
-- 					-- { filetype = "NvimTree", text = "NvimTree", highlight = "Directory", text_align = "left" },
-- 					{ filetype = "neo-tree", text_align = "left" },
-- 				},
-- 			},
-- 		})
-- 	end,
-- 	init = function()
-- 		local map = vim.keymap.set
--
-- 		map("n", "<Left>", "<CMD> BufferLineCyclePrev <CR>", { silent = true, desc = "Goto left buffer" })
-- 		map("n", "<Right>", "<CMD> BufferLineCycleNext <CR>", { silent = true, desc = "Goto right buffer" })
-- 		map("n", "<Up>", "<CMD> BufferLineCloseOthers <CR>", { silent = true, desc = "Close other buffers" })
-- 		map("n", "<Down>", ":e#<CR>", { silent = true, desc = "Toggle to previous buffer" })
-- 	end,
-- }
