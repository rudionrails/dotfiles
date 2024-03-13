-- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
-- @see https://github.com/folke/noice.nvim
--
-- Comes with:
--  * popup: powered by nui.nvim
--  * split: powered by nui.nvim
--  * notife: powered by nvim-notify
--  * virtualtext: shows the message as virtualtext (for example for search_count)
--  * mini: similar to notifier.nvim & fidget.nvim
--  * notify_send: generate a desktop notification
--
-- @see https://github.com/folke/noice.nvim?tab=readme-ov-file#-views
return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		-- "rcarriga/nvim-notify",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		local noice = require("noice")

		local nmap = function(lhs, rhs, desc)
			vim.keymap.set("n", lhs, rhs, { desc = desc })
		end

		nmap("<leader>ne", "<CMD>Noice errors<CR>", "[N]oice [E]errors")
		nmap("<leader>nl", "<CMD>Noice last<CR>", "[N]oice [L]ast")
		nmap("<leader>nh", "<CMD>Noice history<CR>", "[N]oice [H]istory")

		noice.setup({
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = true, -- add a border to hover docs and signature help
			},

			-- routes = {
			-- 	-- hide 'file written' messages
			-- 	{
			-- 		filter = {
			-- 			event = "msg_show",
			-- 			kind = "",
			-- 			find = "written",
			-- 		},
			-- 		opts = { skip = true },
			-- 	},
			-- },
		})
	end,
}
