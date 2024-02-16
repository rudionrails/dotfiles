return {
	-- @see https://git.sr.ht/~whynothugo/lsp_lines.nvim
	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		init = function()
			vim.diagnostic.config({
				severity_sort = true,
				virtual_text = false, -- disable virtual_text since it's redundant due to lsp_lines.
			})
		end,
		config = function()
			require("lsp_lines").setup()

			local function toggle()
				local current_value = vim.diagnostic.config().virtual_lines

				vim.diagnostic.config({
					virtual_lines = not current_value,
					virtual_text = current_value,
				})
			end

			vim.keymap.set("n", "<Leader>l", toggle, { desc = "Toggle LSP [L]ines" })
		end,
	},

	-- LSP Configuration & Plugins
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- quickstart configs for Nvim LSP
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",

			-- install language servers and ensure they are hooked into lspconfig
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- allow non-LSP sources to hook into LSP client, e.g. linters and formatters
			"jay-babu/mason-null-ls.nvim",
			"nvimtools/none-ls.nvim",

			-- utility Lua functions
			"nvim-lua/plenary.nvim",
		},
		init = function()
			-- diagnostic icons
			local icons = require("core.config").icons
			for name, icon in pairs(icons.diagnostics) do
				-- name = "DiagnosticSign" .. name
				name = "DiagnosticSign" .. name:gsub("^%l", string.upper) -- capitalize first letter
				vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
			end

			vim.api.nvim_create_autocmd("BufWritePre", {
				-- buffer = event.buf,
				callback = function()
					vim.lsp.buf.format()
				end,
			})

			-- @see https://github.com/neovim/nvim-lspconfig
			-- vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
			-- vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					local map = function(mode, lhs, rhs, opts)
						vim.keymap.set(mode, lhs, rhs, vim.list_extend(opts, { silent = true, buffer = event.buf }))
					end

					-- Enable completion triggered by <c-x><c-o>
					vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					-- these will be buffer-local keybindings, as they only work if you have an active language server
					map("n", "K", "<CMD>lua vim.lsp.buf.hover()<CR>", { desc = "Show lsp hover" })
					map("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>", { desc = "Goto [d]efinition" })
					map("n", "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>", { desc = "Goto [D]eclaration" })
					map("n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>", { desc = "Goto [i]mplementation" })
					map("n", "gt", "<CMD>lua vim.lsp.buf.type_definition()<CR>", { desc = "Goto [t]ype definition" })
					map("n", "gr", "<CMD>lua vim.lsp.buf.references()<CR>", { desc = "Goto [r]eferences" })
					map("n", "gs", "<CMD>lua vim.lsp.buf.signature_help()<CR>", { desc = "Goto [s]ignature" })
					-- map("n", "<F2>", "<CMD>lua vim.lsp.buf.rename()<CR>", opts)
					map({ "n", "x" }, "<leader>p", "<CMD>lua vim.lsp.buf.format()<CR>", { desc = "Make code [p]retty" })
					map({ "n", "v" }, "<leader>a", "<CMD>lua vim.lsp.buf.code_action()<CR>", { desc = "Code [a]ction" })
				end,
			})
		end,
		config = function()
			local icons = require("core.config").icons
			local lsp_config = require("lspconfig")

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

			require("mason").setup({
				ui = {
					border = "rounded",
					icons = {
						package_installed = icons.ui.Check,
						package_pending = icons.ui.CircleDashed,
						package_uninstalled = icons.ui.CircleOutlined,
					},
				},
			})

			require("mason-lspconfig").setup({
				-- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "lua_ls" }
				-- This setting has no relation with the `automatic_installation` setting.
				-- ensure_installed = { "lua_ls", "tsserver", "rust_analyzer" },

				-- See `:h mason-lspconfig.setup_handlers()`
				handlers = {
					function(server_name) -- default handler (optional)
						lsp_config[server_name].setup({
							capabilities = capabilities,
						})
					end,
				},
			})

			require("mason-null-ls").setup({
				-- ensure_installed = { "stylua", "eslint_d", "prettierd" },
				handlers = {},
			})

			require("null-ls").setup({
				sources = {
					-- Anything not supported by mason.
				},
			})

			require("core.mason-autoinstall").setup()
		end,
	},
}
