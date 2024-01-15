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

	-- detect colorscheme based on OS light/dark appearance
	{
		"cormacrelf/dark-notify",
		-- priority = 1000, -- make sure to load this before all the other start plugins
		event = { "VimEnter" },
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
}
