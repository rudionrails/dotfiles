-- colorschemes
local function set_colorscheme(profile, colorscheme)
	if profile:match(os.getenv("ITERM_PROFILE") or "") then
		vim.cmd.colorscheme(colorscheme)
	end
end

return {
	{
		"bluz71/vim-nightfly-colors",
		name = "nightfly",
		priority = 1000,
		init = function()
			set_colorscheme("Nightfly", "nightfly")
		end,
	},

	{
		"folke/tokyonight.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		init = function()
			set_colorscheme("Tokyonight Dark", "tokyonight-night")
			set_colorscheme("Tokyonight Light", "tokyonight-day")
		end,
		config = function()
			require("tokyonight").setup({
				-- on_highlights = function(hi, c)
				-- 	hi.IndentBlanklineContextStart = { fg = c.bg, bg = c.purple }
				-- 	hi.CmpDocumentationBorder = { fg = c.purple }
				-- end,
			})
		end,
	},

	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000, -- make sure to load this before all the other start plugins
		init = function()
			set_colorscheme("Rose Pine Dark", "rose-pine-moon")
			set_colorscheme("Rose Pine Light", "rose-pine-dawn")
		end,
		config = function()
			require("rose-pine").setup({
				--- @usage 'main' | 'moon'
				-- dark_variant = "moon",
				highlight_groups = {
					IlluminatedWordRead = { bg = "highlight_med" },
					IlluminatedWordWrite = { bg = "highlight_med" },

					IndentBlanklineContextStart = { bg = "foam", blend = 20 },
				},
			})
		end,
	},

	{
		"EdenEast/nightfox.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		init = function()
			set_colorscheme("Nightfox Dark", "nightfox")
			set_colorscheme("Nightfox Light", "dayfox")
		end,
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		init = function()
			set_colorscheme("Catpuccin", "catpuccin-mocha")
		end,
		config = function()
			require("catppuccin").setup({})
		end,
	},

	-- {
	-- 	"lunarvim/lunar.nvim",
	-- 	priority = 1000,
	-- },
}
