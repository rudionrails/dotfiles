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
		-- event = { "User FileOpened", "VeryLazy" },
		event = "VeryLazy",
		init = function()
			vim.cmd.colorscheme("tokyonight-moon")
		end,
		config = function()
			local dark_notify = require("dark_notify")

			dark_notify.run({
				schemes = {
					dark = "tokyonight-moon", -- nightfox",
					-- light = "tokyonight-day", -- "dayfox",
					light = "catppuccin-latte", -- "dayfox",
				},
			})

			-- dark_notify.update()
		end,
	},

	{
		"folke/tokyonight.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		-- init = function()
		-- 	vim.cmd.colorscheme("tokyonight-moon")
		-- end,
	},

	{ "catppuccin/nvim", priority = 1000, name = "catppuccin" },

	-- {
	-- 	"uloco/bluloco.nvim",
	-- 	priority = 1000,
	-- 	dependencies = { "rktjmp/lush.nvim" },
	-- },
	-- { "sainnhe/edge", priority = 1000 },
	-- { "olimorris/onedarkpro.nvim", priority = 1000 },
	-- { "uloco/bluloco.nvim", priority = 1000, dependencies = { "rktjmp/lush.nvim" }, opts = { terminal = 0 } },

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
