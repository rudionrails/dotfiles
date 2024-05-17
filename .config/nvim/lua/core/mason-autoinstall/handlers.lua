local typescript = { "tsserver", "prettierd", "eslint_d" }

local handlers = {
	["typescript"] = typescript,
	["typescriptreact"] = typescript,
	["javascript"] = typescript,
	["javascriptreact"] = typescript,
	["lua"] = { "lua_ls", "stylua" },
	["ruby"] = { "ruby_lsp", "rubocop" },
	["rust"] = { "rust_analyzer" },
}

return handlers
