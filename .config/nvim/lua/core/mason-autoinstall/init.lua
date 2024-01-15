-- TODO: make UI for preferred and optional/alternative packages, see ~/.local/share/nvim/lazy/mason.nvim/lua/mason/ui
-- TODO: same previously auto-installed groups, so it does not trigger again
-- local augroup = require("core.utils").augroup
local notify = require("core.mason-autoinstall.notify")
local handlers = require("core.mason-autoinstall.handlers")
local install = require("core.mason-autoinstall.install")

local M = {
	has_setup = false,
	config = {
		handlers = handlers,
	},
}

--- @param groups string[] Table of groups to install
function M.install(groups)
	local all_packages = {}

	for _, group in ipairs(groups) do
		local packages = M.config.handlers[group] or {}

		for _, package in ipairs(packages) do
			table.insert(all_packages, package)
		end
	end

	notify("checking for " .. vim.bo.filetype)
	install(vim.fn.uniq(all_packages))
end

function M.setup(config)
	M.config = vim.tbl_deep_extend("force", M.config, config or {})

	if M.has_setup then
		notify("already setup")
		return -- do nothing
	else
		M.has_setup = true
	end

	-- register MasonAutoInstall command
	vim.api.nvim_create_user_command("MasonAutoInstall", function(opts)
		-- local command_opts, packages = parse_args(opts.args)
		local args = opts.args == "" and vim.bo.filetype or opts.args

		M.install(vim.split(vim.trim(args), "%s+"))
	end, {
		desc = "AutoInstall one or more Mason packages, based on filetype",
		nargs = "*", -- allow 0 or any number of args, see :h command-nargs
	})

	-- -- automatically run
	-- vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	-- 	group = augroup("mason_autoinstall"),
	-- 	-- buffer = event.buf,
	-- 	command = "MasonAutoInstall",
	-- })
	--
	-- vim.api.nvim_command("MasonAutoInstall")
end

return M
