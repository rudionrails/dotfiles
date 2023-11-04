-- LSP Configuration & Plugins
return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	event = { "VimEnter", "BufReadPre", "BufNewFile" },
	dependencies = {
		-- LSP Support
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local lsp_zero = require("lsp-zero")

		lsp_zero.on_attach(function(_, bufnr)
			-- see :help lsp-zero-keybindings
			lsp_zero.default_keymaps({ buffer = bufnr })
		end)

		require("mason").setup({
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "yamlls", "tsserver" },
			automatic_installation = true,
			handlers = {
				lsp_zero.default_setup,
				lua_ls = function()
					-- (Optional) configure lua language server
					local lua_opts = lsp_zero.nvim_lua_ls()
					require("lspconfig").lua_ls.setup(lua_opts)
				end,
				-- tsserver = function()
				-- 	require("lspconfig").tsserver.setup({
				-- 		settings = {
				-- 			completions = {
				-- 				completeFunctionCalls = true,
				-- 			},
				-- 		},
				-- 	})
				-- end,
			},
		})
		require("mason-tool-installer").setup({
			ensure_installed = { "prettier", "stylua", "eslint_d" },
		})
	end,
	init = function()
		-- diagnostics
		for name, icon in pairs(require("core.config").icons.diagnostics) do
			-- name = "DiagnosticSign" .. name
			name = "DiagnosticSign" .. name:gsub("^%l", string.upper) -- capitalize first letter
			vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
		end
		-- -- code formatting on <leader>p and on file-save
		-- vim.keymap.set('n', '<leader>p', function()
		--   vim.lsp.buf.format()
		-- end, { silent = true, desc = 'Format Document and make it [P]retty' })

		-- vim.api.nvim_create_autocmd("BufWritePre", {
		-- 	callback = function()
		-- 		vim.lsp.buf.format()
		-- 	end,
		-- })

		-- code action on diagnostics
		vim.keymap.set("n", "<leader>a", function()
			vim.lsp.buf.code_action()
		end, { silent = true, desc = "Code [A]ction" })
	end,
}
