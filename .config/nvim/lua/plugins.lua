return {
  -- colorschemes
  {
    'folke/tokyonight.nvim',
    dependencies = {
      { 'Everblush/nvim',   name = 'everblush' },
      { 'rose-pine/neovim', name = 'rose-pine' },
      'navarasu/onedark.nvim',
    },
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('tokyonight').setup({
        on_highlights = function(hi, c)
          -- hi.IndentBlanklineContextStart = { fg = c.bg, bg = c.purple }
          hi.CmpDocumentationBorder = { fg = c.purple }
        end,
      })
      -- vim.cmd [[ colorscheme tokyonight-night ]]

      -- require('rose-pine').setup({
      --   --- @usage 'main' | 'moon'
      --   dark_variant = 'moon',
      --   highlight_groups = {
      --     IlluminatedWordRead = { bg = "highlight_med" },
      --     IlluminatedWordWrite = { bg = "highlight_med" },
      --
      --     IndentBlanklineContextStart = { bg = "foam", blend = 20 },
      --   },
      -- })
      -- vim.cmd [[ colorscheme rose-pine ]]

      -- local p = require('everblush.palette')
      -- require('everblush').setup({
      --   override = {
      --     FloatBorder = { fg = p.color15 },
      --
      --     -- nvim-treesitter/nvim-treesitter-context
      --     TreesitterContext = { bg = p.color8 },
      --
      --     IlluminatedWordRead = { underline = true },
      --     IlluminatedWordWrite = { underline = true },
      --
      --     -- IndentBlanklineContextStart = { fg = p.contrast, bg = p.color4 },
      --
      --     -- TelescopeNormal = { fg = p.foreground, bg = p.background },
      --     TelescopeBorder = { link = "FloatBorder" },
      --   },
      -- })
      -- vim.cmd [[ colorscheme everblush ]]

      require('onedark').setup({
        style = 'deep',
      })
      vim.cmd.colorscheme "onedark"
    end,
  },


  { 'tpope/vim-sleuth' },   -- Detect tabstop and shiftwidth automatically
  { 'tpope/vim-fugitive' }, -- git support

  {
    -- color highlighter
    'NvChad/nvim-colorizer.lua',
    event = "VeryLazy",
    config = function()
      require('colorizer').setup()
    end
  },

  {
    -- git in signcolumn, see `:help gitsigns.txt`
    'lewis6991/gitsigns.nvim',
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require('gitsigns').setup()
    end,
  },

  {
    -- Better `vim.notify()`
    "rcarriga/nvim-notify",
    config = function()
      local notify = require("notify")

      notify.setup({
        timeout = 3000,
        max_height = function()
          return math.floor(vim.o.lines * 0.75)
        end,
        max_width = function()
          return math.floor(vim.o.columns * 0.75)
        end,
      })

      vim.keymap.set('n', '<leader>un', function() notify.dismiss({ silent = true, pending = true }) end,
        { silent = true, desc = "Dismiss all Notifications" })

      vim.notify = notify;
    end,
  },

  -- file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    keys = {
      { "<leader>e", ":Neotree position=float<CR>", desc = "Explorer NeoTree (root dir)" },
    },
    -- deactivate = function()
    --   vim.cmd([[Neotree close]])
    -- end,
    config = function()
      require("neo-tree").setup({
        window = {
          mappings = {
            ["<space>"] = "none",
            ["l"] = "open",
            ["h"] = "close_node",
          },
        },
      })
    end,
  },

  -- highlight cursor
  {
    'edluffy/specs.nvim',
    event = 'VeryLazy',
    config = function()
      require('specs').setup({
        show_jumps = true,
        min_jump   = 30,
        popup      = {
          delay_ms = 0,     -- delay before popup displays
          inc_ms = 5,       -- time increments used for fade/resize effects
          blend = 0,        -- starting blend, between 0-100 (fully transparent), see :h winblend
          width = 250,
          winhl = 'Search', -- 'PMenu', 'Search'
          fader = require('specs').linear_fader,
          resizer = require('specs').empty_resizer,
        },
      })

      vim.api.nvim_create_user_command('Specs', function()
        require('specs').show_specs()
      end, {})

      -- Press <C-b> to call specs!
      -- vim.keymap.set('n', '<C-l>', ':Specs<CR>', { noremap = true, silent = true, desc = "Highlight current [L]ine" })

      -- You can even bind it to search jumping and more, example:
      vim.keymap.set('n', 'n', 'n:Specs<CR>', { silent = true })
      vim.keymap.set('n', 'N', 'N:Specs<CR>', { silent = true })
    end,
  },

  {
    -- fancy resize buffers (with animations)
    'anuvyklack/windows.nvim',
    event = 'VeryLazy',
    dependencies = {
      { 'anuvyklack/middleclass' },
      { 'anuvyklack/animation.nvim' },
    },
    keys = {
      { '<C-m>', ':WindowsMaximize<CR>', silent = true, desc = "[M]aximize current buffer" }
    },
    config = function()
      vim.opt.winwidth = 5
      vim.opt.winminwidth = 5
      vim.opt.equalalways = false

      require('windows').setup({
        animation = {
          duration = 150,
        },
      })
    end,
  },

  {
    -- fancy scrollbar
    'petertriho/nvim-scrollbar',
    event = 'BufReadPost',
    config = function()
      require('scrollbar').setup()
    end,
  },

  {
    -- Fancier statusline, see `:help lualine.txt`
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    config = function()
      require('lualine').setup({
        options = {
          globalstatus = false,
          section_separators = '║',
          component_separators = '│',
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = {
            {
              'diagnostics',
              sources = { 'nvim_diagnostic' },
              symbols = { error = '✘ ', warn = '▲ ', hint = '⚑ ', info = ' ' }
            },
          },
          lualine_c = {
            -- { 'filetype', icon_only = true, separator = '', padding = { left = 1, right = 0 } },
            { 'filetype', separator = '', padding = { left = 1, right = 0 } },
            { 'filename', path = 1 },
          },
          -- lualine_x = { 'branch' },
          lualine_x = { 'branch' },
          lualine_y = { 'diff' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            { 'filetype', icon_only = true, separator = '', padding = { left = 1, right = 0 } },
            { 'filename', path = 1 },
          },
          lualine_x = {},
          lualine_y = {},
          lualine_z = { 'location' }
        },
        extensions = { 'nvim-tree' },
      })
    end,
  },

  {
    -- fancy top buffer manager
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('bufferline').setup({
        options = {
          -- separator_style = 'thick',
          diagnostics = 'nvim_lsp',
          offsets = {
            { filetype = 'NvimTree', text = 'NvimTree',  highlight = 'Directory', text_align = 'left' },
            { filetype = 'neo-tree', text_align = 'left' },
          },
        },
      })
    end,
    init = function()
      vim.keymap.set('n', '<Left>', ':BufferLineCyclePrev<CR>', { silent = true, desc = 'Goto left buffer' })
      vim.keymap.set('n', '<Right>', ':BufferLineCycleNext<CR>', { silent = true, desc = 'Goto right buffer' })
      vim.keymap.set('n', '<Up>', ':BufferLineCloseLeft<CR> :BufferLineCloseRight<CR>',
        { silent = true, desc = 'Close all buffers but this one' })
      vim.keymap.set('n', '<Down>', ':e#<CR>', { silent = true, desc = 'Toggle to previous buffer' })
    end,
  },

  -- Add indentation guides even on blank lines, see `:help indent_blankline.txt`
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'VeryLazy',
    config = function()
      require('indent_blankline').setup({
        -- char = '┊',
        -- indentLine_enabled = 1,
        filetype_exclude = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
        buftype_exclude = { "terminal" },
        show_trailing_blankline_indent = false,
        -- show_first_indent_level = false,
        show_current_context_start = true,
        show_current_context = true,
      })
    end,
  },

  -- 'gc' to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    config = function()
      require('Comment').setup({
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      })

      -- -- toggle comment in both modes
      -- vim.keymap.set('n', '<leader>/', function()
      --   require("Comment.api").toggle.linewise.current()
      -- end, { desc = 'Toggle comment' })
      --
      -- vim.keymap.set('v', '<leader>/', "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      --   { desc = 'Toggle comment' })
    end,
  },

  -- highlight other uses of the word under the cursor
  {
    'RRethy/vim-illuminate',
    event = 'VeryLazy',
    config = function()
      local illuminate = require('illuminate')

      illuminate.configure({
        delay = 200,
        large_file_cutoff = 2000,
        large_file_overrides = {
          providers = { "lsp" },
        },
      })

      local function map(key, dir, buffer)
        vim.keymap.set("n", key, function()
          require("illuminate")["goto_" .. dir .. "_reference"](false)
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
  },

  -- fast navigation
  {
    'phaazon/hop.nvim',
    cmd = 'HopWord',
    keys = {
      { '<space>', ':HopWord<CR>', desc = 'Hop Word' },
    },
    config = function()
      require('hop').setup()
    end,
  },

  { 'mg979/vim-visual-multi' },
  { 'bogado/file-line' }, -- open file given a line, e.g. vim index.html:20

  -- tmux setup
  {
    'christoomey/vim-tmux-navigator',
    dependencies = {
      'jby/tmux.vim',
    },
    init = function()
      -- ' Don't allow any default key-mappings.
      vim.cmd('let g:tmux_navigator_no_mappings = 1')

      vim.keymap.set('n', '<C-h>', ':TmuxNavigateLeft<CR>', { silent = true })
      vim.keymap.set('n', '<C-j>', ':TmuxNavigateDown<CR>', { silent = true })
      vim.keymap.set('n', '<C-k>', ':TmuxNavigateUp<CR>', { silent = true })
      vim.keymap.set('n', '<C-l>', ':TmuxNavigateRight<CR>', { silent = true })
    end,
  },

  -- displays a popup with possible key bindings of the command
  {
    'folke/which-key.nvim',
    event = "VeryLazy",
    config = function()
      require('which-key').setup({
        window = {
          border = "shadow", -- none, single, double, shadow
          -- position = "bottom", -- bottom, top
          -- margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
          -- padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
          -- winblend = 0
        },
      })
    end,
  },

  -- Snippets
  {
    "L3MON4D3/LuaSnip",
    build = (not jit.os:find("Windows"))
        and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
        or nil,
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    keys = {
      {
        "<tab>",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
        end,
        expr = true,
        silent = true,
        mode = "i",
      },
      { "<tab>",   function() require("luasnip").jump(1) end,  mode = "s" },
      { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    },
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    version = false, -- take from git main, ecause last release is too long ago
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")

      local icons = {
        Array = " ",
        Boolean = " ",
        Class = " ",
        Color = " ",
        Constant = " ",
        Constructor = " ",
        Copilot = " ",
        Enum = " ",
        EnumMember = " ",
        Event = " ",
        Field = " ",
        File = " ",
        Folder = " ",
        Function = " ",
        Interface = " ",
        Key = " ",
        Keyword = " ",
        Method = " ",
        Module = " ",
        Namespace = " ",
        Null = " ",
        Number = " ",
        Object = " ",
        Operator = " ",
        Package = " ",
        Property = " ",
        Reference = " ",
        Snippet = " ",
        String = " ",
        Struct = " ",
        Text = " ",
        TypeParameter = " ",
        Unit = " ",
        Value = " ",
        Variable = " ",
      }

      local config = vim.tbl_deep_extend(
        "force",
        cmp.get_config(),
        {
          completion = {
            completeopt = "menu,menuone,noinsert",
          },

          snippet = {
            expand = function(args)
              require("luasnip").lsp_expand(args.body)
            end,
          },

          mapping = {
            ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
            ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<CR>"] = cmp.mapping.confirm {
              behavior = cmp.ConfirmBehavior.Replace,
              select = false,
            },
          },

          window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
          },

          formatting = {
            format = function(_, item)
              if icons[item.kind] then
                item.kind = icons[item.kind] .. item.kind
              end

              return item
            end,
          },

          sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "buffer" },
            { name = "path" },
          }),
        }
      )

      cmp.setup(config)
    end,

    -- -- autopairing of (){}[] etc
    -- {
    --   "windwp/nvim-autopairs",
    --   config = function()
    --     require("nvim-autopairs").setup({
    --       fast_wrap = {},
    --       disable_filetype = { "TelescopePrompt", "vim" },
    --     })
    --
    --     -- setup cmp for autopairs
    --     local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    --     require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
    --   end,
    -- },

  },

  -- LSP Configuration & Plugins
  {
    'VonHeikemen/lsp-zero.nvim',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      -- LSP Support
      {
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
      },

    },
    config = function()
      local lsp = require('lsp-zero').preset('recommended')
      lsp.ensure_installed({ "lua_ls", "yamlls" })

      lsp.on_attach(function(_, bufnr)
        lsp.default_keymaps({ buffer = bufnr })
      end)

      -- Configure language servers
      lsp.configure('lua_ls', {})
      lsp.configure('yamlls', {
        settings = {
          yaml = {
            format = {
              enable = true,
            },
          },
        },
      })

      -- if lspconfig['lua_ls'] ~= nil then
      --   lspconfig['lua_ls'].setup(lsp.nvim_lua_ls())
      -- end

      lsp.setup()
    end,
    init = function()
      -- code formatting on <leader>p and on file-save
      vim.keymap.set('n', '<leader>p', ':LspZeroFormat<CR>',
        { silent = true, desc = 'Format Document and make it [P]retty' })
      vim.api.nvim_create_autocmd('BufWritePre', {
        callback = function()
          vim.lsp.buf.format()
        end,
      })

      -- code action on diagnostics
      vim.keymap.set('n', '<leader>a', function()
        vim.lsp.buf.code_action()
      end, { silent = true, desc = 'Code [A]ction' })
    end,
  },

  {
    -- Highlight, edit, and navigate code, see `:help nvim-treesitter`
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-context', -- shows context of currently visible buffer contents
      -- 'nvim-treesitter/nvim-treesitter-textobjects', -- Additional text objects via treesitter
      -- 'nvim-treesitter/playground',                  -- show treesitter info in vim
    },
    -- cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ':TSUpdate',
    config = function()
      vim.treesitter.language.register("tsx", "javascript") -- the javascript filetype will use the tsx parser

      require('nvim-treesitter.configs').setup({
        auto_install = true,

        ensure_installed = { "lua" },
        ignore_install = { "javascript" },

        indent = { enable = true },
        highlight = {
          enable = true,
          use_languagetree = true,

          -- disable treesitter highlight for large files
          disable = function(_, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
        },
        -- incremental_selection = {
        --   enable = true,
        --   keymaps = {
        --     init_selection = "<C-space>",
        --     node_incremental = "<C-space>",
        --     scope_incremental = false,
        --     node_decremental = "<bs>",
        --   },
        -- },
      })

      require('treesitter-context').setup()

      -- -- Show treesitter capture group for textobject under cursor (nvim-treesitter/playground)
      -- vim.keymap.set('n', '<C-e>', ':TSHighlightCapturesUnderCursor<CR>', { noremap = true, silent = true })
    end,
  },

  {
    -- Fuzzy Finder (files, lsp, etc), see `:help telescope` and `:help telescope.setup()`
    'nvim-telescope/telescope.nvim',
    dependencies = {
      -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-telescope/telescope-file-browser.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      'nvim-treesitter/nvim-treesitter', -- finder / preview
      'nvim-tree/nvim-web-devicons',     -- icons
      'sharkdp/fd',                      -- finder
      'nvim-lua/plenary.nvim',           -- lua helper functions
      'BurntSushi/ripgrep',
    },
    -- cmd = 'Telescope',
    config = function()
      local telescope = require('telescope')

      telescope.setup({
        defaults = {
          layout_config = {
            horizontal = {
              preview_width = 0.55,
              -- results_width = 0.8,
            },
            width = 0.8,
            height = 0.8,
          },
          -- path_display = { shorten = { len = 3, exclude = { 1, -1 } } },
          path_display = { "truncate" },
          dynamic_preview_title = true,
          mappings = {
            n = {
              ["q"] = "close",
            },
            i = {
              -- map actions.which_key to <C-h> (default: <C-/>)
              -- actions.which_key shows the mappings for your picker,
              -- e.g. git_{create, delete, ...}_branch for the git_branches picker
              ["<C-h>"] = "which_key",
              ['<C-u>'] = false,
              ['<C-d>'] = false,
            },
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
              -- even more opts
            }
          }
        }
      })

      telescope.load_extension('fzf')
      telescope.load_extension('file_browser')
      telescope.load_extension('ui-select')

      -- -- provided by Yanky
      -- telescope.load_extension('yank_history')
    end,
    init = function()
      vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', { silent = true, desc = '[F]ind [F]iles' })
      vim.keymap.set('n', '<leader>fp', ':Telescope oldfiles<CR>',
        { silent = true, desc = '[F]ind [P]reviously opened files' })
      vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', { silent = true, desc = '[F]find by [G]rep' })
      vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>', { silent = true, desc = '[F]ind [H]elp' })
      vim.keymap.set('n', '<leader>fw', ':Telescope grep_string<CR>', { silent = true, desc = '[F]ind [W]ord' })
      vim.keymap.set('n', '<leader>fd', ':Telescope diagnostics<CR>', { silent = true, desc = '[F]ind [D]iagnostics' })
      vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>', { silent = true, desc = '[F]ind [B]uffers' })
      vim.keymap.set('n', '<leader>fc', ':Telescope commands<CR>', { silent = true, desc = '[F]ind [C]ommands' })
      vim.keymap.set('n', '<leader>fe', ':Telescope file_browser<CR>', { silent = true, desc = '[F]ile [E]xplorer' })
      -- vim.keymap.set('n', '<C-p>', ':Telescope yank_history<CR>', { silent = true, desc = '[F]ind [B]uffers' })
    end,
  },
}
