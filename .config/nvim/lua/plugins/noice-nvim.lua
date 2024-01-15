-- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
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
	keys = {
		{ "<leader>nl", "<CMD> Noice last <CR>", silent = true, desc = "[N]oice [L]ast" },
		{ "<leader>nh", "<CMD> Noice history <CR>", silent = true, desc = "[N]oice [H]istory" },
	},
	config = function()
		local noice = require("noice")

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
