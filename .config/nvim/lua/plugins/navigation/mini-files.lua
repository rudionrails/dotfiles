return {
	"echasnovski/mini.files",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- cmd = "MiniFiles",
	keys = {
		{
			"<leader>e",
			function()
				local mf = require("mini.files")

				-- mf.open(mf.get_latest_path()) -- open last used path
				mf.open(vim.api.nvim_buf_get_name(0)) -- open last used path
				mf.reveal_cwd() -- refresh to also show current wrkin directory
			end,
			desc = "File [E]xplorer (NeoTree, floating)",
		},
	},
	config = function()
		local show_dotfiles = false
		local opts = {
			content = {
				filter = function(fs_entry)
					if show_dotfiles then
						return true
					else
						return not vim.startswith(fs_entry.name, ".")
					end
				end,
			},

			-- Close MiniFiles when opening file
			mappings = {
				go_in = "L",
				go_in_plus = "l",
			},

			-- windows = {
			-- 	-- Whether to show preview of file/directory under cursor
			-- 	preview = true,
			-- },
		}
		local toggle_dotfiles = function()
			show_dotfiles = not show_dotfiles
			MiniFiles.refresh(opts)
		end

		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniFilesBufferCreate",
			callback = function(args)
				local buffer = args.data.buf_id

				vim.keymap.set("n", ".", toggle_dotfiles, { buffer = buffer })
				vim.keymap.set("n", "<ESC>", MiniFiles.close, { buffer = buffer })
			end,
		})

		require("mini.files").setup(opts)
	end,
}
