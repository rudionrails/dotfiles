-- NeoVim greeter, just open nvim (without file)
return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		-- local theme = require("alpha.themes.startify")
		local startify = require("alpha.themes.startify")

		startify.section.top_buttons.val = {
			-- { type = "text", val = "Shortcuts", opts = { hl = "SpecialComment" } },
			-- { type = "padding", val = 1 },
			startify.button("f", " " .. " Find file", "<cmd> Telescope find_files <cr>"),
			startify.button("n", " " .. " New file", "<cmd> ene <BAR> startinsert <cr>"),
			startify.button("r", " " .. " Recent files", "<cmd> Telescope oldfiles <cr>"),
			startify.button("g", " " .. " Find text", "<cmd> Telescope live_grep <cr>"),
			-- startify.button("s", " " .. " Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
		}

		startify.section.bottom_buttons.val = {
			startify.button("l", "󰒲 " .. " Lazy", "<cmd> Lazy <cr>"),
			startify.button("q", " " .. " Quit", "<cmd> qa <cr>"),
		}

		-- for _, button in ipairs(startify.section.top_buttons) do
		-- 	button.opts.hl = "AlphaButtons"
		-- 	button.opts.hl_shortcut = "AlphaShortcut"
		-- end

		alpha.setup(startify.opts)
	end,
}
