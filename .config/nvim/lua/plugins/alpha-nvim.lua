-- NeoVim greeter, just open nvim (without file)
return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local startify = require("alpha.themes.startify")
		local config = require("core.config")

		startify.section.header.opts.hl = "AlphaHeader"

		startify.section.top_buttons.val = {
			-- { type = "text", val = "Shortcuts", opts = { hl = "SpecialComment" } },
			-- { type = "padding", val = 1 },
			startify.button("e", config.icons.ui.NewFile .. " " .. " New file", "<cmd> ene <BAR> startinsert <cr>"),
			startify.button("f", config.icons.ui.Search .. " " .. " Find file", "<cmd> Telescope find_files <cr>"),
			-- startify.button("r", " " .. " Recent files", "<cmd> Telescope oldfiles <cr>"),
			-- startify.button("g", " " .. " Find text", "<cmd> Telescope live_grep <cr>"),
			-- startify.button("s", " " .. " Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
		}

		-- for _, button in ipairs(startify.section.top_buttons) do
		-- 	button.opts.hl = "AlphaButtons"
		-- 	button.opts.hl_shortcut = "AlphaShortcut"
		-- end

		startify.section.bottom_buttons.val = {
			startify.button("m", config.icons.ui.Package .. " " .. " Mason", "<CMD> Mason <CR>"),
			startify.button("l", config.icons.ui.Package .. " " .. " Lazy", "<CMD> Lazy <CR>"),
			startify.button("q", config.icons.ui.Quit .. " " .. " Quit", "<CMD> q <CR>"),
		}

		alpha.setup(startify.config)

		vim.api.nvim_create_autocmd("User", {
			once = true,
			pattern = "LazyVimStarted",
			callback = function()
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				local val = "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"

				startify.section.footer.val = {
					{ type = "padding", val = 1 },
					{ type = "text", opts = { hl = "Comment" }, val = val },
				}

				pcall(vim.cmd.AlphaRedraw)
			end,
		})
	end,
}
