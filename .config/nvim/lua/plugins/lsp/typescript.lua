return {
	"rudionrails/quarry.nvim",
	opts = {
		servers = {
			tsserver = {
				filetypes = {
					"javascript",
					"javascriptreact",
					"javascript.jsx",
					"typescript",
					"typescriptreact",
					"typescript.tsx",
				},

				ensure_installed = {
					-- "tsserver",
					"prettier",
					"eslint",
				},

				opts = {
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
		},
	},
}
