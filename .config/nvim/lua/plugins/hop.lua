-- fast navigation
return {
	"phaazon/hop.nvim",
	cmd = "HopWord",
	keys = {
		{ "<space>", ":HopWord<CR>", desc = "Hop Word" },
	},
	config = function()
		require("hop").setup()
	end,
}
