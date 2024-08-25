local utils = require("core.utils")

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
			vim.notify("Linter not found: " .. name, vim.log.levels.WARN, { title = "lint" })
		end

		return linter and not (type(linter) == "table" and linter.cond and not linter.cond(ctx))
	end, names)

	-- Run linters
	if #names == 0 then
		vim.notify("No linters defined", vim.log.levels.WARN, { title = "lint" })
	else
		-- vim.notify("Linting with " .. table.concat(names, ", "), vim.log.levels.INFO, { title = "lint" })
		lint.try_lint(names)
	end
end

return {
	-- Linting
	-- below is taken from https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/linting.lua
	{
		"mfussenegger/nvim-lint",
		-- event = { "VeryLazy" },
		event = { "BufReadPre", "BufNewFile" },
		keys = {
			{ "<leader>l", "<CMD>Lint<CR>", desc = "[L]int code" },
		},
		opts = {
			linters_by_ft = {
				lua = { "luacheck" },
				javascript = { "eslint_d", "eslint" },
				typescript = { "eslint_d", "eslint" },
				javascriptreact = { "eslint_d", "eslint" },
				typescriptreact = { "eslint_d", "eslint" },
				ruby = { "rubocop" },
				python = { "pylint" },
				sql = { "sqlfluff" },
				svelte = { "eslint_d", "eslint" },
			},

			linters = {
				-- -- example of using eslint only when a .eslintrx.json file is present
				-- eslint_d = {
				--   -- dynamically enable/disable linters based on the context.
				--   --
				--   -- ctx gets `filename` and `dirname`
				--   cond = function(ctx)
				--     return vim.fs.find({ ".eslintrc.json" }, { path = ctx.filename, upward = true })[1]
				--   end,
				-- },
				sqlfluff = {
					-- dynamically enable/disable linters based on the context.
					cond = function(ctx)
						return vim.fs.find({ ".sqlfluff" }, { path = ctx.filename, upward = true })[1]
					end,
				},
			},
		},
		config = function(_, opts)
			local lint = require("lint")

			-- The below enables a set of default linters. They will cause errors if not rpesent, though.
			lint.linters_by_ft = vim.tbl_deep_extend("force", lint.linters_by_ft, opts.linters_by_ft)

			for name, linter in pairs(opts.linters) do
				if type(linter) == "table" and type(lint.linters[name]) == "table" then
					lint.linters[name] = vim.tbl_deep_extend("force", {}, lint.linters[name], linter)
				else
					lint.linters[name] = linter
				end
			end

			vim.api.nvim_create_user_command("Lint", utils.debounce(150, M.lint), {})
			vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
				group = vim.api.nvim_create_augroup("_lint", { clear = true }),
				command = "Lint",
			})
		end,
	},
}
