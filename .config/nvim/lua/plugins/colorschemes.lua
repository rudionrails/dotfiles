-- colorschemes
return {
	{
		"bluz71/vim-nightfly-colors",
		name = "nightfly",
		priority = 1000,
		config = function()
			if string.match(os.getenv("ITERM_PROFILE"), "Nightfly") then
				vim.cmd.colorscheme("nightfly")
			end
		end,
	},

	{
		"folke/tokyonight.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("tokyonight").setup({
				on_highlights = function(hi, c)
					-- hi.IndentBlanklineContextStart = { fg = c.bg, bg = c.purple }
					hi.CmpDocumentationBorder = { fg = c.purple }
				end,
			})

			if string.match(os.getenv("ITERM_PROFILE"), "Tokyonight Dark") then
				vim.cmd.colorscheme("tokyonight-night")
			end

			if string.match(os.getenv("ITERM_PROFILE"), "Tokyonight Light") then
				vim.cmd.colorscheme("tokyonight-day")
			end
		end,
	},

	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000, -- make sure to load this before all the other start plugins
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

			if string.match(os.getenv("ITERM_PROFILE"), "Rose Pine Dark") then
				vim.cmd.colorscheme("rose-pine-moon")
			end

			if string.match(os.getenv("ITERM_PROFILE"), "Rose Pine Light") then
				vim.cmd.colorscheme("rose-pine-dawn")
			end
		end,
	},

	{
		"EdenEast/nightfox.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			if string.match(os.getenv("ITERM_PROFILE"), "Nightfox Dark") then
				vim.cmd.colorscheme("nightfox")
			end

			if string.match(os.getenv("ITERM_PROFILE"), "Nightfox Light") then
				vim.cmd.colorscheme("dayfox")
			end
		end,
	},
}
