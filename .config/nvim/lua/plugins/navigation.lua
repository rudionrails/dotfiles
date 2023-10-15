return {
	-- file explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		cmd = "Neotree",
		keys = {
			{ "<leader>e", ":Neotree float reveal<CR>", silent = true, desc = "File [E]xplorer (NeoTree)" },
		},
		-- deactivate = function()
		--   vim.cmd([[Neotree close]])
		-- end,
		config = function()
			require("neo-tree").setup({
				window = {
					mappings = {
						["<space>"] = "none",
						["l"] = "open",
						["h"] = "close_node",
					},
				},
			})
		end,
	},

	-- highlight cursor
	{
		"edluffy/specs.nvim",
		event = "VeryLazy",
		config = function()
			require("specs").setup({
				show_jumps = true,
				min_jump = 30,
				popup = {
					delay_ms = 0, -- delay before popup displays
					inc_ms = 5, -- time increments used for fade/resize effects
					blend = 0, -- starting blend, between 0-100 (fully transparent), see :h winblend
					width = 250,
					winhl = "Search", -- 'PMenu', 'Search'
					fader = require("specs").linear_fader,
					resizer = require("specs").empty_resizer,
				},
			})

			vim.api.nvim_create_user_command("Specs", function()
				require("specs").show_specs()
			end, {})

			-- Press <C-b> to call specs!
			-- vim.keymap.set('n', '<C-l>', ':Specs<CR>', { noremap = true, silent = true, desc = "Highlight current [L]ine" })

			-- You can even bind it to search jumping and more, example:
			vim.keymap.set("n", "n", "n:Specs<CR>", { silent = true })
			vim.keymap.set("n", "N", "N:Specs<CR>", { silent = true })
		end,
	},

	{
		-- fancy resize buffers (with animations)
		"anuvyklack/windows.nvim",
		event = "VeryLazy",
		dependencies = {
			{ "anuvyklack/middleclass" },
			{ "anuvyklack/animation.nvim" },
		},
		keys = {
			{ "<C-m>", ":WindowsMaximize<CR>", silent = true, desc = "[M]aximize current buffer" },
		},
		config = function()
			vim.opt.winwidth = 5
			vim.opt.winminwidth = 5
			vim.opt.equalalways = false

			require("windows").setup({
				animation = {
					duration = 150,
				},
			})
		end,
	},

	{
		-- fancy scrollbar
		"petertriho/nvim-scrollbar",
		event = "BufReadPost",
		config = function()
			require("scrollbar").setup()
		end,
	},

	-- highlight other uses of the word under the cursor
	{
		"RRethy/vim-illuminate",
		event = "VeryLazy",
		config = function()
			local illuminate = require("illuminate")

			illuminate.configure({
				delay = 200,
				large_file_cutoff = 2000,
				large_file_overrides = {
					providers = { "lsp" },
				},
			})

			local function map(key, dir, buffer)
				vim.keymap.set("n", key, function()
					require("illuminate")["goto_" .. dir .. "_reference"](false)
				end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
			end

			map("]]", "next")
			map("[[", "prev")

			-- also set it after loading ftplugins, since a lot overwrite [[ and ]]
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					local buffer = vim.api.nvim_get_current_buf()
					map("]]", "next", buffer)
					map("[[", "prev", buffer)
				end,
			})
		end,
	},

	-- fast navigation
	{
		"phaazon/hop.nvim",
		cmd = "HopWord",
		keys = {
			{ "<space>", ":HopWord<CR>", desc = "Hop Word" },
		},
		config = function()
			require("hop").setup()
		end,
	},

	{ "mg979/vim-visual-multi" },
	{ "bogado/file-line" }, -- open file given a line, e.g. vim index.html:20

	-- tmux setup
	{
		"christoomey/vim-tmux-navigator",
		dependencies = {
			"jby/tmux.vim",
		},
		init = function()
			-- ' Don't allow any default key-mappings.
			vim.cmd("let g:tmux_navigator_no_mappings = 1")

			vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>", { silent = true })
			vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>", { silent = true })
			vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>", { silent = true })
			vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>", { silent = true })
		end,
	},

	{
		-- Fuzzy Finder (files, lsp, etc), see `:help telescope` and `:help telescope.setup()`
		"nvim-telescope/telescope.nvim",
		dependencies = {
			-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-treesitter/nvim-treesitter", -- finder / preview
			"nvim-tree/nvim-web-devicons", -- icons
			"sharkdp/fd", -- finder
			"nvim-lua/plenary.nvim", -- lua helper functions
			"BurntSushi/ripgrep",
		},
		-- cmd = 'Telescope',
		config = function()
			local telescope = require("telescope")

			telescope.setup({
				defaults = {
					layout_config = {
						horizontal = {
							preview_width = 0.55,
							-- results_width = 0.8,
						},
						width = 0.8,
						height = 0.8,
					},
					-- path_display = { shorten = { len = 3, exclude = { 1, -1 } } },
					path_display = { "truncate" },
					dynamic_preview_title = true,
					mappings = {
						n = {
							["q"] = "close",
						},
						i = {
							-- map actions.which_key to <C-h> (default: <C-/>)
							-- actions.which_key shows the mappings for your picker,
							-- e.g. git_{create, delete, ...}_branch for the git_branches picker
							["<C-h>"] = "which_key",
							["<C-u>"] = false,
							["<C-d>"] = false,
						},
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- even more opts
						}),
					},
				},
			})

			telescope.load_extension("fzf")
			telescope.load_extension("file_browser")
			telescope.load_extension("ui-select")

			-- -- provided by Yanky
			-- telescope.load_extension('yank_history')
		end,
		init = function()
			vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { silent = true, desc = "[F]ind [F]iles" })
			vim.keymap.set(
				"n",
				"<leader>fp",
				":Telescope oldfiles<CR>",
				{ silent = true, desc = "[F]ind [P]reviously opened files" }
			)
			vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { silent = true, desc = "[F]find by [G]rep" })
			vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { silent = true, desc = "[F]ind [H]elp" })
			vim.keymap.set("n", "<leader>fw", ":Telescope grep_string<CR>", { silent = true, desc = "[F]ind [W]ord" })
			vim.keymap.set(
				"n",
				"<leader>fd",
				":Telescope diagnostics<CR>",
				{ silent = true, desc = "[F]ind [D]iagnostics" }
			)
			vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { silent = true, desc = "[F]ind [B]uffers" })
			vim.keymap.set("n", "<leader>fc", ":Telescope commands<CR>", { silent = true, desc = "[F]ind [C]ommands" })
			vim.keymap.set(
				"n",
				"<leader>fe",
				":Telescope file_browser<CR>",
				{ silent = true, desc = "[F]ile [E]xplorer" }
			)
			-- vim.keymap.set('n', '<C-p>', ':Telescope yank_history<CR>', { silent = true, desc = '[F]ind [B]uffers' })
		end,
	},
}
