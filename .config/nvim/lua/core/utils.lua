local M = {}

-- check if plugin is defined in Lazy
function M.has(name)
	return require("lazy.core.config").spec.plugins[name] ~= nil
end

-- ui function to get foreground color of specified highlight group
function M.fg(name)
	local hl = vim.api.nvim_get_hl and vim.api.nvim_get_hl(0, { name = name })
		or vim.api.nvim_get_hl_by_name(name, true)
	local fg = hl and (hl.fg or hl.foreground)

	return fg and { fg = string.format("#%06x", fg) } or nil
end

function M.debounce(ms, fn)
	local timer = vim.loop.new_timer()

	return function(...)
		local argv = { ... }
		timer:start(ms, 0, function()
			timer:stop()
			vim.schedule_wrap(fn)(unpack(argv))
		end)
	end
end

return M
