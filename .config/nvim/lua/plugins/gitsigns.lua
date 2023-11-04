-- git in signcolumn, see `:help gitsigns.txt`
return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local gitsigns = require("gitsigns")
		local Utils = require("core.utils")

		gitsigns.setup({
			yadm = {
				enable = true,
			},

			on_attach = function(buffer)
				local map = function(mode, mapping, fn, opts)
					vim.keymap.set(mode, mapping, fn, Utils.merge({ buffer = buffer }, opts))
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						return "]c"
					end

					vim.schedule(function()
						gitsigns.next_hunk()
					end)

					return "<Ignore>"
				end, { expr = true })

				map("n", "[c", function()
					if vim.wo.diff then
						return "[c"
					end

					vim.schedule(function()
						gitsigns.prev_hunk()
					end)

					return "<Ignore>"
				end, { expr = true })

				-- Actions
				-- map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "[G]it [S]tage hunk" })
				-- map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "[G]it [R]eset hunk" })
				-- map("v", "<leader>gs", function()
				-- 	gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				-- end, { desc = "[G]it [S]tage [h]unk" })
				-- map("v", "<leader>hr", function()
				-- 	gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				-- end, { desc = "[G]it [R]eset hunk " })
				map("n", "<leader>gs", gitsigns.stage_buffer, { desc = "[G]it [S]tage buffer" })
				-- map("n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = "Git undo stage hunk" })
				map("n", "<leader>gr", gitsigns.reset_buffer, { desc = "[G]it [R]eset buffer" })
				-- map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Git preview hunk" })
				-- map("n", "<leader>hb", function()
				-- 	gitsigns.blame_line({ full = true })
				-- end, { desc = "Git blame line" })
				-- map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Git toggle blame" })
				-- map("n", "<leader>hd", gitsigns.diffthis, { desc = "Git diff" })
				-- map("n", "<leader>hD", function()
				-- 	gitsigns.diffthis("~")
				-- end, { desc = "Git diff changed" })
				map("n", "<leader>gd", gitsigns.toggle_deleted, { desc = "[G]it toggle [D]eleted" })

				-- -- Text object
				-- map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
			end,
		})
	end,
}
