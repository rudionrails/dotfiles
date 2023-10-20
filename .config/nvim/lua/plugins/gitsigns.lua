-- git in signcolumn, see `:help gitsigns.txt`
return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("gitsigns").setup()
	end,
}
