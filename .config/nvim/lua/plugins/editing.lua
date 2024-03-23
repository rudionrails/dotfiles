return {
	-- open file given a line, e.g. vim index.html:20
	{ "bogado/file-line" },

	-- A Git wrapper so awesome, it should be illegal
	-- TODO: Review if I am using this from within nvim
	{ "tpope/vim-fugitive", cmd = "Git" },

	-- A high-performance color highlighter
	--
	-- @see https://neovimcraft.com/plugin/NvChad/nvim-colorizer.lua
	{
		"NvChad/nvim-colorizer.lua",
		-- lazy = true,
		config = function()
			require("colorizer").setup({
				user_default_options = {
					tailwind = true,
				},
			})
		end,
	},

	-- 'gc' to comment visual regions/lines
	{
		"numToStr/Comment.nvim",
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		event = { "BufReadPost" },
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

	-- Highlight, list and search todo comments in your projects
	-- @see https://github.com/folke/todo-comments.nvim
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "VeryLazy", -- event = "VimEnter",
		opts = {
			-- do not show icon in signcolumn
			signs = false,
		},
	},

	-- TODO: Review if I am just too lazy to type closing pairs
	{
		"windwp/nvim-autopairs",
		event = { "InsertEnter" },
		dependencies = { "hrsh7th/nvim-cmp" },
		config = function()
			local autopairs = require("nvim-autopairs")
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
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

	-- git in signcolumn, see `:help gitsigns.txt`
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPost" },
		config = function()
			local gitsigns = require("gitsigns")
			local utils = require("core.utils")

			gitsigns.setup({
				yadm = {
					enable = true,
				},

				on_attach = function(buffer)
					local map = function(mode, mapping, fn, opts)
						vim.keymap.set(mode, mapping, fn, utils.merge({ buffer = buffer }, opts))
					end

					-- Navigation
					map("n", "]c", function()
						if vim.wo.diff then
							return "]c"
						end

						vim.schedule(function()
							gitsigns.next_hunk()
						end)

						return "<Ignore>"
					end, { expr = true })

					map("n", "[c", function()
						if vim.wo.diff then
							return "[c"
						end

						vim.schedule(function()
							gitsigns.prev_hunk()
						end)

						return "<Ignore>"
					end, { expr = true })

					-- Actions
					-- map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "[G]it [S]tage hunk" })
					-- map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "[G]it [R]eset hunk" })
					-- map("v", "<leader>gs", function()
					-- 	gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
					-- end, { desc = "[G]it [S]tage [h]unk" })
					-- map("v", "<leader>hr", function()
					-- 	gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
					-- end, { desc = "[G]it [R]eset hunk " })
					map("n", "<leader>gs", gitsigns.stage_buffer, { desc = "[G]it [S]tage buffer" })
					-- map("n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = "Git undo stage hunk" })
					map("n", "<leader>gr", gitsigns.reset_buffer, { desc = "[G]it [R]eset buffer" })
					-- map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Git preview hunk" })
					-- map("n", "<leader>hb", function()
					-- 	gitsigns.blame_line({ full = true })
					-- end, { desc = "Git blame line" })
					-- map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Git toggle blame" })
					-- map("n", "<leader>hd", gitsigns.diffthis, { desc = "Git diff" })
					-- map("n", "<leader>hD", function()
					-- 	gitsigns.diffthis("~")
					-- end, { desc = "Git diff changed" })
					map("n", "<leader>gd", gitsigns.toggle_deleted, { desc = "[G]it toggle [D]eleted" })

					-- -- Text object
					-- map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
				end,
			})
		end,
	},

	-- Neovim plugin for splitting/joining blocks of code
	--
	-- @see https://github.com/Wansmer/treesj
	{
		"Wansmer/treesj",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		keys = {
			-- { "<leader>j", "<CMD>TSJToggle<CR>", desc = "Join Toggle" },
			{ "J", "<CMD>TSJToggle<CR>", desc = "Join Toggle" },
		},
		opts = {
			use_default_keymaps = false,
			max_join_length = 150,
			on_error = function()
				-- fallback to  standard join behaviour
				vim.cmd("join")
			end,
		},
	},

	-- Highlight, edit, and navigate code, see `:help nvim-treesitter`
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

	-- Use treesitter to auto close and auto rename html tag
	-- {
	-- 	"windwp/nvim-ts-autotag",
	-- 	config = function()
	-- 		require("nvim-ts-autotag").setup({})
	-- 	end,
	-- },

	-- Markdown preview inside NeoVim
	-- @see https://github.com/ellisonleao/glow.nvim
	{
		{
			"ellisonleao/glow.nvim",
			cmd = "Glow",
			opts = { border = "rounded" },
		},
	},
}
