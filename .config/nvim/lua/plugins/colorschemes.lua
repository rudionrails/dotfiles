-- -- colorschemes
-- local function set_colorscheme(profile, colorscheme)
-- 	-- iTerm set ITERM_PROFILE automatically, when using other
-- 	-- terminals, the TERM_PROFILE needs to be set manually
-- 	if profile:match(os.getenv("ITERM_PROFILE") or os.getenv("TERM_PROFILE") or "") then
-- 		vim.cmd.colorscheme(colorscheme)
-- 	end
-- end
--

local function colorscheme(profile, spec)
	local term_profile = os.getenv("ITERM_PROFILE") or os.getenv("TERM_PROFILE") or ""

	if term_profile:match(profile) then
		if type(spec.init) == "function" then
			spec.init()
		end

		-- vim.notify(vim.inspect(spec))
		vim.cmd.colorscheme(spec.colorscheme)
	end
end

-- local function colorschemes(spec)
-- 	if type(spec[1]) == "string" then
-- 		local profile = table.remove(spec, 1)
--
-- 		termprofile_colorscheme(profile, spec)
-- 	else
-- 		for profile, config in ipairs(spec) do
-- 			termprofile_colorscheme(profile, config)
-- 		end
-- 	end
-- end

return {
	{
		"EdenEast/nightfox.nvim",
		dependencies = {
			"cormacrelf/dark-notify",
		},
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			local dn = require("dark_notify")

			dn.run({
				schemes = {
					dark = "nightfox",
					light = "dayfox",
				},
			})

			-- match the system
			dn.update()
			-- colorscheme("Nightfox Dark", { colorscheme = "nightfox" })
			-- colorscheme("Nightfox Light", { colorscheme = "dayfox" })
		end,
	},

	-- {
	-- 	"bluz71/vim-nightfly-colors",
	-- 	name = "nightfly",
	-- 	priority = 1000,
	-- 	-- config = function()
	-- 	-- 	colorscheme("Nightfly", { colorscheme = "nightfly" })
	-- 	-- end,
	-- },

	{
		"folke/tokyonight.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		-- config = function()
		-- 	-- local function init()
		-- 	require("tokyonight").setup({
		-- 		-- on_highlights = function(hi, c)
		-- 		-- 	hi.IndentBlanklineContextStart = { fg = c.bg, bg = c.purple }
		-- 		-- 	hi.CmpDocumentationBorder = { fg = c.purple }
		-- 		-- end,
		-- 	})
		-- 	-- end
		--
		-- 	-- colorscheme("Tokyonight Dark", { colorscheme = "tokyonight-night", init = init })
		-- 	-- colorscheme("Tokyonight Light", { colorscheme = "tokyonight-day", init = init })
		-- end,
	},

	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000, -- make sure to load this before all the other start plugins
		-- config = function()
		-- 	-- local function init()
		-- 	-- 	require("rose-pine").setup({
		-- 	-- 		--- @usage 'main' | 'moon'
		-- 	-- 		-- dark_variant = "moon",
		-- 	-- 		highlight_groups = {
		-- 	-- 			IlluminatedWordRead = { bg = "highlight_med" },
		-- 	-- 			IlluminatedWordWrite = { bg = "highlight_med" },
		-- 	--
		-- 	-- 			IndentBlanklineContextStart = { bg = "foam", blend = 20 },
		-- 	-- 		},
		-- 	-- 	})
		-- 	-- end
		-- 	--
		-- 	-- colorscheme("Rose Pine Dark", { colorscheme = "rose-pine-moon", init = init })
		-- 	-- colorscheme("Rose Pine Light", { colorscheme = "rose-pine-dawn", init = init })
		-- end,
	},
}
