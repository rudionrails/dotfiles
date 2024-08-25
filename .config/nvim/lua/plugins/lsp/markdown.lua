return {
	"rudionrails/quarry.nvim",
	opts = {
		servers = {
			marksman = {
				filetypes = { "markdown" },

				ensure_installed = {
					"vale",
				},
			},
		},
	},
}
