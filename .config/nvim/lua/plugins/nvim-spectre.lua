-- find and replace (with dark powers)
return {
	"nvim-pack/nvim-spectre",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	init = function()
		local map = vim.keymap.set
		local spectre = require("spectre")

		map("n", "<leader>S", function()
			spectre.toggle()
		end, { desc = "Toggle [S]pectre" })
		-- map("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
		-- 	desc = "Search current word",
		-- })
		-- map("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
		-- 	desc = "Search current word",
		-- })
		-- map("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
		-- 	desc = "Search on current file",
		-- })
	end,
}
