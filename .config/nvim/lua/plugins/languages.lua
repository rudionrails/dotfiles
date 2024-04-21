local config = require("core.config")
local utils = require("core.utils")

-- diagnostic icons
for name, icon in pairs(config.icons.diagnostics) do
	-- name = "DiagnosticSign" .. name
	name = "DiagnosticSign" .. name:gsub("^%l", string.upper) -- capitalize first letter
	vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
end

return {
	-- A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.
	{
		"folke/trouble.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		cmd = "Trouble",
		config = function()
			require("trouble").setup({
				position = "bottom",
				-- auto_open = true,
				use_diagnostic_signs = true, -- uses lsp diagnostic signs
			})
		end,
	},

	-- LSP Configuration & Plugins
	{
		"williamboman/mason-lspconfig.nvim",
		event = { "User FileOpened" }, -- , "VeryLazy" },
		dependencies = {
			-- Manage LSP servers, DAP servers, linters, and formatters.
			-- @see https://github.com/williamboman/mason.nvim
			{
				"williamboman/mason.nvim",
				cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
				opts = {
					ensure_installed = {
						"stylua",
						"luacheck",
					},
					ui = {
						border = "rounded",
						icons = {
							package_installed = config.icons.ui.Check,
							package_pending = config.icons.ui.CircleDashed,
							package_uninstalled = config.icons.ui.CircleOutlined,
						},
					},
				},
			},

			-- quickstart configs for Nvim LSP
			"hrsh7th/cmp-nvim-lsp",
			"neovim/nvim-lspconfig",

			-- utility Lua functions
			"nvim-lua/plenary.nvim",
		},
		opts = {
			-- install lsp automatically if not already present
			auto_install = true,

			-- See `:h mason-lspconfig.setup_handlers()`
			handlers = {
				function(server_name)
					local lspconfig = require("lspconfig")
					-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
					local capabilities =
						require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

					-- This handles overriding only values explicitly passed
					-- by the server configuration above. Useful when disabling
					-- certain features of an LSP (for example, turning off formatting for tsserver)
					lspconfig[server_name].setup({
						capabilities = vim.tbl_deep_extend("force", {}, capabilities),
					})
				end,
			},
		},
		config = function(_, opts)
			require("mason-lspconfig").setup(opts)

			local callback = function(event)
				local nmap = function(lhs, rhs, desc)
					vim.keymap.set("n", lhs, rhs, { buffer = event.buf, desc = desc })
				end

				-- Enable completion triggered by <c-x><c-o>
				vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				-- @see https://github.com/neovim/nvim-lspconfig
				nmap("[d", vim.diagnostic.goto_prev)
				nmap("]d", vim.diagnostic.goto_next)
				-- nmap("<space>e", vim.diagnostic.open_float)
				-- nmap("<space>q", vim.diagnostic.setloclist)
				nmap("K", vim.lsp.buf.hover, "Show lsp hover")
				nmap("gD", vim.lsp.buf.declaration, "Goto [D]eclaration")
				nmap("gs", vim.lsp.buf.signature_help, "Goto [s]ignature")
				-- nmap("<leader>p", vim.lsp.buf.format, "Make code [p]retty")
				nmap("<leader>a", vim.lsp.buf.code_action, "Code [a]ction")
				nmap("<leader>r", vim.lsp.buf.rename, "[R]ename word under cursor within project")
				-- 	nmap("gd", vim.lsp.buf.definition, "[G]oto [d]efinition")
				-- 	nmap("gr", vim.lsp.buf.references, "[G]oto [r]eferences")
				-- 	nmap("gi", vim.lsp.buf.implementation, "[G]oto [i]mplementation")
				-- 	nmap("gt", vim.lsp.buf.type_definition, "Goto [t]ype definition")
				nmap("gd", "<CMD>Telescope lsp_definitions<CR>", "[G]oto [D]efinition")
				nmap("gr", "<CMD>Telescope lsp_references<CR>", "[G]oto [R]eferences")
				nmap("gi", "<CMD>Telescope lsp_implementations<CR>", "[G]oto [I]mplementation")
				nmap("gt", "<CMD>Telescope lsp_type_definitions<CR>", "[G]oto [T]ype definition")
			end

			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = callback,
			})
		end,
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		version = false, -- take from git main, because last release is too long ago
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			-- vs-code like formatting w/ icons
			"onsails/lspkind.nvim",

			-- completion sources
			"hrsh7th/cmp-nvim-lsp", -- LSP completion source
			"hrsh7th/cmp-buffer", -- source for text in buffer
			"hrsh7th/cmp-path", -- source for file system paths
			"hrsh7th/cmp-cmdline", -- cmp source for cmdline
			"hrsh7th/cmp-nvim-lua", -- source for NeoVim lua api
			"hrsh7th/cmp-nvim-lsp-signature-help",

			-- snippet enginre, @see https://github.com/hrsh7th/nvim-cmp?tab=readme-ov-file#recommended-configuration
			"saadparwaiz1/cmp_luasnip",
			{
				"L3MON4D3/LuaSnip",
				-- dependencies = { "rafamadriz/friendly-snippets" },
				-- config = function()
				-- 	require("luasnip.loaders.from_vscode").lazy_load()
				-- end,
			},
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")

			local has_words_before = function()
				unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			-- -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
			-- require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				completion = {
					completeopt = "menu,menuone,noinsert",
				},

				-- Read `:h ins-completion` to better understand mappings
				mapping = cmp.mapping.preset.insert({
					-- select previous/next item
					["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),

					-- confirm / abort selection
					["<C-h>"] = cmp.mapping.abort(),
					["<C-l>"] = cmp.mapping.confirm({ select = true }),

					-- scroll the documentation
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),

					-- Manually trigger a completion from nvim-cmp
					["<C-Space>"] = cmp.mapping.complete({}),

					-- confirm selection
					-- ["<C-CR>"] = cmp.mapping.confirm({
					-- 	behavior = cmp.ConfirmBehavior.Replace,
					-- 	select = true,
					-- }),
					["<CR>"] = cmp.mapping({
						i = function(fallback)
							if cmp.visible() and cmp.get_active_entry() then
								cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
							else
								fallback()
							end
						end,
						s = cmp.mapping.confirm({ select = true }),
						-- c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
					}),

					["<TAB>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						elseif has_words_before() then
							cmp.complete()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-TAB>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.expand_or_locally_jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),

				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},

				window = {
					completion = { border = "rounded", side_padding = 1, winhighlight = "CursorLine:Visual" },
					documentation = { border = "rounded" },
				},

				formatting = {
					-- fields = { "kind", "abbr", "menu" },
					format = lspkind.cmp_format({
						maxwidth = 50,
						ellipsis_char = "...",
					}),
				},

				sources = {
					{ name = "nvim_lsp_signature_help" }, -- display function signatures with current parameter emphasized
					{ name = "nvim_lsp" }, -- from language server
					{ name = "nvim_lua" }, -- complete neovim's Lua runtime API such vim.lsp.*
					{ name = "luasnip" },
					-- { name = "buffer" }, -- source current buffer
					-- { name = "path" }, -- file paths
					-- { name = "calc" }, -- source for math calculation
				},
			})

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "cmdline" },
					{ name = "path" },
				},
			})
		end,
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
						virtual_lines = not vim.diagnostic.config().virtual_lines,
						virtual_text = not vim.diagnostic.config().virtual_text,
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
				width = 15,
				relative_width = false,
			},
			preview_window = {
				-- Automatically open preview of code location when navigating outline window
				auto_preview = true,
			},
		},
	},

	-- Formatting
	{
		"stevearc/conform.nvim",
		cmd = { "Format", "ConformInfo" },
		keys = {
			{ "<leader>p", "<CMD>Format<CR>", desc = "Format code [p]retty" },
		},
		opts = {
			notify_on_error = true,
			-- formatters = {
			-- 	sqlfluff = {
			-- 		command = "sqlfluff",
			-- 		args = { "fix", "-" },
			-- 		stdin = true,
			-- 	},
			-- },
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "eslint_d", { "prettierd", "prettier" } },
				typescript = { "eslint_d", { "prettierd", "prettier" } },
				javascriptreact = { "eslint_d", { "prettierd", "prettier" } },
				typescriptreact = { "eslint_d", { "prettierd", "prettier" } },
				yaml = { { "prettierd", "prettier" } },
				json = { { "prettierd", "prettier" } },
				-- sql = { "sqlfluff" }, -- { "sql-formatter", "sqlfmt", "sqlfluff" },
			},
		},
		init = function()
			local conform = require("conform")
			local M = {}

			function M.format()
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
						lsp_fallback = true, -- just in case LSP can help
					})
				end
			end

			vim.api.nvim_create_user_command("Format", M.format, {})
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = vim.api.nvim_create_augroup("_format", { clear = true }),
				callback = M.format,
			})
		end,
	},

	-- Linting
	--
	-- below is taken from https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/linting.lua
	{
		"mfussenegger/nvim-lint",
		event = { "VeryLazy" },
		keys = {
			{ "<leader>l", "<CMD>Lint<CR>", desc = "[L]int code" },
		},
		opts = {
			linters_by_ft = {
				lua = { "luacheck" },
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				ruby = { "rubocop" },
				python = { "pylint" },
				-- sql = { "sqlfluff" },
				svelte = { "eslint_d" },
			},

			linters = {
				-- -- Example of using eslint only when a .eslintrx.json file is present
				-- eslint_d = {
				--   -- dynamically enable/disable linters based on the context.
				--   --
				--   -- ctx gets `filename` and `dirname`
				--   condition = function(ctx)
				--     return vim.fs.find({ ".eslintrc.json" }, { path = ctx.filename, upward = true })[1]
				--   end,
				-- },
			},
		},
		init = function()
			local M = {}

			function M.lint()
				local lint = require("lint")
				-- Use nvim-lint's logic first:
				-- * checks if linters exist for the full filetype first
				-- * otherwise will split filetype by "." and add all those linters
				-- * this differs from conform.nvim which only uses the first filetype that has a formatter
				local names = lint._resolve_linter_by_ft(vim.bo.filetype)

				-- Add fallback linters.
				if #names == 0 then
					vim.list_extend(names, lint.linters_by_ft["_"] or {})
				end

				-- Add global linters.
				vim.list_extend(names, lint.linters_by_ft["*"] or {})

				-- Filter out linters that don't exist or don't match the condition.
				local ctx = { filename = vim.api.nvim_buf_get_name(0) }
				ctx.dirname = vim.fn.fnamemodify(ctx.filename, ":h")
				names = vim.tbl_filter(function(name)
					local linter = lint.linters[name]
					if not linter then
						vim.notify("Linter not found: " .. name, vim.log.levels.WARN)
					end

					return linter and not (type(linter) == "table" and linter.condition and not linter.condition(ctx))
				end, names)

				-- Run linters
				if #names > 0 then
					vim.notify("Linting with " .. table.concat(names, ", "), vim.log.levels.INFO)
					lint.try_lint(names)
				end
			end

			vim.api.nvim_create_user_command("Lint", utils.debounce(150, M.lint), {})
			vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
				group = vim.api.nvim_create_augroup("_lint", { clear = true }),
				command = "Lint",
			})
		end,
		config = function(_, opts)
			local lint = require("lint")

			for name, linter in pairs(opts.linters) do
				if type(linter) == "table" and type(lint.linters[name]) == "table" then
					lint.linters[name] = vim.tbl_deep_extend("force", lint.linters[name], linter)
				else
					lint.linters[name] = linter
				end
			end

			lint.linters_by_ft = opts.linters_by_ft
		end,
	},
}
