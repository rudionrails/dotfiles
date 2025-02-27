return {
	--- Enhance builtin native comments
	-- 'gc' / 'gcc' to comment visual regions/lines
	{
		"folke/ts-comments.nvim",
		event = "VeryLazy",
		enabled = vim.fn.has("nvim-0.10.0") == 1,
		opts = {},
	},

	-- open file given a line, e.g. vim index.html:20
	{ "bogado/file-line", event = "User FileOpened" },

	-- Highlight colors for neovim
	-- @see https://github.com/brenoprata10/nvim-highlight-colors
	{ "brenoprata10/nvim-highlight-colors", opts = {} },

	-- A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.
	{
		"folke/trouble.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		cmd = "Trouble",
		opts = {},
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
		config = function(_, opts)
			require("todo-comments").setup(opts)
		end,
	},

	-- Neovim Lua plugin to extend and create `a`/`i` textobjects.
	-- @see https://github.com/echasnovski/mini.ai
	{
		"echasnovski/mini.ai",
		event = { "VeryLazy", "User FileOpened" },
		opts = {},
	},

	{
		"echasnovski/mini.pairs",
		event = { "VeryLazy", "InsertEnter" },
		opts = {
			modes = { insert = true, command = true, terminal = false },
			-- skip autopair when next character is one of these
			skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
			-- skip autopair when the cursor is inside these treesitter nodes
			skip_ts = { "string" },
			-- skip autopair when next character is closing pair
			-- and there are more closing pairs than opening pairs
			skip_unbalanced = true,
			-- better deal with markdown code blocks
			markdown = true,
		},
		config = function(_, opts)
			local pairs = require("mini.pairs")
			local open = pairs.open

			pairs.setup(opts)
			pairs.open = function(pair, neigh_pattern)
				if vim.fn.getcmdline() ~= "" then
					return open(pair, neigh_pattern)
				end

				local o, c = pair:sub(1, 1), pair:sub(2, 2)
				local line = vim.api.nvim_get_current_line()
				local cursor = vim.api.nvim_win_get_cursor(0)
				local next = line:sub(cursor[2] + 1, cursor[2] + 1)
				local before = line:sub(1, cursor[2])

				if opts.markdown and o == "`" and vim.bo.filetype == "markdown" and before:match("^%s*``") then
					return "`\n```" .. vim.api.nvim_replace_termcodes("<up>", true, true, true)
				end

				if opts.skip_next and next ~= "" and next:match(opts.skip_next) then
					return o
				end

				if opts.skip_ts and #opts.skip_ts > 0 then
					local ok, captures =
						pcall(vim.treesitter.get_captures_at_pos, 0, cursor[1] - 1, math.max(cursor[2] - 1, 0))
					for _, capture in ipairs(ok and captures or {}) do
						if vim.tbl_contains(opts.skip_ts, capture.capture) then
							return o
						end
					end
				end

				if opts.skip_unbalanced and next == c and c ~= o then
					local _, count_open = line:gsub(vim.pesc(pair:sub(1, 1)), "")
					local _, count_close = line:gsub(vim.pesc(pair:sub(2, 2)), "")
					if count_close > count_open then
						return o
					end
				end

				return open(pair, neigh_pattern)
			end
		end,
	},

	-- git in signcolumn, see `:help gitsigns.txt`
	{
		"lewis6991/gitsigns.nvim",
		event = { "VeryLazy" },
		opts = {
			on_attach = function(bufnr)
				local nmap = function(lhs, rhs, desc)
					vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc })
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
	-- @see https://github.com/Wansmer/treesj
	{
		"Wansmer/treesj",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		cmd = "TSJToggle",
		keys = {
			{ "<leader>j", "<CMD>TSJToggle<CR>", desc = "Join Toggle" },
			-- { "J", "<CMD>TSJToggle<CR>", desc = "Join Toggle" },
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

		event = { "VeryLazy" },
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
		opts = {
			opts = {
				enable_close = true, -- Auto close tags
				enable_rename = true, -- Auto rename pairs of tags
				enable_close_on_slash = false, -- Auto close on trailing </
			},
		},
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

	-- Snapshot plugin with rich features that can make pretty code snapshots for Neovim
	-- @see https://github.com/mistricky/codesnap.nvim
	{
		"mistricky/codesnap.nvim",
		build = "make build_generator",
		keys = {
			{ "<leader>cc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
			{ "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot" },
		},
		opts = {
			watermark = "made with love",
			code_font_family = "FiraCode Nerd Font",
			save_path = "~/Desktop",
			-- has_breadcrumbs = true,
			-- bg_theme = "bamboo",
		},
	},
}
