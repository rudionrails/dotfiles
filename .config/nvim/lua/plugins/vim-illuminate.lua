-- highlight other uses of the word under the cursor
return {
	"RRethy/vim-illuminate",
	event = "VeryLazy",
	config = function()
		local illuminate = require("illuminate")
		local function nmap(key, dir, buffer)
			vim.keymap.set("n", key, function()
				illuminate["goto_" .. dir .. "_reference"](false)
			end, { desc = "Illuminate " .. dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
		end

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

		nmap("]]", "next")
		nmap("[[", "prev")

		-- also set it after loading ftplugins, since a lot overwrite [[ and ]]
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				local buffer = vim.api.nvim_get_current_buf()
				nmap("]]", "next", buffer)
				nmap("[[", "prev", buffer)
			end,
		})
	end,
}
