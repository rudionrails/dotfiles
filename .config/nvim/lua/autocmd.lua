local augroup = require("core.utils").augroup

-- show/hide cursorline
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
	group = augroup("show_cursorline"),
	desc = "Show cursorline",
	callback = function()
		vim.wo.cursorline = true
	end,
})

vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
	group = augroup("hide_cursorline"),
	desc = "Hide cursorline",
	callback = function()
		vim.wo.cursorline = false
	end,
})

-- highlight word at current cursor
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
	group = augroup("show_highlight_word"),
	desc = "Highlight on current word",
	callback = function()
		vim.lsp.buf.document_highlight()
	end,
})

vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
	group = augroup("hide_highlight_word"),
	desc = "Remove highlight on current word",
	callback = function()
		vim.lsp.buf.clear_references()
	end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	desc = "Highlight text on yank",
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- go to last line when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup("last_loc"),
	desc = "Jump to last line when opening file",
	callback = function()
		local exclude = { "gitcommit" }
		local buf = vim.api.nvim_get_current_buf()

		if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
			return
		end

		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local lcount = vim.api.nvim_buf_line_count(buf)

		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	group = augroup("check_file_reload"),
	desc = "Check if file needs to be reloaded",
	command = "checktime",
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("close_with_q"),
	desc = "Close certain filetypes with <q>",
	pattern = {
		"PlenaryTestPopup",
		"help",
		"lspinfo",
		"man",
		"notify",
		"qf",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"neotest-output",
		"checkhealth",
		"neotest-summary",
		"neotest-output-panel",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("wrap_spell"),
	desc = "Apply spellchecking for certain files",
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	group = augroup("auto_create_dir"),
	desc = "Automatically create dir when saving file",
	callback = function(event)
		if event.match:match("^%w%w+://") then
			return
		end
		local file = vim.loop.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
})
