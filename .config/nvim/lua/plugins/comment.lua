-- 'gc' to comment visual regions/lines
return {
	"numToStr/Comment.nvim",
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
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
}
