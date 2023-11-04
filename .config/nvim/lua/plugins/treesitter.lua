-- Highlight, edit, and navigate code, see `:help nvim-treesitter`
return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		-- "nvim-treesitter/nvim-treesitter-context", -- shows context of currently visible buffer contents
		"nvim-treesitter/nvim-treesitter-textobjects", -- Additional text objects via treesitter
		"RRethy/nvim-treesitter-textsubjects", -- Location and syntax aware text objects which *do what you mean*
		-- 'nvim-treesitter/playground',                  -- show treesitter info in vim
	},
	-- cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
	build = ":TSUpdate",
	config = function()
		vim.treesitter.language.register("typescript", "javascript") -- the javascript filetype will use the tsx parser

		require("nvim-treesitter.configs").setup({
			auto_install = true,

			ensure_installed = { "vim", "regex", "lua", "bash", "markdown", "markdown_inline", "tsx", "typescript" },
			-- ignore_install = { "javascript" },

			indent = { enable = true },
			highlight = {
				enable = true,
				use_languagetree = true,

				-- disable treesitter highlight for large files
				disable = function(_, buf)
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
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
}
