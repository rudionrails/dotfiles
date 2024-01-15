local M = {}

function M.augroup(name)
	return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- generic table merge function
function M.merge(...)
	local result = {}

	for i, tbl in ipairs({ ... }) do
		for k, v in pairs(tbl) do
			if type(k) ~= "number" then
				result[k] = v
			else
				result[i] = v
			end
		end
	end

	return result
end

-- ui function to get foreground color of specified highlight group
function M.fg(name)
	local hl = vim.api.nvim_get_hl and vim.api.nvim_get_hl(0, { name = name })
		or vim.api.nvim_get_hl_by_name(name, true)
	local fg = hl and (hl.fg or hl.foreground)

	return fg and { fg = string.format("#%06x", fg) } or nil
end

return M
