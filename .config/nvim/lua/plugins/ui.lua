local config = require("core.config")
local utils = require("core.utils")

return {
	-- fancy scrollbar
	{
		"petertriho/nvim-scrollbar",
		event = { "VeryLazy" }, -- "User FileOpened",
		opts = {},
	},

	-- fancy top buffer manager, @see https://github.com/akinsho/bufferline.nvim
	{
		"akinsho/bufferline.nvim",
		branch = "main",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		-- event = "VimEnter",
		event = "User FileOpened",
		keys = {
			{ "<left>", "<CMD> BufferLineCyclePrev <CR>", desc = "Goto left buffer", silent = true },
			{ "<right>", "<CMD> BufferLineCycleNext <CR>", desc = "Goto right buffer", silent = true },
			{ "<up>", "<CMD> BufferLineCloseOthers <CR>", desc = "Close other buffers", silent = true },
			{ "<down>", ":e#<CR>", desc = "Toggle to previous buffer", silent = true },
		},
		opts = {
			options = {
				separator_style = { "|", "|" }, -- "slant", | "slope" | "thick" | "thin" | { 'any', 'any' },
				diagnostics = "nvim_lsp",
				offsets = {
					-- { filetype = "NvimTree", text = "NvimTree", highlight = "Directory", text_align = "left" },
					{ filetype = "neo-tree", text_align = "left" },
				},
			},
		},
	},

	-- A IDE-style winbar for Neovim
	{
		"utilyre/barbecue.nvim",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		event = { "VeryLazy" }, -- "User FileOpened",
		opts = {},
	},

	-- Fancier statusline, see `:help lualine.txt`
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		event = { "VeryLazy" }, -- "User FileOpened",
		opts = {
			options = {
				theme = "auto",
				component_separators = config.icons.ui.Line,
				section_separators = config.icons.ui.LineDouble,
				globalstatus = false,
				disabled_filetypes = {
					statusline = { "alpha" },
				},
			},
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function(str)
							-- return "󰀘 " .. str:sub(1, 1)
							return str:sub(1, 1)
						end,
					},
				},
				lualine_b = {},
				lualine_c = {
					-- -- { "filetype", separator = "", padding = { left = 1, right = 0 } },
					-- { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
					-- { "filename", path = 1 },
					-- {
					-- 	function()
					-- 		return vim.fn.expand("%:p:~:.:h")
					-- 	end,
					-- 	icon = config.icons.ui.Folder,
					-- 	color = utils.fg("Comment"),
					-- 	separator = "",
					-- },
					{ "filetype", icon_only = true, separator = "" },
					{ "filename", path = 1, padding = { left = 0, right = 1 } },
					{ "diff", icon = config.icons.ui.Diff },
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = {
							error = config.icons.diagnostics.Error .. " ",
							warn = config.icons.diagnostics.Warn .. " ",
							info = config.icons.diagnostics.Info .. " ",
							hint = config.icons.diagnostics.Hint .. " ",
							other = config.icons.diagnostics.Other .. " ",
						},
					},
				},
				lualine_x = {
					-- {
					-- 	function()
					-- 		return config.icons.ui.Tree
					-- 	end,
					-- 	-- color = function()
					-- 	--   local buf = vim.api.nvim_get_current_buf()
					-- 	--   local ts = vim.treesitter.highlighter.active[buf]
					-- 	--   return { fg = ts and not vim.tbl_isempty(ts) and green or colors.red }
					-- 	-- end,
					-- },

					-- display attached lsp clients, formatters and linters
					{
						function()
							local buf_clients = vim.lsp.buf_get_clients()
							if not buf_clients or #buf_clients == 0 then
								-- return "" -- config.icons.ui.Code -- no LSP attached
								return config.icons.ui.Code .. " " .. "N/A" -- no LSP attached
							end

							local buf_filetype = vim.bo.filetype
							local buf_client_names = {}

							for _, client in pairs(buf_clients) do
								local client_name = client.name
								if client_name ~= "null-ls" and client_name ~= "copilot" then
									table.insert(buf_client_names, client_name)
								end
							end

							if package.loaded["null-ls"] then
								local has_null_ls, null_ls = pcall(require, "null-ls")
								if has_null_ls then
									local sources = null_ls.get_sources()
									for _, source in ipairs(sources) do
										if source._validated then
											for ft_name, ft_active in pairs(source.filetypes) do
												if ft_name == buf_filetype and ft_active then
													table.insert(buf_client_names, source.name)
												end
											end
										end
									end
								end
							end

							if package.loaded["conform"] then -- conform package (for formatting)
								local has_conform, conform = pcall(require, "conform")
								if has_conform then
									local formatter_names = vim.tbl_map(function(formatter)
										return formatter.name
									end, conform.list_formatters(0))

									vim.list_extend(buf_client_names, formatter_names)
								end
							end

							if package.loaded["lint"] then -- nvim-lint package
								local has_lint, lint = pcall(require, "lint")
								if has_lint then
									local linter_names = lint._resolve_linter_by_ft(buf_filetype)
									vim.list_extend(buf_client_names, linter_names)
								end
							end

							-- print("LSP Clients: " .. vim.inspect(buf_client_names))
							buf_client_names = vim.fn.uniq(utils.flatten(buf_client_names))
							return config.icons.ui.Code .. " " .. table.concat(buf_client_names, ", ")
						end,
						color = utils.fg("Comment"),
					},
				},
				lualine_y = {
					{ require("lazy.status").updates, cond = require("lazy.status").has_updates },
				},
				lualine_z = {
					{ "location" },
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {
					{ "filetype", icon_only = true, separator = "" },
					{ "filename", path = 1, padding = { left = 0, right = 1 } },
				},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},

			extensions = {
				"lazy",
				"mason",
				"trouble",
				"quickfix",
				"neo-tree",
			},
		},
		init = function()
			vim.g.lualine_laststatus = vim.o.laststatus

			if vim.fn.argc(-1) > 0 then
				-- set an empty statusline till lualine loads
				vim.o.statusline = " "
			else
				-- hide the statusline on the starter page
				vim.o.laststatus = 0
			end
		end,
		config = function(_, opts)
			vim.o.laststatus = vim.g.lualine_laststatus

			require("lualine").setup(opts)
		end,
	},

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
	{
		"folke/noice.nvim",
		event = { "VeryLazy" }, -- User FileOpened"},
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
			{ "<leader>ne", "<CMD>Noice errors<CR>", desc = "[N]oice [E]errors" },
			{ "<leader>nl", "<CMD>Noice last<CR>", desc = "[N]oice [L]ast" },
			{ "<leader>nh", "<CMD>Noice history<CR>", desc = "[N]oice [H]istory" },
		},
		opts = {
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.utils.convert_input_to_markdown_lines"] = true,
					["vim.lsp.utils.stylize_markdown"] = true,
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

			routes = {
				-- hide 'file written' messages
				{
					filter = {
						event = "msg_show",
						kind = "",
						find = "written",
					},
					opts = { skip = true },
				},
			},
		},
	},

	-- fancy resize buffers (with animations)
	{
		"anuvyklack/windows.nvim",
		event = "User FileOpened",
		dependencies = {
			"anuvyklack/middleclass",
			"anuvyklack/animation.nvim",
		},
		keys = {
			{ "<C-m>", ":WindowsMaximize<CR>", desc = "[M]aximize current buffer" },
		},
		config = function()
			vim.opt.winwidth = 5
			vim.opt.winminwidth = 5
			vim.opt.equalalways = false

			require("windows").setup({
				animation = {
					duration = 150,
				},
			})
		end,
	},

	-- Add indentation guides even on blank lines, see `:help indent_blankline.txt`
	{
		"lukas-reineke/indent-blankline.nvim",
		dependencies = {
			{ "echasnovski/mini.indentscope", version = false },
		},
		event = { "User FileOpened" },
		config = function()
			local ibl = require("ibl")
			local indentscope = require("mini.indentscope")

			local exclude_filetypes = {
				"help",
				"alpha",
				"neo-tree",
				"Trouble",
				"trouble",
				"lazy",
				"mason",
				"notify",
			}

			vim.api.nvim_create_autocmd("FileType", {
				pattern = exclude_filetypes,
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})

			ibl.setup({
				indent = {
					char = config.icons.ui.Line,
					tab_char = config.icons.ui.Line,
				},
				scope = {
					enabled = false, -- because we use mini.indentline for this (behaviour is a bit different)
				},
				exclude = {
					filetypes = exclude_filetypes,
				},
			})

			indentscope.setup({
				symbol = config.icons.ui.Line,
				draw = {
					animation = indentscope.gen_animation.none(),
				},
				options = {
					indent_at_cursor = false,
					try_as_border = true,
				},
			})
		end,
	},

	-- NeoVim greeter, just open nvim (without file)
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		init = function()
			vim.api.nvim_create_autocmd("User", {
				group = vim.api.nvim_create_augroup("_alpha_start", { clear = true }),
				pattern = "VeryLazy",
				nested = true,
				callback = function()
					require("alpha").start(true)
				end,
			})
		end,
		config = function()
			local alpha = require("alpha")
			local startify = require("alpha.themes.startify")

			startify.section.header.opts.hl = "AlphaHeader"
			startify.section.top_buttons.val = {
				startify.button("e", config.icons.ui.NewFile .. " " .. " New file", "<cmd> ene <BAR> startinsert <cr>"),
				startify.button("f", config.icons.ui.Search .. " " .. " Find file", "<cmd> Telescope find_files <cr>"),
				-- startify.button("r", " " .. " Recent files", "<cmd> Telescope oldfiles <cr>"),
				-- startify.button("g", " " .. " Find text", "<cmd> Telescope live_grep <cr>"),
				-- startify.button("s", " " .. " Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
			}
			startify.section.bottom_buttons.val = {
				startify.button("m", config.icons.ui.Package .. " " .. " Mason", "<CMD> Mason <CR>"),
				startify.button("l", config.icons.ui.Package .. " " .. " Lazy", "<CMD> Lazy <CR>"),
				startify.button("q", config.icons.ui.Quit .. " " .. " Quit", "<CMD> q <CR>"),
			}

			startify.config.opts.autostart = false

			alpha.setup(startify.config)

			-- display startup time when available
			vim.api.nvim_create_autocmd("User", {
				once = true,
				pattern = "LazyVimStarted",
				callback = function()
					local stats = require("lazy").stats()
					local val = "⚡ Neovim loaded "
						.. stats.loaded
						.. "/"
						.. stats.count
						.. " plugins in "
						.. stats.startuptime
						.. "ms"

					startify.section.footer.val = {
						{ type = "padding", val = 1 },
						{ type = "text", opts = { hl = "Comment" }, val = val },
					}

					pcall(vim.cmd.AlphaRedraw)
				end,
			})
		end,
	},
}
