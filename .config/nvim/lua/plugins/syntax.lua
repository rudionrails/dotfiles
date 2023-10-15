return {
	-- Detect tabstop and shiftwidth automatically
	{ "tpope/vim-sleuth" },

	-- git support
	{ "tpope/vim-fugitive" },

	-- git in signcolumn, see `:help gitsigns.txt`
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("gitsigns").setup()
		end,
	},

	{
		"windwp/nvim-autopairs",
		event = { "InsertEnter" },
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
		config = function()
			-- import nvim-autopairs
			local autopairs = require("nvim-autopairs")
			-- import nvim-autopairs completion functionality
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			-- import nvim-cmp plugin (completions plugin)
			local cmp = require("cmp")

			-- configure autopairs
			autopairs.setup({
				check_ts = true, -- enable treesitter
				ts_config = {
					lua = { "string" }, -- don't add pairs in lua string treesitter nodes
					javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
					java = false, -- don't check treesitter on java
				},
			})

			-- make autopairs and completion work together
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},

	{
		-- color highlighter
		"NvChad/nvim-colorizer.lua",
		event = "VeryLazy",
		config = function()
			require("colorizer").setup()
		end,
	},

	-- Add indentation guides even on blank lines, see `:help indent_blankline.txt`
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		config = function()
			require("ibl").setup()
		end,
	},

	-- 'gc' to comment visual regions/lines
	{
		"numToStr/Comment.nvim",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			require("Comment").setup({
				-- for commenting tsx and jsx files
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})

			-- toggle comment in both modes
			-- vim.keymap.set("n", "<leader>/", function()
			-- 	require("Comment.api").toggle.linewise.current()
			-- end, { desc = "Toggle comment" })
			--
			-- vim.keymap.set("v", "<leader>/", function()
			-- 	require("Comment.api").toggle.linewise(vim.fn.visualmode())
			-- end, { desc = "Toggle comment" })
		end,
	},

	{
		-- Highlight, edit, and navigate code, see `:help nvim-treesitter`
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context", -- shows context of currently visible buffer contents
			"nvim-treesitter/nvim-treesitter-textobjects", -- Additional text objects via treesitter
			-- 'nvim-treesitter/playground',                  -- show treesitter info in vim
		},
		-- cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		config = function()
			vim.treesitter.language.register("tsx", "javascript") -- the javascript filetype will use the tsx parser

			require("nvim-treesitter.configs").setup({
				auto_install = true,

				ensure_installed = { "lua", "tsx" },
				ignore_install = { "javascript" },

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
				-- incremental_selection = {
				--   enable = true,
				--   keymaps = {
				--     init_selection = "<C-space>",
				--     node_incremental = "<C-space>",
				--     scope_incremental = false,
				--     node_decremental = "<bs>",
				--   },
				-- },
			})

			require("treesitter-context").setup()

			-- -- Show treesitter capture group for textobject under cursor (nvim-treesitter/playground)
			-- vim.keymap.set('n', '<C-e>', ':TSHighlightCapturesUnderCursor<CR>', { noremap = true, silent = true })
		end,
	},
}
