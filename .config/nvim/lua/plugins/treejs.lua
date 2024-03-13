-- Neovim plugin for splitting/joining blocks of code
--
-- @see https://github.com/Wansmer/treesj
return {
	"Wansmer/treesj",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		-- { "<leader>j", "<CMD>TSJToggle<CR>", desc = "Join Toggle" },
		{ "J", "<CMD>TSJToggle<CR>", desc = "Join Toggle" },
	},
	config = function()
		require("treesj").setup({
			use_default_keymaps = false,
			max_join_length = 150,
			on_error = function()
				-- fallback to  standard join behaviour
				vim.cmd("join")
			end,
		})
	end,
}
