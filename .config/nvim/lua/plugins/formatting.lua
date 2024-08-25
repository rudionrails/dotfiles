local format = function()
	local conform = require("conform")
	local names = vim.tbl_map(function(formatter)
		return formatter.name
	end, conform.list_formatters())

	-- Run formatters
	if #names > 0 then
		vim.notify("Formatting with " .. table.concat(names, ", "), vim.log.levels.INFO)

		conform.format({
			timeout_ms = 3000,
			async = false, -- nope, want to wait until finished
			quiet = false, -- need to know when things don't work
			lsp_fallback = "fallback", -- just in case LSP can help
			stop_after_first = true, -- only run the first available formatter in the list
		})
	end
end

return {
	-- Formatting
	"stevearc/conform.nvim",
	event = { "VeryLazy" },
	cmd = { "ConformInfo" }, -- "Format"
	keys = {
		-- { "<leader>p", "<CMD>Format<CR>", desc = "Format code [p]retty" },
		{ "<leader>p", format, desc = "Format code [p]retty" },
	},
	opts = {
		notify_on_error = true,
		formatters = {
			sqlfluff = {
				command = "sqlfluff",
				args = { "fix", "-f", "-n", "-" },
				stdin = true,
			},
		},
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "eslint_d", "eslint", "prettierd", "prettier" },
			typescript = { "eslint_d", "eslint", "prettierd", "prettier" },
			javascriptreact = { "eslint_d", "eslint", "prettierd", "prettier" },
			typescriptreact = { "eslint_d", "eslint", "prettierd", "prettier" },
			yaml = { "prettierd", "prettier" },
			json = { "prettierd", "prettier" },
			sql = { "sqlfluff" }, -- { "sql-formatter", "sqlfmt", "sqlfluff" },
		},
	},
	init = function()
		-- vim.api.nvim_create_user_command("Format", format, { desc = "Format code" })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("_format", { clear = true }),
			callback = format,
			-- command = "Format",
		})
	end,
}
