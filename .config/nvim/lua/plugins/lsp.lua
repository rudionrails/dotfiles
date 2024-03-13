return {
	-- @see https://git.sr.ht/~whynothugo/lsp_lines.nvim
	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		init = function()
			vim.diagnostic.config({
				severity_sort = true,

				-- keep the default by showing virtual_text, but not the virtual_lines
				-- it will be swapped when toggling
				virtual_lines = false,
				virtual_text = true,
			})
		end,
		keys = {
			{
				"<leader>l",
				function()
					local virtual_lines = vim.diagnostic.config().virtual_lines
					local virtual_text = vim.diagnostic.config().virtual_text

					vim.diagnostic.config({
						virtual_lines = not virtual_lines,
						virtual_text = not virtual_text,
					})
				end,
				desc = "Toggle LSP [L]ines",
			},
		},
		config = function()
			require("lsp_lines").setup()
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
				desc = "LSP formatting",
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
					local nmap = function(lhs, rhs, desc)
						vim.keymap.set("n", lhs, rhs, { buffer = event.buf, desc = desc })
					end

					-- Enable completion triggered by <c-x><c-o>
					vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					-- these will be buffer-local keybindings, as they only work if you have an active language server
					nmap("K", vim.lsp.buf.hover, "Show lsp hover")
					nmap("gD", vim.lsp.buf.declaration, "Goto [D]eclaration")
					nmap("gs", vim.lsp.buf.signature_help, "Goto [s]ignature")
					-- map("n", "<F2>", vim.lsp.buf.rename, opts)
					nmap("<leader>p", vim.lsp.buf.format, "Make code [p]retty")
					nmap("<leader>a", vim.lsp.buf.code_action, "Code [a]ction")

					-- local status, _ = pcall(require, "telescope")
					-- if status then
					nmap("gd", "<CMD>Telescope lsp_definitions<CR>", "[G]oto [D]efinition")
					nmap("gr", "<CMD>Telescope lsp_references<CR>", "[G]oto [R]eferences")
					nmap("gi", "<CMD>Telescope lsp_implementations<CR>", "[G]oto [I]mplementation")
					nmap("gt", "<CMD>Telescope lsp_type_definitions<CR>", "[G]oto [T]ype definition")
					-- else
					-- 	nmap("gd", vim.lsp.buf.definition, "[G]oto [d]efinition")
					-- 	nmap("gr", vim.lsp.buf.references, "[G]oto [r]eferences")
					-- 	nmap("gi", vim.lsp.buf.implementation, "[G]oto [i]mplementation")
					-- 	nmap("gt", vim.lsp.buf.type_definition, "Goto [t]ype definition")
					-- end
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
