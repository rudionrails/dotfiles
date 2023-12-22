-- NeoVim greeter, just open nvim (without file)
return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local startify = require("alpha.themes.startify")
		local config = require("core.config")

		startify.section.top_buttons.val = {
			-- { type = "text", val = "Shortcuts", opts = { hl = "SpecialComment" } },
			-- { type = "padding", val = 1 },
			startify.button("e", config.icons.ui.NewFile .. " " .. " New file", "<cmd> ene <BAR> startinsert <cr>"),
			startify.button("f", config.icons.ui.Search .. " " .. " Find file", "<cmd> Telescope find_files <cr>"),
			-- startify.button("r", " " .. " Recent files", "<cmd> Telescope oldfiles <cr>"),
			-- startify.button("g", " " .. " Find text", "<cmd> Telescope live_grep <cr>"),
			-- startify.button("s", " " .. " Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
		}

		startify.section.bottom_buttons.val = {
			startify.button("m", config.icons.ui.Package .. " " .. " Mason", "<cmd> Mason <cr>"),
			startify.button("l", config.icons.ui.Package .. " " .. " Lazy", "<cmd> Lazy <cr>"),
			startify.button("q", config.icons.ui.Quit .. " " .. " Quit", "<cmd> qa <cr>"),
		}

		for _, button in ipairs(startify.section.top_buttons) do
			button.opts.hl = "AlphaButtons"
			button.opts.hl_shortcut = "AlphaShortcut"
		end

		alpha.setup(startify.opts)
	end,
}
