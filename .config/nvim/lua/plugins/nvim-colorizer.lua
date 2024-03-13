-- A high-performance color highlighter
--
-- @see https://neovimcraft.com/plugin/NvChad/nvim-colorizer.lua
return {
	"NvChad/nvim-colorizer.lua",
	-- lazy = true,
	config = function()
		require("colorizer").setup({
			user_default_options = {
				tailwind = true,
			},
		})
	end,
}
