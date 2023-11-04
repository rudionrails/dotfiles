-- Fancier statusline, see `:help lualine.txt`
return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	event = "VeryLazy",
	init = function()
		vim.g.lualine_laststatus = vim.o.laststatus

		if vim.fn.argc(-1) > 0 then
			-- set an empty statusline till lualine loads
			vim.o.statusline = " "
		else
			-- hide the statusline on the starter page
			vim.o.laststatus = 0
		end
	end,
	config = function()
		vim.o.laststatus = vim.g.lualine_laststatus

		local config = require("core.config")
		local util = require("core.utils")

		require("lualine").setup({
			options = {
				theme = "auto",
				component_separators = config.icons.ui.Line,
				section_separators = config.icons.ui.LineDouble,
				-- component_separators = { left = ">", right = "<" },
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
					{
						function()
							return vim.fn.expand("%:p:~:.:h")
						end,
						icon = config.icons.ui.Folder,
						color = util.fg("Comment"),
						separator = "",
					},
					{ "filetype", icon_only = true, separator = "", padding = 0 },
					{
						function()
							return vim.fn.expand("%:t")
						end,
					},
					{
						"diff",
						icon = config.icons.ui.Diff,
						-- symbols = {
						-- 	added = config.icons.git.Added .. " ",
						-- 	modified = config.icons.git.Modified .. " ",
						-- 	removed = config.icons.git.Removed .. " ",
						-- },
					},
					{
						"diagnostics",
						icon = config.icons.ui.Fire,
						sources = { "nvim_diagnostic" },
						symbols = {
							error = config.icons.diagnostics.Error .. " ",
							warn = config.icons.diagnostics.Warn .. " ",
							info = config.icons.diagnostics.Info .. " ",
							hint = config.icons.diagnostics.Hint .. " ",
						},
					},
				},
				lualine_x = {
					-- { "branch", icon = config.icons.ui.Branch },

					-- display attached lsp clients, formatters and linters
					function()
						local buf_clients = vim.lsp.buf_get_clients()
						if not buf_clients or #buf_clients == 0 then
							return "" -- config.icons.ui.Code
						end

						local server_names = {}

						for _, client in pairs(buf_clients) do
							local client_name = client.name
							if client_name ~= "null-ls" and client_name ~= "copilot" then
								table.insert(server_names, client_name)
							end
						end

						if package.loaded["conform"] then
							local has_conform, conform = pcall(require, "conform")
							if has_conform then
								vim.list_extend(
									server_names,
									vim.tbl_map(function(formatter)
										return formatter.name
									end, conform.list_formatters(0))
								)
							end
						end

						if package.loaded["lint"] then
							local has_lint, lint = pcall(require, "lint")
							if has_lint then
								vim.list_extend(server_names, lint._resolve_linter_by_ft(vim.bo.filetype))
							end
						end

						return config.icons.ui.Code .. " " .. table.concat(vim.fn.uniq(server_names), ", ")
					end,
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
					-- { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
					{ "filetype", separator = "", padding = { left = 1, right = 0 } },
					{ "filename", path = 1 },
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
		})
	end,
}
