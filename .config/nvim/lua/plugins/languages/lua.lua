return {
	"rudionrails/quarry.nvim",
	opts = {
		servers = {
			lua_ls = {
				tools = {
					"lua_ls",
					"stylua",
					"luacheck",
					-- lazy = true,
				},

				config = {
					settings = {
						Lua = {
							completion = { callSnippet = "Replace" },
							doc = { privateName = { "^_" } },
							codeLens = { enable = true },
							hint = {
								enable = true,
								setType = false,
								paramType = true,
								paramName = "Disable",
								semicolon = "Disable",
								arrayIndex = "Disable",
							},
							-- Get the language server to recognize the `vim` global
							diagnostics = { globals = { "vim" } },
							-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
							runtime = { version = "LuaJIT" },
							workspace = {
								-- Make the server aware of Neovim runtime files
								library = vim.api.nvim_get_runtime_file("", true),
								-- library = { vim.env.VIMRUNTIME, vim.env.VIMRUNTIME .. "/lua" },
								checkThirdParty = false,
								-- maxPreload = 100000,
								-- preloadFileSize = 10000,
							},
						},

						-- Do not send telemetry data containing a randomized but unique identifier
						telemetry = { enable = false },
					},
				},
			},
		},
	},
}
