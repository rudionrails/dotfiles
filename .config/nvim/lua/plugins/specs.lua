-- highlight cursor
return {
	"edluffy/specs.nvim",
	event = "VeryLazy",
	config = function()
		local specs = require("specs")

		specs.setup({
			show_jumps = true,
			-- min_jump = 30,
			popup = {
				delay_ms = 0, -- delay before popup displays
				inc_ms = 5, -- time increments used for fade/resize effects
				blend = 0, -- starting blend, between 0-100 (fully transparent), see :h winblend
				width = 250,
				winhl = "Search", -- 'PMenu', 'Search'
				fader = specs.linear_fader,
				resizer = specs.empty_resizer,
			},
		})
	end,
	init = function()
		local map = vim.keymap.set

		vim.api.nvim_create_user_command("Specs", function()
			require("specs").show_specs()
		end, {})

		-- -- You can even bind it to search jumping and more, example:
		map("n", "n", "n:Specs <CR>", { silent = true })
		map("n", "N", "N:Specs <CR>", { silent = true })
	end,
}
