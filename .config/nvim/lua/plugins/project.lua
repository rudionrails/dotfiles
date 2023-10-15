return {
	-- colorschemes
	{
		"folke/tokyonight.nvim",
		dependencies = {
			{ "Everblush/nvim", name = "everblush" },
			{ "rose-pine/neovim", name = "rose-pine" },
			"navarasu/onedark.nvim",
			"bluz71/vim-nightfly-guicolors",
		},
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("tokyonight").setup({
				on_highlights = function(hi, c)
					-- hi.IndentBlanklineContextStart = { fg = c.bg, bg = c.purple }
					hi.CmpDocumentationBorder = { fg = c.purple }
				end,
			})
			-- vim.cmd [[ colorscheme tokyonight-night ]]

			-- require('rose-pine').setup({
			--   --- @usage 'main' | 'moon'
			--   dark_variant = 'moon',
			--   highlight_groups = {
			--     IlluminatedWordRead = { bg = "highlight_med" },
			--     IlluminatedWordWrite = { bg = "highlight_med" },
			--
			--     IndentBlanklineContextStart = { bg = "foam", blend = 20 },
			--   },
			-- })
			-- vim.cmd [[ colorscheme rose-pine ]]

			-- local p = require('everblush.palette')
			-- require('everblush').setup({
			--   override = {
			--     FloatBorder = { fg = p.color15 },
			--
			--     -- nvim-treesitter/nvim-treesitter-context
			--     TreesitterContext = { bg = p.color8 },
			--
			--     IlluminatedWordRead = { underline = true },
			--     IlluminatedWordWrite = { underline = true },
			--
			--     -- IndentBlanklineContextStart = { fg = p.contrast, bg = p.color4 },
			--
			--     -- TelescopeNormal = { fg = p.foreground, bg = p.background },
			--     TelescopeBorder = { link = "FloatBorder" },
			--   },
			-- })
			-- vim.cmd [[ colorscheme everblush ]]

			require("onedark").setup({
				-- style = 'deep',
			})
			-- vim.cmd.colorscheme "onedark"
			vim.cmd.colorscheme("tokyonight-moon")
		end,
	},

	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},

	{
		-- Better `vim.notify()`
		"rcarriga/nvim-notify",
		config = function()
			local notify = require("notify")

			notify.setup({
				timeout = 1000,
				max_height = function()
					return math.floor(vim.o.lines * 0.75)
				end,
				max_width = function()
					return math.floor(vim.o.columns * 0.75)
				end,
			})

			vim.keymap.set("n", "<leader>un", function()
				notify.dismiss({ silent = true, pending = true })
			end, { silent = true, desc = "Dismiss all Notifications" })

			vim.notify = notify
		end,
	},

	{
		-- Fancier statusline, see `:help lualine.txt`
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		event = "VeryLazy",
		config = function()
			require("lualine").setup({
				options = {
					globalstatus = false,
					section_separators = "║",
					component_separators = "│",
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = {
						{
							"diagnostics",
							sources = { "nvim_diagnostic" },
							symbols = { error = "✘ ", warn = "▲ ", hint = "⚑ ", info = " " },
						},
					},
					lualine_c = {
						-- { 'filetype', icon_only = true, separator = '', padding = { left = 1, right = 0 } },
						{ "filetype", separator = "", padding = { left = 1, right = 0 } },
						{ "filename", path = 1 },
					},
					-- lualine_x = { 'branch' },
					lualine_x = { "branch" },
					lualine_y = { "diff" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {
						{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
						{ "filename", path = 1 },
					},
					lualine_x = {},
					lualine_y = {},
					lualine_z = { "location" },
				},
			})
		end,
	},

	{
		-- fancy top buffer manager
		"akinsho/bufferline.nvim",
		verwion = "*",
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
			vim.keymap.set(
				"n",
				"<Up>",
				":BufferLineCloseLeft<CR> :BufferLineCloseRight<CR>",
				{ silent = true, desc = "Close all buffers but this one" }
			)
			vim.keymap.set("n", "<Down>", ":e#<CR>", { silent = true, desc = "Toggle to previous buffer" })
		end,
	},

	-- displays a popup with possible key bindings of the command
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			require("which-key").setup({
				window = {
					border = "shadow", -- none, single, double, shadow
					-- position = "bottom", -- bottom, top
					-- margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
					-- padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
					-- winblend = 0
				},
			})
		end,
	},
}
