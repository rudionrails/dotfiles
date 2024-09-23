return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio", -- TODO: really needed?
		},
		keys = {
			{
				"<leader>dt",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "[D]ebug [T]oggle breakpoint",
			},
			{

				"<leader>dc",
				function()
					require("dap").continue()
				end,
				desc = "[D]ebug [C]oggle",
			},
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},
}
