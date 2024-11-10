local root_pattern = require("lspconfig.util").root_pattern

local filetypes = {
	"javascript",
	"javascriptreact",
	"javascript.jsx",
	"typescript",
	"typescriptreact",
	"typescript.tsx",
}

return {
	"rudionrails/quarry.nvim",
	opts = {
		servers = {
			ts_ls = {
				tools = {
					"ts_ls",
					"eslint_d",
					"prettierd",
					-- lazy = true,
				},

				config = {
					single_file_support = false,
					completions = { completeFunctionCalls = true },
					init_options = {
						preferences = {
							includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
							includeInlayParameterNameHintsWhenArgumentMatchesName = false,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = true,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayEnumMemberValueHints = true,
							importModuleSpecifierPreference = "non-relative",
						},
					},
				},
			},

			-- eslint = {
			-- 	-- config = {
			-- 	-- 	on_attach = function(client, bufnr)
			-- 	-- 		vim.api.nvim_create_autocmd("BufWritePre", {
			-- 	-- 			buffer = bufnr,
			-- 	-- 			command = "EslintFixAll",
			-- 	-- 		})
			-- 	-- 	end,
			-- 	-- },
			-- },

			-- denols = {
			-- 	config = {
			-- 		root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
			-- 	},
			-- },
		},
	},
}
