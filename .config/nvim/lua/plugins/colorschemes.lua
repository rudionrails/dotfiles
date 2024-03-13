-- colorschemes

-- local function colorscheme(profile, spec)
-- 	local term_profile = os.getenv("ITERM_PROFILE") or os.getenv("TERM_PROFILE") or ""
--
-- 	if term_profile:match(profile) then
-- 		if type(spec.init) == "function" then
-- 			spec.init()
-- 		end
--
-- 		-- vim.notify(vim.inspect(spec))
-- 		vim.cmd.colorscheme(spec.colorscheme)
-- 	end
-- end

return {
	{
		"folke/tokyonight.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			vim.cmd.colorscheme("tokyonight-night")
		end,
	},

	-- {
	-- 	"EdenEast/nightfox.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("nightfox").setup({
	-- 			options = {
	-- 				styles = {
	-- 					comments = "italic", -- normal
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- },

	-- detect colorscheme based on OS light/dark appearance
	{
		"cormacrelf/dark-notify",
		-- priority = 1000, -- make sure to load this before all the other start plugins
		-- event = "VimEnter",
		event = "VeryLazy",
		config = function()
			local dark_notify = require("dark_notify")

			dark_notify.run({
				schemes = {
					dark = "tokyonight-night", -- nightfox",
					light = "tokyonight-day", -- "dayfox",
				},
			})

			dark_notify.update()
		end,
	},

	-- { "catppuccin/nvim", priority = 1000, name = "catppuccin" },
	-- {
	-- 	"rose-pine/neovim",
	-- 	name = "rose-pine",
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	-- config = function()
	-- 	-- 	-- local function init()
	-- 	-- 	-- 	require("rose-pine").setup({
	-- 	-- 	-- 		--- @usage 'main' | 'moon'
	-- 	-- 	-- 		-- dark_variant = "moon",
	-- 	-- 	-- 		highlight_groups = {
	-- 	-- 	-- 			IlluminatedWordRead = { bg = "highlight_med" },
	-- 	-- 	-- 			IlluminatedWordWrite = { bg = "highlight_med" },
	-- 	-- 	--
	-- 	-- 	-- 			IndentBlanklineContextStart = { bg = "foam", blend = 20 },
	-- 	-- 	-- 		},
	-- 	-- 	-- 	})
	-- 	-- 	-- end
	-- 	-- 	--
	-- 	-- 	-- colorscheme("Rose Pine Dark", { colorscheme = "rose-pine-moon", init = init })
	-- 	-- 	-- colorscheme("Rose Pine Light", { colorscheme = "rose-pine-dawn", init = init })
	-- 	-- end,
	-- },
}
