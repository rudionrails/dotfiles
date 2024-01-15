-- A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.
return {
	"folke/trouble.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	cmd = { "Trouble" },
	config = function()
		require("trouble").setup({
			position = "bottom",
			-- auto_open = true,
			use_diagnostic_signs = true, -- uses lsp diagnostic signs
		})
	end,
}
