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
	-- detect colorscheme based on OS light/dark appearance
	{
		"cormacrelf/dark-notify",
		-- priority = 1000, -- make sure to load this before all the other start plugins
		event = { "User FileOpened", "VeryLazy" },
		init = function()
			vim.cmd.colorscheme("tokyonight-moon")
		end,
		config = function()
			local dark_notify = require("dark_notify")

			dark_notify.run({
				schemes = {
					dark = "tokyonight-moon", -- nightfox",
					light = "tokyonight-day", -- "dayfox",
					-- light = "catppuccin-latte", -- "dayfox",
				},
			})

			-- dark_notify.update()
		end,
	},

	{
		"folke/tokyonight.nvim",
		priority = 1000,
		opts = {
			on_colors = function(colors)
				colors.border = "#101010"
			end,
		},
	},

	{
		"EdenEast/nightfox.nvim",
		priority = 1000,
		opts = {
			options = {
				styles = {
					comments = "italic", -- normal
				},
			},
		},
	},
}
