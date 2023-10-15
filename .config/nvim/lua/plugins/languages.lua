return {
	-- LSP Configuration & Plugins
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			-- LSP Support
			{
				"neovim/nvim-lspconfig",
				"williamboman/mason.nvim",
				"williamboman/mason-lspconfig.nvim",
				"WhoIsSethDaniel/mason-tool-installer.nvim",
			},
		},
		config = function()
			local lsp_zero = require("lsp-zero")

			lsp_zero.on_attach(function(_, bufnr)
				-- see :help lsp-zero-keybindings
				lsp_zero.default_keymaps({ buffer = bufnr })
			end)

			require("mason").setup()
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
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		version = false, -- take from git main, because last release is too long ago
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua", -- source for NeoVim lua api
			"hrsh7th/cmp-buffer", -- source for text in buffer
			"hrsh7th/cmp-path", -- source for file system paths
			"saadparwaiz1/cmp_luasnip", -- for autocompletion
			"L3MON4D3/LuaSnip", -- snippet angine
			"rafamadriz/friendly-snippets", -- useful snippets
			"onsails/lspkind.nvim", -- vs-code like icons
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")

			-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				completion = {
					completeopt = "menu,menuone,noinsert",
				},

				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},

				mapping = {
					["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<CR>"] = cmp.mapping.confirm({ select = false }),
				},

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
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
			})
		end,
	},
}
