local icons = require("core.config").icons

-- diagnostic icons
for name, icon in pairs(icons.diagnostics) do
	-- name = "DiagnosticSign" .. name
	name = "DiagnosticSign" .. name:gsub("^%l", string.upper) -- capitalize first letter
	vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
end

return {
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

			-- utility Lua functions
			"nvim-lua/plenary.nvim",

			-- for lsp keymap
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			local lspconfig = require("lspconfig")
			-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

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
				-- install lsp automatically if not already present
				auto_install = true,

				-- See `:h mason-lspconfig.setup_handlers()`
				handlers = {
					function(server_name)
						-- This handles overriding only values explicitly passed
						-- by the server configuration above. Useful when disabling
						-- certain features of an LSP (for example, turning off formatting for tsserver)
						lspconfig[server_name].setup({
							-- capabilities = vim.tbl_deep_extend("force", {}, capabilities),
							capabilities = capabilities,
						})
					end,
				},
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
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
					-- map("n", "<F2>", vim.lsp.buf.rename, opts)
					-- nmap("<leader>p", vim.lsp.buf.format, "Make code [p]retty")
					nmap("<leader>a", vim.lsp.buf.code_action, "Code [a]ction")

					-- 	nmap("gd", vim.lsp.buf.definition, "[G]oto [d]efinition")
					-- 	nmap("gr", vim.lsp.buf.references, "[G]oto [r]eferences")
					-- 	nmap("gi", vim.lsp.buf.implementation, "[G]oto [i]mplementation")
					-- 	nmap("gt", vim.lsp.buf.type_definition, "Goto [t]ype definition")

					nmap("gd", "<CMD>Telescope lsp_definitions<CR>", "[G]oto [D]efinition")
					nmap("gr", "<CMD>Telescope lsp_references<CR>", "[G]oto [R]eferences")
					nmap("gi", "<CMD>Telescope lsp_implementations<CR>", "[G]oto [I]mplementation")
					nmap("gt", "<CMD>Telescope lsp_type_definitions<CR>", "[G]oto [T]ype definition")
				end,
			})
		end,
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		version = false, -- take from git main, because last release is too long ago
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- LSP completion source
			"hrsh7th/cmp-cmdline", -- cmp source for cmdline

			-- Useful completion sources
			"hrsh7th/cmp-nvim-lua", -- source for NeoVim lua api
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-buffer", -- source for text in buffer
			"hrsh7th/cmp-path", -- source for file system paths
			-- "saadparwaiz1/cmp_luasnip", -- for autocompletion
			-- "L3MON4D3/LuaSnip", -- snippet angine
			-- "rafamadriz/friendly-snippets", -- useful snippets
			-- "hrsh7th/cmp-vsnip", -- VSCode(LSP)'s snippet feature in vim/nvim

			"onsails/lspkind.nvim", -- vs-code like icons
		},

		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")
			-- local luasnip = require("luasnip")

			-- -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
			-- require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				completion = {
					completeopt = "menu,menuone,noinsert",
				},

				-- snippet = {
				-- 	expand = function(args)
				-- 		luasnip.lsp_expand(args.body)
				-- 	end,
				-- },

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
					["<C-CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),

					["<TAB>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						-- elseif luasnip.expand_or_locally_jumpable() then
						-- 	luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-TAB>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						-- elseif luasnip.expand_or_locally_jumpable(-1) then
						-- 	luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),

				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},

				formatting = {
					format = lspkind.cmp_format({
						maxwidth = 50,
						ellipsis_char = "...",
					}),
				},

				sources = cmp.config.sources({
					{ name = "nvim_lsp" }, -- from language server
					{ name = "nvim_lsp_signature_help" }, -- display function signatures with current parameter emphasized
					{ name = "nvim_lua" }, -- complete neovim's Lua runtime API such vim.lsp.*
					-- { name = "luasnip" },
					-- { name = "vsnip", keyword_length = 2 }, -- nvim-cmp source for vim-vsnip
				}, {
					{ name = "buffer" }, -- source current buffer
					-- { name = "path" }, -- file paths
					-- { name = "calc" }, -- source for math calculation
				}),
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
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})
		end,
	},

	-- @see https://git.sr.ht/~whynothugo/lsp_lines.nvim
	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			vim.diagnostic.config({
				severity_sort = true,

				-- keep the default by showing virtual_text, but not the virtual_lines
				-- it will be swapped when toggling
				virtual_lines = false,
				virtual_text = true,
			})

			require("lsp_lines").setup()

			vim.keymap.set("n", "<leader>l", function()
				local virtual_lines = vim.diagnostic.config().virtual_lines
				local virtual_text = vim.diagnostic.config().virtual_text

				vim.diagnostic.config({
					virtual_lines = not virtual_lines,
					virtual_text = not virtual_text,
				})
			end, { desc = "Toggle LSP [L]ines" })
		end,
	},

	-- Code outline sidebar powered by LSP.
	--
	-- @see https://github.com/hedyhli/outline.nvim
	-- For default config and keymaps, @see here: https://github.com/hedyhli/outline.nvim?tab=readme-ov-file#default-options
	{
		"hedyhli/outline.nvim",
		lazy = true,
		cmd = { "Outline", "OutlineOpen" },
		init = function()
			vim.keymap.set("n", "<leader>o", "<CMD> Outline <CR>", { desc = "Show Symbols [O]utline" })
		end,
		config = function()
			require("outline").setup({
				outline_window = {
					width = 15,
					relative_width = false,
				},
				preview_window = {
					-- Automatically open preview of code location when navigating outline window
					auto_preview = true,
				},
			})
		end,
	},

	-- Formatting
	{
		"stevearc/conform.nvim",
		config = function()
			local conform = require("conform")
			local formattingOptions = {
				timeout_ms = 3000,
				async = false, -- nope, want to wait until finished
				quiet = false, -- need to know when things don't work
				lsp_fallback = true, -- just in case LSP can help
			}

			conform.setup({
				format = {},
				notify_on_error = true,
				format_on_save = formattingOptions,
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "eslint_d", { "prettierd", "prettier" } },
					typescript = { "eslint_d", { "prettierd", "prettier" } },
					javascriptreact = { "eslint_d", { "prettierd", "prettier" } },
					typescriptreact = { "eslint_d", { "prettierd", "prettier" } },
				},
			})

			vim.keymap.set("n", "<leader>p", function()
				conform.format(formattingOptions)
			end, { desc = "Make code [p]retty" })
		end,
	},

	-- -- Linting
	-- {
	-- 	"mfussenegger/nvim-lint",
	-- 	-- lazy = true,
	-- 	opts = {
	-- 		linters_by_ft = {
	-- 			javascript = { "eslint_d" },
	-- 			typescript = { "eslint_d" },
	-- 			javascriptreact = { "eslint_d" },
	-- 			typescriptreact = { "eslint_d" },
	-- 			svelte = { "eslint_d" },
	-- 			python = { "pylint" },
	-- 		},
	--
	-- 		linters = {
	-- 			-- -- Example of using eslint only when a .eslintrx.json file is present
	-- 			-- eslint_d = {
	-- 			--   -- dynamically enable/disable linters based on the context.
	-- 			--   --
	-- 			--   -- ctx gets `filename` and `dirname`
	-- 			--   condition = function(ctx)
	-- 			--     return vim.fs.find({ ".eslintrc.json" }, { path = ctx.filename, upward = true })[1]
	-- 			--   end,
	-- 			-- },
	-- 		},
	-- 	},
	-- 	config = function(_, opts)
	-- 		local lint = require("lint")
	-- 		local M = {}
	--
	-- 		lint.linters_by_ft = opts.linters_by_ft
	--
	-- 		function M.debounce(ms, fn)
	-- 			local timer = vim.loop.new_timer()
	-- 			return function(...)
	-- 				local argv = { ... }
	-- 				timer:start(ms, 0, function()
	-- 					timer:stop()
	-- 					vim.schedule_wrap(fn)(unpack(argv))
	-- 				end)
	-- 			end
	-- 		end
	--
	-- 		function M.lint()
	-- 			-- Use nvim-lint's logic first:
	-- 			-- * checks if linters exist for the full filetype first
	-- 			-- * otherwise will split filetype by "." and add all those linters
	-- 			-- * this differs from conform.nvim which only uses the first filetype that has a formatter
	-- 			local names = lint._resolve_linter_by_ft(vim.bo.filetype)
	--
	-- 			-- Add fallback linters.
	-- 			if #names == 0 then
	-- 				vim.list_extend(names, lint.linters_by_ft["_"] or {})
	-- 			end
	--
	-- 			-- Add global linters.
	-- 			vim.list_extend(names, lint.linters_by_ft["*"] or {})
	--
	-- 			-- Filter out linters that don't exist or don't match the condition.
	-- 			local ctx = { filename = vim.api.nvim_buf_get_name(0) }
	-- 			ctx.dirname = vim.fn.fnamemodify(ctx.filename, ":h")
	-- 			names = vim.tbl_filter(function(name)
	-- 				local linter = lint.linters[name]
	-- 				if not linter then
	-- 					vim.notify("Linter not found: " .. name, vim.log.levels.WARN)
	-- 				end
	--
	-- 				return linter and not (type(linter) == "table" and linter.condition and not linter.condition(ctx))
	-- 			end, names)
	--
	-- 			-- Run linters.
	-- 			if #names > 0 then
	-- 				vim.notify("Linting with " .. vim.inspect(names), vim.log.levels.DEBUG)
	-- 				lint.try_lint(names)
	-- 			end
	-- 		end
	--
	-- 		vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
	-- 			group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
	-- 			callback = M.debounce(100, M.lint),
	-- 		})
	-- 	end,
	-- },

	-- A tree like view for symbols in Neovim using the Language Server Protocol. Supports all your favourite languages.
	--
	-- @see https://github.com/simrat39/symbols-outline.nvim
	{
		"simrat39/symbols-outline.nvim",
		event = "VeryLazy",
		config = function()
			require("symbols-outline").setup()
		end,
	},

	-- A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.
	{
		"folke/trouble.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		cmd = { "Trouble" },
		config = function()
			require("trouble").setup({
				position = "bottom",
				-- auto_open = true,
				use_diagnostic_signs = true, -- uses lsp diagnostic signs
			})
		end,
	},
}
