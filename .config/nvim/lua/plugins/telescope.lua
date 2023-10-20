-- Fuzzy Finder (files, lsp, etc), see `:help telescope` and `:help telescope.setup()`
return {
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
		vim.keymap.set("n", "<leader>fe", ":Telescope file_browser<CR>", { silent = true, desc = "[F]ile [E]xplorer" })
		-- vim.keymap.set('n', '<C-p>', ':Telescope yank_history<CR>', { silent = true, desc = '[F]ind [B]uffers' })
		vim.keymap.set("n", "<leader>fn", ":Telescope notify<CR>", { silent = true, desc = "[F]ind [N]otifications" })
	end,
}
