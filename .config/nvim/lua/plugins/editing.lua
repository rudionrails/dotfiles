return {
	-- open file given a line, e.g. vim index.html:20
	{ "bogado/file-line", event = "User FileOpened" },

	-- -- A Git wrapper so awesome, it should be illegal
	-- {
	-- 	"tpope/vim-fugitive",
	-- 	cmd = "Git",
	-- },

	-- A high-performance color highlighter
	-- @see https://neovimcraft.com/plugin/NvChad/nvim-colorizer.lua
	{
		"NvChad/nvim-colorizer.lua",
		main = "colorizer",
		event = { "User FileOpened", "VeryLazy" },
		opts = {
			user_default_options = {
				tailwind = true,
			},
		},
	},

	-- 'gc' to comment visual regions/lines
	{
		"numToStr/Comment.nvim",
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		-- event = "User FileOpened",
		event = "VeryLazy",
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
		event = "VeryLazy",
		opts = {
			-- do not show icon in signcolumn
			signs = false,
		},
	},

	-- -- TODO: Review if I am just too lazy to type closing pairs
	-- {
	-- 	"windwp/nvim-autopairs",
	-- 	event = { "InsertEnter" },
	-- 	dependencies = { "hrsh7th/nvim-cmp" },
	-- 	opts = {
	-- 		check_ts = true, -- enable treesitter
	-- 		ts_config = {
	-- 			lua = { "string" }, -- don't add pairs in lua string treesitter nodes
	-- 			javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
	-- 			java = false, -- don't check treesitter on java
	-- 		},
	-- 	},
	-- 	config = function(_, opts)
	-- 		local autopairs = require("nvim-autopairs")
	-- 		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	-- 		local cmp = require("cmp")
	--
	-- 		-- configure autopairs
	-- 		autopairs.setup(opts)
	--
	-- 		-- make autopairs and completion work together
	-- 		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	-- 	end,
	-- },

	-- git in signcolumn, see `:help gitsigns.txt`
	{
		"lewis6991/gitsigns.nvim",
		event = { "VeryLazy" },
		opts = {
			yadm = { enable = true },
			on_attach = function(buffer)
				local nmap = function(lhs, rhs, desc)
					vim.keymap.set("n", lhs, rhs, { buffer = buffer, desc = desc })
				end

				-- Navigation
				nmap("]c", function()
					if vim.wo.diff then
						return "]c"
					end

					vim.schedule(function()
						require("gitsigns").next_hunk()
					end)

					return "<Ignore>"
				end, "(Git) next hunk")

				nmap("[c", function()
					if vim.wo.diff then
						return "[c"
					end

					vim.schedule(function()
						require("gitsigns").prev_hunk()
					end)

					return "<Ignore>"
				end, "(Git) prev hunk")

				-- Actions
				nmap("<leader>gs", require("gitsigns").stage_buffer, "[G]it [S]tage buffer")
				nmap("<leader>gr", require("gitsigns").reset_buffer, "[G]it [R]eset buffer")
				nmap("<leader>gd", require("gitsigns").toggle_deleted, "[G]it toggle [D]eleted")
			end,
		},
	},

	-- Neovim plugin for splitting/joining blocks of code
	--
	-- @see https://github.com/Wansmer/treesj
	{
		"Wansmer/treesj",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		cmd = "TSJToggle",
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
			"nvim-treesitter/nvim-treesitter-textobjects", -- Additional text objects via treesitter
			"RRethy/nvim-treesitter-textsubjects", -- Location and syntax aware text objects which *do what you mean*
			-- 'nvim-treesitter/playground',                  -- show treesitter info in vim
		},
		build = ":TSUpdate",
		event = { "User FileOpened", "VeryLazy" },
		opts = {
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
		},
		config = function(_, opts)
			vim.treesitter.language.register("typescript", "javascript") -- the javascript filetype will use the tsx parser

			require("nvim-treesitter.configs").setup(opts)

			-- -- Show treesitter capture group for textobject under cursor (nvim-treesitter/playground)
			-- vim.keymap.set('n', '<C-e>', ':TSHighlightCapturesUnderCursor<CR>', { noremap = true, silent = true })
		end,
	},

	-- Show context of the current function
	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = { mode = "cursor", max_lines = 3 },
		keys = {
			{
				"<leader>ut",
				function()
					local tsc = require("treesitter-context")
					tsc.toggle()

					if tsc.enabled() then
						vim.notify("Treesitter Context enabled", vim.log.levels.DEBUG)
					else
						vim.notify("Treesitter Context disabled", vim.log.levels.DEBUG)
					end
				end,
				desc = "Toggle Treesitter Context",
			},
		},
	},

	-- Use treesitter to auto close and auto rename html tag
	{
		"windwp/nvim-ts-autotag",
		event = "VeryLazy",
		config = function()
			require("nvim-ts-autotag").setup({})
		end,
	},

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
