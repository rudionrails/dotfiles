local icons = require("core.icons")

-- diagnostics
vim.diagnostic.config({
	virtual_text = true,
	-- virtual_text = {
	-- 	spacing = 2,
	-- 	prefix = "●",
	-- 	source = true, -- "if_many",
	-- },
	severity_sort = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
			[vim.diagnostic.severity.WARN] = icons.diagnostics.Warn,
			[vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
			[vim.diagnostic.severity.INFO] = icons.diagnostics.Info,
		},
	},
})

return {
	{
		"rudionrails/quarry.nvim",
		event = { "VeryLazy", "User FileOpened" },
		dependencies = {
			{
				"williamboman/mason.nvim",
				cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
				opts = {
					ui = {
						border = "rounded",
						icons = {
							package_installed = icons.ui.Check,
							package_pending = icons.ui.CircleDashed,
							package_uninstalled = icons.ui.CircleOutlined,
						},
					},
				},
			},
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",

			-- needed for additional capabilities
			"hrsh7th/cmp-nvim-lsp",
			"nvim-lua/plenary.nvim",
		},
		opts = {
			on_attach = function(client, bufnr)
				---
				-- Keymap settings
				local nmap = function(lhs, rhs, desc)
					vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc })
				end

				-- Enable completion triggered by <c-x><c-o>
				vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

				-- @see https://github.com/neovim/nvim-lspconfig
				nmap("[d", vim.diagnostic.goto_prev)
				nmap("]d", vim.diagnostic.goto_next)
				nmap("K", vim.lsp.buf.hover, "Show lsp hover")
				nmap("gD", vim.lsp.buf.declaration, "Goto [D]eclaration")
				nmap("gs", vim.lsp.buf.signature_help, "Goto [s]ignature")
				nmap("<leader>a", vim.lsp.buf.code_action, "Code [a]ction")
				nmap("<leader>r", vim.lsp.buf.rename, "[R]ename word under cursor within project")
				nmap("<leader>h", function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }))
				end, "Toggle inlay [h]int")
				-- 	nmap("gd", vim.lsp.buf.definition, "[G]oto [d]efinition")
				-- 	nmap("gr", vim.lsp.buf.references, "[G]oto [r]eferences")
				-- 	nmap("gi", vim.lsp.buf.implementation, "[G]oto [i]mplementation")
				-- 	nmap("gt", vim.lsp.buf.type_definition, "Goto [t]ype definition")
				nmap("gd", "<CMD>Telescope lsp_definitions<CR>", "[G]oto [d]efinition")
				nmap("gr", "<CMD>Telescope lsp_references<CR>", "[G]oto [r]eferences")
				nmap("gi", "<CMD>Telescope lsp_implementations<CR>", "[G]oto [i]mplementation")
				nmap("gt", "<CMD>Telescope lsp_type_definitions<CR>", "[G]oto [t]ype definition")

				---
				-- Client capabilities for the current buffer
				if client.supports_method("textDocument/documentHighlight") then
					local highlight_group = vim.api.nvim_create_augroup("_document_highlight_attach", { clear = false })

					-- Highlight on current word
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						group = highlight_group,
						buffer = bufnr,
						callback = vim.lsp.buf.document_highlight,
					})

					-- Remove highlight on current word
					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						group = highlight_group,
						buffer = bufnr,
						callback = vim.lsp.buf.clear_references,
					})
				end

				-- enable inlay hints
				if client.supports_method("textDocument/inlayHint") then
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				end

				-- enable code lens
				if client.supports_method("textDocument/codeLens") then
					vim.lsp.codelens.refresh()
					vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
						buffer = bufnr,
						callback = vim.lsp.codelens.refresh,
					})
				end
			end,

			capabilities = function()
				return vim.tbl_deep_extend(
					"force",
					{},
					vim.lsp.protocol.make_client_capabilities(),
					require("cmp_nvim_lsp").default_capabilities()
				)
			end,
		},
	},

	-- @see https://git.sr.ht/~whynothugo/lsp_lines.nvim
	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		event = { "VeryLazy" }, -- "User FileOpened"
		keys = {
			{
				"<leader>L",
				function()
					vim.diagnostic.config({
						virtual_text = not vim.diagnostic.config().virtual_text,
						virtual_lines = not vim.diagnostic.config().virtual_lines,
					})
				end,
				desc = "Toggle LSP [L]ines",
			},
		},
		config = function()
			vim.diagnostic.config({
				severity_sort = true,
				-- keep the default by showing virtual_text, but not the virtual_lines
				-- it will be swapped when toggling
				virtual_lines = false,
				virtual_text = true,
			})

			require("lsp_lines").setup()
		end,
	},

	-- Code outline sidebar powered by LSP.
	--
	-- @see https://github.com/hedyhli/outline.nvim
	-- For default config and keymaps, @see here: https://github.com/hedyhli/outline.nvim?tab=readme-ov-file#default-options
	{
		"hedyhli/outline.nvim",
		cmd = { "Outline", "OutlineOpen" },
		keys = { -- Example mapping to toggle outline
			{ "<leader>o", "<CMD>Outline<CR>", desc = "Show Symbols [O]utline" },
		},
		opts = {
			outline_window = {
				width = 45,
				relative_width = false,
			},
			preview_window = {
				-- Automatically open preview of code location when navigating outline window
				auto_preview = true,
			},
		},
	},
}
