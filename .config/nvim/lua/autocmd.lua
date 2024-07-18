local M = {}

function M.autocmd(events, opts)
	vim.api.nvim_create_autocmd(
		events,
		vim.tbl_deep_extend("force", {}, opts, {
			group = vim.api.nvim_create_augroup(opts.group, { clear = true }),
		})
	)
end

-- show/hide cursorline
M.autocmd({ "InsertLeave", "WinEnter" }, {
	group = "_show_cursorline",
	desc = "Show cursorline",
	callback = function()
		vim.wo.cursorline = true
	end,
})

-- Highlight on yank
M.autocmd("TextYankPost", {
	group = "_highlight_yank",
	desc = "Highlight text on yank",
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- go to last line when opening a buffer
M.autocmd("BufReadPost", {
	group = "_last_line",
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
M.autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	group = "_check_file_reload",
	desc = "Check if file needs to be reloaded",
	command = "checktime",
})

-- close some filetypes with <q>
M.autocmd("FileType", {
	group = "_close_with_q",
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
M.autocmd("FileType", {
	group = "_spell_checl",
	desc = "Apply spellchecking for certain files",
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
M.autocmd({ "BufWritePre" }, {
	group = "_auto_create_dir",
	desc = "Automatically create dir when saving file",
	callback = function(event)
		if event.match:match("^%w%w+://") then
			return
		end

		local file = vim.loop.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
})

-- taken from AstroNvim: trigger "User FileOpened" once when opening a file
M.autocmd({ "BufRead", "BufWinEnter", "BufNewFile" }, {
	group = "_file_opened",
	nested = true,
	callback = function(args)
		local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })

		if not (vim.fn.expand("%") == "" or buftype == "nofile") then
			vim.api.nvim_del_augroup_by_name("_file_opened")
			vim.api.nvim_exec_autocmds("User", { pattern = "FileOpened" })
		end
	end,
})

-- trigger "User DirOpened" once when opening a directory
M.autocmd({ "BufRead", "BufWinEnter", "BufNewFile" }, {
	group = "_dir_opened",
	nested = true,
	callback = function()
		local filename = vim.fn.expand("%:p")

		if vim.fn.isdirectory(filename) ~= 0 then
			vim.api.nvim_del_augroup_by_name("_dir_opened")
			vim.api.nvim_exec_autocmds("User", { pattern = "DirOpened" })
		end
	end,
})
