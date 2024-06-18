local icons = require("core.icons")
local utils = require("core.utils")

-- returns the attached lsp, linters and formatters
local function attached_lsp()
	local buf_clients = vim.lsp.get_clients() or {}
	local buf_filetype = vim.bo.filetype
	local buf_client_names = {}

	for _, client in pairs(buf_clients) do
		local client_name = client.name
		if client_name ~= "null-ls" and client_name ~= "copilot" then
			table.insert(buf_client_names, client_name)
		end
	end

	if package.loaded["null-ls"] then
		local has_null_ls, null_ls = pcall(require, "null-ls")
		if has_null_ls then
			local sources = null_ls.get_sources()
			for _, source in ipairs(sources) do
				if source._validated then
					for ft_name, ft_active in pairs(source.filetypes) do
						if ft_name == buf_filetype and ft_active then
							table.insert(buf_client_names, source.name)
						end
					end
				end
			end
		end
	end

	if package.loaded["conform"] then -- conform package (for formatting)
		local has_conform, conform = pcall(require, "conform")
		if has_conform then
			vim.list_extend(
				buf_client_names,
				vim.tbl_map(function(formatter)
					return formatter.name
				end, conform.list_formatters(0))
			)
		end
	end

	if package.loaded["lint"] then -- nvim-lint package
		local has_lint, lint = pcall(require, "lint")
		if has_lint then
			vim.list_extend(buf_client_names, lint._resolve_linter_by_ft(buf_filetype))
		end
	end

	if #buf_client_names == 0 then
		table.insert(buf_client_names, "N/A")
	end

	-- print("LSP Clients: " .. vim.inspect(vim.fn.uniq(buf_client_names)))
	-- return icons.ui.Code .. " " .. table.concat(vim.fn.uniq(buf_client_names), ", ")
	return icons.ui.Code .. " " .. table.concat(buf_client_names, ", ")
end

return {
	options = {
		theme = "auto",
		component_separators = icons.ui.Line,
		section_separators = icons.ui.LineDouble,
		globalstatus = false,
		disabled_filetypes = {
			statusline = { "alpha" },
		},
	},

	sections = {
		lualine_a = {
			{
				"mode",
				fmt = function(str)
					-- return "󰀘 " .. str:sub(1, 1)
					return str:sub(1, 1)
				end,
			},
		},
		lualine_b = {},
		lualine_c = {
			-- -- { "filetype", separator = "", padding = { left = 1, right = 0 } },
			-- { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
			-- { "filename", path = 1 },
			-- {
			-- 	function()
			-- 		return vim.fn.expand("%:p:~:.:h")
			-- 	end,
			-- 	icon = icons.ui.Folder,
			-- 	color = util.fg("Comment"),
			-- 	separator = "",
			-- },
			{ "filetype", icon_only = true, separator = "" },
			{ "filename", path = 1, padding = { left = 0, right = 1 } },
			{
				"diff",
				icon = icons.ui.Diff,
				-- symbols = {
				-- 	added = icons.git.Added .. " ",
				-- 	modified = icons.git.Modified .. " ",
				-- 	removed = icons.git.Removed .. " ",
				-- },
			},
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = {
					error = icons.diagnostics.Error .. " ",
					warn = icons.diagnostics.Warn .. " ",
					info = icons.diagnostics.Info .. " ",
					hint = icons.diagnostics.Hint .. " ",
					other = icons.diagnostics.Other .. " ",
				},
			},
		},
		lualine_x = {
			-- display attached lsp clients, formatters and linters
			{
				attached_lsp,
				color = utils.fg("Comment"),
			},
		},
		lualine_y = {
			-- lazy updates
			{
				require("lazy.status").updates,
				cond = require("lazy.status").has_updates,
			},
		},
		lualine_z = {
			{ "location" },
		},
	},

	inactive_sections = {
		lualine_a = {},
		lualine_b = {
			{ "filetype", icon_only = true, separator = "" },
			{ "filename", path = 1, padding = { left = 0, right = 1 } },
		},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},

	extensions = {
		"lazy",
		"mason",
		"trouble",
		"quickfix",
		"neo-tree",
	},
}
