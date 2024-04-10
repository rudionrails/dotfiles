local M = {}

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

-- flatten provided table
function M.flatten(item, result)
	local result = result or {} --  create empty table, if none given during initialization

	if type(item) == "table" then
		for _, v in pairs(item) do
			M.flatten(v, result)
		end
	else
		table.insert(result, item)
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
