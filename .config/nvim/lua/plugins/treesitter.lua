-- Highlight, edit, and navigate code, see `:help nvim-treesitter`
return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			-- "nvim-treesitter/nvim-treesitter-context", -- shows context of currently visible buffer contents
			"nvim-treesitter/nvim-treesitter-textobjects", -- Additional text objects via treesitter
			"RRethy/nvim-treesitter-textsubjects", -- Location and syntax aware text objects which *do what you mean*
			-- 'nvim-treesitter/playground',                  -- show treesitter info in vim
		},
		-- cmd = {
		-- 	"TSInstall",
		-- 	"TSUninstall",
		-- 	"TSUpdate",
		-- 	"TSUpdateSync",
		-- 	"TSInstallInfo",
		-- 	"TSInstallSync",
		-- 	"TSInstallFromGrammar",
		-- },
		build = ":TSUpdate",
		config = function()
			-- local utils = require("lvim.utils")
			-- local path = utils.join_paths(get_runtime_dir(), "site", "pack", "lazy", "opt", "nvim-treesitter")
			-- vim.opt.rtp:prepend(path) -- treesitter needs to be before nvim's runtime in rtp
			-- require("lvim.core.treesitter").setup()

			vim.treesitter.language.register("typescript", "javascript") -- the javascript filetype will use the tsx parser

			require("nvim-treesitter.configs").setup({
				auto_install = true,

				ensure_installed = {
					"vim",
					"regex",
					"lua",
					"bash",
					"markdown",
					"markdown_inline",
					"tsx",
					"typescript",
					"rust",
					"toml",
				},
				ignore_install = { "javascript" },

				-- indent = {
				-- 	enable = true,
				-- },

				highlight = {
					enable = true,
					use_languagetree = true,

					-- disable treesitter highlight for large files
					disable = function(_, bufnr) -- Disable in large C++ buffers
						-- return lang == "cpp" and api.nvim_buf_line_count(bufnr) > 50000
						return vim.api.nvim_buf_line_count(bufnr) > 10000
					end,
				},

				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},

				-- nvim-treesitter-textsubjects plugin
				textsubjects = {
					enable = true,
					-- prev_selection = ",", -- (Optional) keymap to select the previous selection
					keymaps = {
						["."] = "textsubjects-smart",
						[";"] = "textsubjects-container-outer",
						-- ["i;"] = "textsubjects-container-inner",
						["i;"] = {
							"textsubjects-container-inner",
							desc = "Select inside containers (classes, functions, etc.)",
						},
					},
				},
			})

			-- require("treesitter-context").setup()

			-- -- Show treesitter capture group for textobject under cursor (nvim-treesitter/playground)
			-- vim.keymap.set('n', '<C-e>', ':TSHighlightCapturesUnderCursor<CR>', { noremap = true, silent = true })
		end,
	},
	{
		-- Use treesitter to auto close and auto rename html tag
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({})
		end,
	},
}
