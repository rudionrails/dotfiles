return {
	-- Use your Neovim like using Cursor AI IDE!
	-- @see https://github.com/yetone/avante.nvim
	-- "yetone/avante.nvim",

	-- -- AI completion
	-- {
	-- 	"Exafunction/codeium.nvim",
	-- 	cmd = "Codeium",
	-- 	event = "BufEnter", -- "InsertEnter",
	-- 	build = ":Codeium Auth",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"hrsh7th/nvim-cmp",
	-- 	},
	-- 	opts = {
	-- 		enable_chat = true,
	-- 		virtual_text = {
	-- 			key_bindings = {
	-- 				accept = false, -- handled by nvim-cmp
	-- 				-- next = "<M-]>",
	-- 				-- prev = "<M-[>",
	-- 			},
	-- 		},
	-- 		-- tools = {
	-- 		-- 	-- Language server
	-- 		-- 	language_server = {
	-- 		-- 		-- Customize completion behavior
	-- 		-- 		completion = {
	-- 		-- 			-- Control serverity of different message types
	-- 		-- 			enable_snippet = true,
	-- 		-- 			server_side_fuzzy_match = true,
	-- 		-- 		},
	-- 		-- 	},
	-- 		-- },
	-- 	},
	-- },

	-- Completion
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

			local function has_words_before()
				local line, col = (unpack or table.unpack)(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			local function is_visible(cmp)
				return cmp.core.view:visible() or vim.fn.pumvisible() == 1
			end

			-- -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
			-- require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				preselect = cmp.PreselectMode.None, -- cmp.PreselectMode.Item,

				confirm_opts = {
					behavior = cmp.ConfirmBehavior.Replace,
					select = false,
				},

				completion = {
					completeopt = "menuone,noinsert,noselect",
				},

				-- Read `:h ins-completion` to better understand mappings
				mapping = cmp.mapping.preset.insert({
					-- select previous/next item
					["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
					["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
					["<C-h>"] = cmp.mapping.abort(),
					["<C-l>"] = cmp.mapping.confirm(),

					-- scroll the documentation forward / backwards
					["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
					["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),

					-- Manually trigger a completion from nvim-cmp
					["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),

					-- confirm selection
					-- ["<C-CR>"] = cmp.mapping.confirm({
					-- 	behavior = cmp.ConfirmBehavior.Replace,
					-- 	select = true,
					-- }),
					["<CR>"] = cmp.mapping({
						i = function(fallback)
							if is_visible(cmp) and cmp.get_active_entry() then
								cmp.confirm()
							else
								fallback()
							end
						end,
						s = cmp.mapping.confirm(),
						-- c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
					}),
					["<TAB>"] = cmp.mapping(function(fallback)
						if is_visible(cmp) then
							cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
						elseif luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						elseif has_words_before() then
							cmp.complete()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-TAB>"] = cmp.mapping(function(fallback)
						if is_visible(cmp) then
							cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
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

				formatting = {
					-- fields = { "kind", "abbr", "menu" },
					format = lspkind.cmp_format({
						mode = "symbol",
						maxwidth = 50,
						ellipsis_char = "...",
						-- symbol_map = { Codeium = "" },
					}),
				},

				sources = cmp.config.sources({
					-- { name = "codeium", priority = 1200 },
					{ name = "nvim_lsp_signature_help" }, -- display function signatures with current parameter emphasized
					{ name = "nvim_lsp" }, -- from language server
					{ name = "nvim_lua" }, -- complete neovim's Lua runtime API such vim.lsp.*
					{ name = "luasnip" },
					{ name = "buffer" }, -- source current buffer
					{ name = "path" }, -- file paths
					-- { name = "calc" }, -- source for math calculation
				}),

				sorting = {
					priority_weight = 2,
					comparators = {
						cmp.config.compare.offset,
						cmp.config.compare.exact,
						cmp.config.compare.score,
						cmp.config.compare.kind,
						cmp.config.compare.sort_text,
						cmp.config.compare.length,
						cmp.config.compare.order,
					},
				},

				window = {
					completion = { border = "rounded", side_padding = 1, winhighlight = "CursorLine:Visual" },
					documentation = { border = "rounded" },
					-- completion = cmp.config.window.bordered(),
					-- documentation = cmp.config.window.bordered(),
				},

				experimental = {
					ghost_text = {
						hl_group = "CmpGhostText",
					},
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
				sources = cmp.config.sources({
					{ name = "path" },
					{ name = "cmdline" },
				}),
			})
		end,
	},
}
