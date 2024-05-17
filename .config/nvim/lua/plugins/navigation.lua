local config = require("core.config")

return {
	-- Navigate your code with search labels, enhanced character motions and Treesitter integration
	-- @see https://github.com/folke/flash.nvim
	{
		"folke/flash.nvim",
		event = "VeryLazy", -- "User FileOpened"
		opts = {
			modes = { char = { jump_labels = true } },
		},
	},

	-- highlight cursor
	{
		"edluffy/specs.nvim",
		keys = {
			{ "n", "n:Specs <CR>", silent = true },
			{ "N", "N:Specs <CR>", silent = true },
		},
		init = function()
			vim.api.nvim_create_user_command("Specs", function()
				require("specs").show_specs()
			end, {})
		end,
		config = function()
			local specs = require("specs")

			specs.setup({
				show_jumps = true,
				-- min_jump = 30,
				popup = {
					delay_ms = 0, -- delay before popup displays
					inc_ms = 5, -- time increments used for fade/resize effects
					blend = 0, -- starting blend, between 0-100 (fully transparent), see :h winblend
					width = 250,
					winhl = "Search", -- 'PMenu', 'Search'
					fader = specs.linear_fader,
					resizer = specs.empty_resizer,
				},
			})
		end,
	},

	-- tmux navigation
	{
		"christoomey/vim-tmux-navigator",
		dependencies = { "jby/tmux.vim" },
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
		},
		keys = {
			{ "<C-h>", "<CMD> TmuxNavigateLeft <CR>" },
			{ "<C-j>", "<CMD> TmuxNavigateDown <CR>" },
			{ "<C-k>", "<CMD> TmuxNavigateUp <CR>" },
			{ "<C-l>", "<CMD> TmuxNavigateRight <CR>" },
		},
	},

	-- multiple cursors
	{ "mg979/vim-visual-multi", lazy = true },

	-- Fuzzy Finder (files, lsp, etc), see `:help telescope` and `:help telescope.setup()`
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			-- Fuzzy Finder Algorithm which requires local dep"glepnir/lspsaga.nvim"endencies to be built. Only load if `make` is available
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-treesitter/nvim-treesitter", -- finder / preview
			"sharkdp/fd", -- finder
			"BurntSushi/ripgrep",
			"nvim-lua/plenary.nvim", -- lua helper functions
			"nvim-tree/nvim-web-devicons", -- icons
		},
		cmd = "Telescope",
		keys = {
			{ "<leader>ff", "<CMD>Telescope find_files<CR>", desc = "[F]ind [F]iles" },
			{ "<leader>fr", "<CMD>Telescope oldfiles<CR>", desc = "[F]ind [R]ecent files" },
			{ "<leader>fg", "<CMD>Telescope live_grep<CR>", desc = "[F]find by [G]rep" },
			{ "<leader>fh", "<CMD>Telescope help_tags<CR>", desc = "[F]ind [H]elp" },
			{ "<leader>fw", "<CMD>Telescope grep_string<CR>", desc = "[F]ind [W]ord" },
			{ "<leader>fd", "<CMD>Telescope diagnostics<CR>", desc = "[F]ind [D]iagnostics" },
			{ "<leader>fb", "<CMD>Telescope buffers<CR>", desc = "[F]ind [B]uffers" },
			{ "<leader>fc", "<CMD>Telescope commands<CR>", desc = "[F]ind [C]ommands" },
			{ "<leader>fe", "<CMD>Telescope file_browser<CR>", desc = "[F]ile [E]xplorer" },
			{ "<leader>fc", "<CMD>Telescope colorscheme<CR>", desc = "[F]ind [C]colorschemes" },
		},
		opts = {
			defaults = {
				prompt_prefix = config.icons.ui.Search .. " ",
				layout_config = {
					horizontal = {
						preview_width = 0.55,
						-- results_width = 0.8,
					},
					width = 0.8,
					height = 0.8,
				},

				dynamic_preview_title = true,
				path_display = { "truncate" },
				-- path_display = { shorten = { len = 3, exclude = { 1, -1 } } },

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
						["<ESC>"] = "close",
					},
				},
			},

			pickers = {
				colorscheme = {
					enable_preview = true,
				},
			},
		},
		config = function(_, opts)
			local telescope = require("telescope")

			telescope.setup(vim.tbl_deep_extend("force", opts, {
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- even more opts
						}),
					},
				},
			}))

			telescope.load_extension("fzf")
			telescope.load_extension("file_browser")
			telescope.load_extension("ui-select")
		end,
	},

	-- file explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		},
		event = "User DirOpened",
		cmd = "Neotree",
		keys = {
			{ "<leader>e", "<CMD>Neotree float reveal<CR>", desc = "File [E]xplorer (NeoTree, floating)" },
			{ "<leader>E", "<CMD>Neotree left reveal<CR>", desc = "File [E]xplorer (NeoTree, left)" },
		},
		opts = {
			filesystem = {
				-- open neo-tree when a dir is passed to nvim
				hijack_netrw_behavior = "open_current",
			},

			window = {
				mappings = {
					["<space>"] = "none",
					["l"] = "open",
					["h"] = "close_node",
					["."] = "toggle_hidden",
				},
			},
		},
	},

	-- displays a popup with possible key bindings of the command
	{
		"folke/which-key.nvim",
		event = { "VeryLazy" }, -- User FileOpened"},
		opts = {
			window = {
				border = "shadow", -- none, single, double, shadow
				-- position = "bottom", -- bottom, top
				-- margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
				-- padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
				-- winblend = 0
			},
		},
	},
}
