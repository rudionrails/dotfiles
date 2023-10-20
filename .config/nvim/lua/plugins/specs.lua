-- highlight cursor
return {
	"edluffy/specs.nvim",
	event = "VeryLazy",
	config = function()
		require("specs").setup({
			show_jumps = true,
			min_jump = 30,
			popup = {
				delay_ms = 0, -- delay before popup displays
				inc_ms = 5, -- time increments used for fade/resize effects
				blend = 0, -- starting blend, between 0-100 (fully transparent), see :h winblend
				width = 250,
				winhl = "Search", -- 'PMenu', 'Search'
				fader = require("specs").linear_fader,
				resizer = require("specs").empty_resizer,
			},
		})

		vim.api.nvim_create_user_command("Specs", function()
			require("specs").show_specs()
		end, {})

		-- You can even bind it to search jumping and more, example:
		vim.keymap.set("n", "n", "n:Specs<CR>", { silent = true })
		vim.keymap.set("n", "N", "N:Specs<CR>", { silent = true })
	end,
}
