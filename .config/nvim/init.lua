require("autocmd")
require("options")
require("mappings")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	-- bootstrap lazy.nvim
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup("plugins", {
	defaults = {
		-- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
		lazy = false,
		-- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
		-- have outdated releases, which may break your Neovim install.
		version = false, -- always use the latest git commit
		-- version = "*", -- try installing the latest stable version for plugins that support semver
	},
	checker = {
		-- automatically check for plugin updates
		enabled = false,
		-- concurrency = nil, ---@type number? set to 1 to check for updates very slowly
		notify = true, -- get a notification when new updates are found
		-- frequency = 3600, -- check for updates every hour
	},
	change_detection = {
		-- automatically check for config file changes and reload the ui
		enabled = true,
		notify = true, -- get a notification when changes are found
	},
	ui = {
		border = "rounded",
	},
	performance = {
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrw",
				"netrwPlugin",
				"netrwSettings",
				"netrwFileHandlers",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",

				-- "2html_plugin",
				-- "tohtml",
				-- "getscript",
				-- "getscriptPlugin",
				-- "gzip",
				-- "logipat",
				-- "netrw",
				-- "netrwPlugin",
				-- "netrwSettings",
				-- "netrwFileHandlers",
				-- "matchit",
				-- "tar",
				-- "tarPlugin",
				-- "rrhelper",
				-- "spellfile_plugin",
				-- "vimball",
				-- "vimballPlugin",
				-- "zip",
				-- "zipPlugin",
				-- "tutor",
				-- "rplugin",
				-- "syntax",
				-- "synmenu",
				-- "optwin",
				-- "compiler",
				-- "bugreport",
				-- "ftplugin",
			},
		},
	},
})
