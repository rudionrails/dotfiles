-- Fancier statusline, see `:help lualine.txt`
return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	event = "VeryLazy",
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				globalstatus = false,
				section_separators = "║",
				component_separators = "│",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {},
				lualine_c = {
					-- { 'filetype', icon_only = true, separator = '', padding = { left = 1, right = 0 } },
					-- { "filetype", separator = "", padding = { left = 1, right = 0 } },
					{ "filetype" },
					{ "filename", path = 1 },
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						-- symbols = { error = "✘ ", warn = "▲ ", hint = "⚑ ", info = " " },
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
					},
				},
				lualine_x = {
					"branch",
					{
						"diff",
						symbols = {
							added = " ",
							modified = " ",
							removed = " ",
						},
					},
				},
				lualine_y = {},
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{ "filetype" },
					{ "filename", path = 1 },
				},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			extensions = {
				"lazy",
				"trouble",
				"neo-tree",
			},
		})
	end,
}
