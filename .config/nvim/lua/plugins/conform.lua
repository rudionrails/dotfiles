-- formatting
return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	init = function()
		local conform = require("conform")

		vim.keymap.set({ "n", "v" }, "<leader>p", function()
			--   vim.lsp.buf.format()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range and make it [P]retty" })
	end,
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { { "prettierd", "prettier" } },
				typescript = { { "prettierd", "prettier" } },
				javascriptreact = { { "prettierd", "prettier" } },
				typescriptreact = { { "prettierd", "prettier" } },
				svelte = { { "prettierd", "prettier" } },
				css = { { "prettierd", "prettier" } },
				html = { { "prettierd", "prettier" } },
				json = { { "prettierd", "prettier" } },
				yaml = { { "prettierd", "prettier" } },
				markdown = { { "prettierd", "prettier" } },
				graphql = { { "prettierd", "prettier" } },
				lua = { "stylua" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false, -- not recommended to change
				quiet = false, -- not recommended to change
				timeout_ms = 1000,
			},
		})
	end,
}
