-- Fuzzy Finder (files, lsp, etc), see `:help telescope` and `:help telescope.setup()`
return {
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
		{ "<leader>ff", "<CMD> Telescope find_files <CR>", silent = true, desc = "[F]ind [F]iles" },
		{ "<leader>fr", "<CMD> Telescope oldfiles <CR>", silent = true, desc = "[F]ind [R]ecent files" },
		{ "<leader>fg", "<CMD> Telescope live_grep <CR>", silent = true, desc = "[F]find by [G]rep" },
		{ "<leader>fh", "<CMD> Telescope help_tags <CR>", silent = true, desc = "[F]ind [H]elp" },
		{ "<leader>fw", "<CMD> Telescope grep_string <CR>", silent = true, desc = "[F]ind [W]ord" },
		{ "<leader>fd", "<CMD> Telescope diagnostics <CR>", silent = true, desc = "[F]ind [D]iagnostics" },
		{ "<leader>fb", "<CMD> Telescope buffers <CR>", silent = true, desc = "[F]ind [B]uffers" },
		{ "<leader>fc", "<CMD> Telescope commands <CR>", silent = true, desc = "[F]ind [C]ommands" },
		{ "<leader>fe", "<CMD> Telescope file_browser <CR>", silent = true, desc = "[F]ile [E]xplorer" },
		{ "<leader>fc", "<CMD> Telescope colorscheme <CR>", silent = true, desc = "[F]ind [C]colorschemes" },
	},
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
}
