-- Add indentation guides even on blank lines, see `:help indent_blankline.txt`
local config = require("core.config")
local exclude_filetypes = {
	"help",
	"alpha",
	"dashboard",
	"neo-tree",
	"Trouble",
	"trouble",
	"lazy",
	"mason",
	"notify",
	"toggleterm",
	"lazyterm",
}

return {
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		config = function()
			require("ibl").setup({
				indent = {
					char = config.icons.ui.Line,
					tab_char = config.icons.ui.Line,
				},
				scope = {
					enabled = false, -- because we use mini.indentline for this (behaviour is a bit different)
				},
				exclude = {
					filetypes = exclude_filetypes,
				},
			})
		end,
	},
	{
		"echasnovski/mini.indentscope",
		version = false,
		event = "VeryLazy",
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = exclude_filetypes,
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
		config = function()
			require("mini.indentscope").setup({
				symbol = config.icons.ui.Line,
				draw = {
					animation = require("mini.indentscope").gen_animation.none(),
				},
				options = {
					indent_at_cursor = false,
					try_as_border = true,
				},
			})
		end,
	},
}
