-- Autocompletion
return {
	"hrsh7th/nvim-cmp",
	version = false, -- take from git main, because last release is too long ago
	event = "InsertEnter",
	dependencies = {
		-- LSP completion source
		"hrsh7th/cmp-nvim-lsp",

		-- Useful completion sources
		"hrsh7th/cmp-nvim-lua", -- source for NeoVim lua api
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"L3MON4D3/LuaSnip", -- snippet angine
		"rafamadriz/friendly-snippets", -- useful snippets
		-- "hrsh7th/cmp-vsnip", -- VSCode(LSP)'s snippet feature in vim/nvim
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
				["<TAB>"] = function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					else
						fallback()
					end
				end,
			},

			sources = cmp.config.sources({
				{ name = "nvim_lsp", keyword_length = 3 }, -- from language server
				{ name = "nvim_lsp_signature_help" }, -- display function signatures with current parameter emphasized
				{ name = "nvim_lua", keyword_length = 2 }, -- complete neovim's Lua runtime API such vim.lsp.*
				{ name = "luasnip" },
				-- { name = "vsnip", keyword_length = 2 }, -- nvim-cmp source for vim-vsnip
				{ name = "buffer", keyword_length = 2 }, -- source current buffer
				{ name = "path" }, -- file paths
				-- { name = "calc" }, -- source for math calculation
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
		})
	end,
}
