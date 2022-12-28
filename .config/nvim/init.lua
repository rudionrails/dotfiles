vim.g.mapleader = ',' -- remap leader key

require('remap')
require('opt')

-- install package manager
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--single-branch', 'https://github.com/folke/lazy.nvim.git',
    lazypath, })
end
vim.opt.runtimepath:prepend(lazypath)

require('lazy').setup({
  -- colorschemes
  --
  -- slightly misusing the plugin manager here to keep all colorschemes in one place
  -- first is the main, others are for switching (but the main does not actually depend on the others)
  {
    'folke/tokyonight.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins

    dependencies = {
      { 'rose-pine/neovim', name = 'rose-pine' },
      'bluz71/vim-nightfly-colors',
      'EdenEast/nightfox.nvim',
      'haishanh/night-owl.vim',
      'NLKNguyen/papercolor-theme',
      'joshdick/onedark.vim',
      'ayu-theme/ayu-vim',
    },

    config = function()
      -- local merge = function(a, b)
      --   local c = {}
      --   for k, v in pairs(a) do c[k] = v end
      --   for k, v in pairs(b) do c[k] = v end
      --   return c
      -- end
      --
      -- require('tokyonight').setup({
      --   on_highlights = function(hi, colors)
      --     hi.Function = merge(hi.Function, { italic = true })
      --     hi["@property"] = merge(hi["@property"], { italic = true })
      --   end,
      -- })
      --
      -- vim.cmd [[ colorscheme tokyonight-night ]]

      require('rose-pine').setup({
        --- @usage 'main' | 'moon'
        dark_variant = 'main',
        highlight_groups = {
          -- IlluminatedWord = { bg = 'highlight_med' },
          -- IlluminatedCurWord = { bg = 'highlight_med' },
          -- IlluminatedWordText = { bg = 'highlight_med' },
          IlluminatedWordRead = { bg = 'highlight_med' },
          IlluminatedWordWrite = { bg = 'highlight_med' },
        },
      })

      vim.cmd [[ colorscheme rose-pine ]]
    end,
  },

  { 'tpope/vim-sleuth' }, -- Detect tabstop and shiftwidth automatically
  { 'tpope/vim-fugitive' }, -- git support

  { -- git in signcolumn, see `:help gitsigns.txt`
    'lewis6991/gitsigns.nvim',

    config = function()
      require('gitsigns').setup()
    end,
  },

  -- { -- Edit and review GitHub issues and pull requests from the comfort of your favorite editor.
  --   'pwntester/octo.nvim',
  --   cmd = 'Octo',
  --
  --   dependences = {
  --     'nvim-lua/plenary.nvim',
  --     'nvim-telescope/telescope.nvim',
  --     'kyazdani42/nvim-web-devicons',
  --   },
  --
  --   config = function()
  --     require('octo').setup()
  --   end,
  -- },

  -- {
  --   'toppair/peek.nvim',
  --   build = 'deno task --quiet build:fast',
  --
  --   config = function()
  --     -- theme = 'light', -- 'dark' or 'light'
  --     require('peek').setup()
  --   end,
  --
  --   init = function()
  --     vim.api.nvim_create_user_command('Peek', function()
  --       local peek = require('peek')
  --
  --       if peek.is_open() then
  --         peek.close()
  --       else
  --         peek.open()
  --       end
  --     end, {})
  --   end,
  -- },

  { -- file explorer
    'nvim-tree/nvim-tree.lua',

    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },

    keys = {
      { '<leader>e', ':NvimTreeFindFile<CR>', noremap = true, silent = true, desc = 'File Explorer' }
    },

    config = function()
      require('nvim-tree').setup()
    end,
  },

  { -- A fancy, configurable, notification manager for NeoVim
    'rcarriga/nvim-notify',
  },

  { -- smarter yank behaviour
    "gbprod/yanky.nvim",

    config = function()
      require("yanky").setup()

      vim.keymap.set({ 'n', 'x' }, 'p', '<Plug>(YankyPutAfter)')
      vim.keymap.set({ 'n', 'x' }, 'P', '<Plug>(YankyPutBefore)')
      vim.keymap.set({ 'n', 'x' }, 'gp', '<Plug>(YankyGPutAfter)')
      vim.keymap.set({ 'n', 'x' }, 'gP', '<Plug>(YankyGPutBefore)')
    end,
  },

  { -- highlight cursor
    'edluffy/specs.nvim',
    event = 'VeryLazy',

    config = function()
      require('specs').setup({
        show_jumps       = true,
        min_jump         = 30,
        popup            = {
          delay_ms = 0, -- delay before popup displays
          inc_ms = 5, -- time increments used for fade/resize effects
          blend = 80, -- starting blend, between 0-100 (fully transparent), see :h winblend
          width = 250,
          winhl = 'Search', -- 'PMenu', 'Search'
          fader = require('specs').linear_fader,
          resizer = require('specs').empty_resizer,
        },
        ignore_filetypes = {},
        ignore_buftypes  = {
          nofile = true,
        },
      })

      vim.api.nvim_create_user_command('Specs', function()
        require('specs').show_specs()
      end, {})

      -- Press <C-b> to call specs!
      -- vim.keymap.set('n', '<C-l>', ':Specs<CR>', { noremap = true, silent = true, desc = "Highlight current [L]ine" })

      -- You can even bind it to search jumping and more, example:
      vim.keymap.set('n', 'n', 'n:Specs<CR>', { noremap = true, silent = true })
      vim.keymap.set('n', 'N', 'N:Specs<CR>', { noremap = true, silent = true })
    end,
  },

  { -- fancy resize buffers (with animations)
    'anuvyklack/windows.nvim',
    event = 'VeryLazy',

    dependencies = {
      { 'anuvyklack/middleclass' },
      { 'anuvyklack/animation.nvim' },
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

      vim.keymap.set('n', '<leader>m', ':WindowsMaximize<CR>', { noremap = true, desc = "[M]aximize current window" })
    end,
  },

  { -- fancy scrollbar
    'petertriho/nvim-scrollbar',
    event = 'BufReadPost',

    config = function()
      require('scrollbar').setup()
    end,
  },

  { -- Fancier statusline, see `:help lualine.txt`
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
            { 'diagnostics',
              sources = { 'nvim_diagnostic' },
              symbols = { error = '✘ ', warn = '▲ ', hint = '⚑ ', info = ' ' } },
          },
          lualine_c = {
            { 'filetype', icon_only = true, separator = '', padding = { left = 1, right = 0 } },
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

  { -- fancy top buffer manager
    'akinsho/bufferline.nvim',
    vent = 'VeryLazy',

    config = function()
      require('bufferline').setup({
        options = {
          -- separator_style = 'thick',
          diagnostics = 'nvim_lsp',
          offsets = {
            { filetype = 'NvimTree', text = 'NvimTree', highlight = 'Directory', text_align = 'left' },
          },
        },
      })

      vim.keymap.set('n', '<Left>', ':BufferLineCyclePrev<CR>',
        { silent = true, noremap = true, desc = 'Goto left buffer' })
      vim.keymap.set('n', '<Right>', ':BufferLineCycleNext<CR>',
        { silent = true, noremap = true, desc = 'Goto right buffer' })
      vim.keymap.set('n', '<Up>', ':BufferLineCloseLeft|:BufferLineCloseRight<CR>',
        { silent = true, noremap = true, desc = 'Close all buffers but this one' })
      vim.keymap.set('n', '<Down>', ':e#<CR>',
        { silent = true, noremap = true, desc = 'Toggle to previous buffer' })
    end,
  },

  { -- Add indentation guides even on blank lines, see `:help indent_blankline.txt`
    'lukas-reineke/indent-blankline.nvim',

    config = function()
      require('indent_blankline').setup({
        -- char = '┊',
        -- space_char_blankline = ' ',
        show_current_context = true,
        -- show_current_context_start = true,
        -- show_trailing_blankline_indent = false,
      })
    end,
  },

  { -- 'gc' to comment visual regions/lines
    'numToStr/Comment.nvim',
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    config = function()
      require('Comment').setup({
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      })
    end,
  },

  -- { -- shows the context of the currently visible buffer contents
  --   'wellle/context.vim',
  -- },

  { -- highlight other uses of the word under the cursor
    'RRethy/vim-illuminate',
    event = 'BufReadPost',

    config = function()
      local illuminate = require('illuminate')

      illuminate.configure({ delay = 50 })

      vim.keymap.set('n', ']]', function()
        illuminate.goto_next_reference(false)
      end, { noremap = true, desc = 'Next Reference' })

      vim.keymap.set('n', '[[', function()
        illuminate.goto_prev_reference(false)
      end, { noremap = true, desc = 'Prev Reference' })
    end,
  },

  { 'mg979/vim-visual-multi' },
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

  { 'bogado/file-line' }, -- open file given a line, e.g. vim index.html:20

  -- tmux setup
  { 'jby/tmux.vim' },
  {
    'christoomey/vim-tmux-navigator',

    init = function()
      -- ' Don't allow any default key-mappings.
      vim.cmd('let g:tmux_navigator_no_mappings = 1')

      vim.keymap.set('n', '<C-h>', ':TmuxNavigateLeft<CR>', { silent = true, noremap = true })
      vim.keymap.set('n', '<C-j>', ':TmuxNavigateDown<CR>', { silent = true, noremap = true })
      vim.keymap.set('n', '<C-k>', ':TmuxNavigateUp<CR>', { silent = true, noremap = true })
      vim.keymap.set('n', '<C-l>', ':TmuxNavigateRight<CR>', { silent = true, noremap = true })
    end,
  },

  { -- displays a popup with possible key bindings of the command
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup()
    end,
  },

  { -- LSP Configuration & Plugins
    'VonHeikemen/lsp-zero.nvim',

    dependencies = {
      -- LSP Support
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Autocompletion
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',

      -- Snippets
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
    },

    config = function()
      local lsp = require('lsp-zero')
      lsp.preset('recommended')

      -- lsp.ensure_installed({
      --   'tsserver',
      --   'eslint',
      --   'sumneko_lua',
      -- })

      lsp.nvim_workspace()
      lsp.setup()

      -- vim.api.nvim_create_user_command('Format', function()
      --   vim.lsp.buf.format()
      -- end, {})

      -- code formatting on <leader>p and on file-save
      vim.keymap.set('n', '<leader>p', function()
        vim.lsp.buf.format({ async = true })
      end, { silent = true, desc = 'Format Document and make it [P]retty' })

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

  { -- Highlight, edit, and navigate code, see `:help nvim-treesitter`
    'nvim-treesitter/nvim-treesitter',

    dependencies = {
      'nvim-treesitter/nvim-treesitter-context', -- shows context of currently visible buffer contents
      'nvim-treesitter/nvim-treesitter-textobjects', -- Additional text objects via treesitter
      'nvim-treesitter/playground', -- show treesitter info in vim
    },

    -- build = ':TSUpdate',
    build = function()
      require('nvim-treesitter.install').update()
    end,

    config = function()
      local filetype_to_parser = require('nvim-treesitter.parsers').filetype_to_parsername
      filetype_to_parser.javascript = 'tsx' -- the javascript filetype will use the tsx parser

      require('nvim-treesitter.configs').setup({
        -- Add languages to be installed here that you want installed for treesitter
        ensure_installed = { 'typescript', 'css', 'lua', 'help' },

        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        -- incremental_selection = {
        --   enable = true,
        --   keymaps = {
        --     init_selection = '<c-space>',
        --     node_incremental = '<c-space>',
        --     scope_incremental = '<c-s>',
        --     node_decremental = '<c-backspace>',
        --   },
        -- },

        -- nvim-treesitter/playground
        playground = {
          enable = true,
        },
      })

      -- Show treesitter capture group for textobject under cursor (nvim-treesitter/playground)
      vim.keymap.set('n', '<C-e>', ':TSHighlightCapturesUnderCursor<CR>', { noremap = true, silent = true })
    end,
  },

  { -- Fuzzy Finder (files, lsp, etc), see `:help telescope` and `:help telescope.setup()`
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',

    dependencies = {
      -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-telescope/telescope-file-browser.nvim',
      'nvim-lua/plenary.nvim',
    },

    config = function()
      local telescope = require('telescope')

      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
            },
          },
        },
      })

      telescope.load_extension('fzf')
      telescope.load_extension('file_browser')

      -- provided by Yanky
      telescope.load_extension('yank_history')
    end,

    init = function()
      -- See `:help telescope.builtin`
      -- vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
      -- vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
      -- vim.keymap.set('n', '<leader>/', function()
      --   -- You can pass additional configuration to telescope to change theme, layout, etc.
      --   require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      --     winblend = 10,
      --     previewer = false,
      --   })
      -- end, { desc = '[/] Fuzzily search in current buffer]' })

      -- vim.keymap.set('n', '<leader>ff', builtin.find_files, { silent = true, noremap = true, desc = '[F]ind [F]iles' })
      vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>',
        { silent = true, noremap = true, desc = '[F]ind [F]iles' })
      vim.keymap.set('n', '<leader>fp', ':Telescope oldfiles<CR>',
        { silent = true, noremap = true, desc = '[F]ind [P]reviously opened files' })
      vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>',
        { silent = true, noremap = true, desc = '[F]find by [G]rep' })
      vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>',
        { silent = true, noremap = true, desc = '[F]ind [H]elp' })
      vim.keymap.set('n', '<leader>fw', ':Telescope grep_string<CR>',
        { silent = true, noremap = true, desc = '[F]ind [W]ord' })
      vim.keymap.set('n', '<leader>fd', ':Telescope diagnostics<CR>',
        { silent = true, noremap = true, desc = '[F]ind [D]iagnostics' })
      vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>',
        { silent = true, noremap = true, desc = '[F]ind [B]uffers' })

      -- extensions
      vim.keymap.set('n', '<leader>fe', ':Telescope file_browser<CR>',
        { silent = true, noremap = true, desc = '[F]ile [E]xplorer' })
      vim.keymap.set('n', '<C-p>', ':Telescope yank_history<CR>',
        { silent = true, noremap = true, desc = '[F]ind [B]uffers' })
    end,
  },
})

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  group = highlight_group,
  callback = function()
    vim.highlight.on_yank()
  end,
})
