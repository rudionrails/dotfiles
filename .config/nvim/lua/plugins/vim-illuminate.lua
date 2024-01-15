-- highlight other uses of the word under the cursor
return {
	"RRethy/vim-illuminate",
	event = "VeryLazy",
	init = function()
		local illuminate = require("illuminate")
		local function map(key, dir, buffer)
			vim.keymap.set("n", key, function()
				illuminate["goto_" .. dir .. "_reference"](false)
			end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
		end

		map("]]", "next")
		map("[[", "prev")

		-- also set it after loading ftplugins, since a lot overwrite [[ and ]]
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				local buffer = vim.api.nvim_get_current_buf()
				map("]]", "next", buffer)
				map("[[", "prev", buffer)
			end,
		})
	end,
	config = function()
		local illuminate = require("illuminate")

		illuminate.configure({
			-- providers: provider used to get references in the buffer, ordered by priority
			providers = {
				"lsp",
				"treesitter",
				"regex",
			},
			delay = 100, -- delay in ms
			-- under_cursor = true, -- illuminate under the cursor

			large_file_cutoff = 2000,
			large_file_overrides = nil,
		})
	end,
}
