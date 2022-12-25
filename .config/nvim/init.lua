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
  {
    'folke/tokyonight.nvim',
    init = function()
      vim.cmd('colorscheme tokyonight')
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

  { -- Edit and review GitHub issues and pull requests from the comfort of your favorite editor.
    'pwntester/octo.nvim',
    cmd = 'Octo',

    dependences = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-web-devicons',
    },

    config = function()
      require('octo').setup()
    end,
  },

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
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },

    keys = {
      { '<leader>e', ':NvimTreeFindFile<CR>', noremap = true, silent = true, desc = 'NvimTreeFindFile' }
    },

    config = function()
      -- See `:help nvim-tree-setup`
      require('nvim-tree').setup()
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
          blend = 0, -- starting blend, between 0-100 (fully transparent), see :h winblend
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
    end,

    init = function()
      -- Press <C-b> to call specs!
      vim.api.nvim_set_keymap('n', '<C-b>', ':lua require("specs").show_specs()<CR>', { noremap = true, silent = true })

      -- You can even bind it to search jumping and more, example:
      vim.api.nvim_set_keymap('n', 'n', 'n:lua require("specs").show_specs()<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', 'N', 'N:lua require("specs").show_specs()<CR>', { noremap = true, silent = true })

      -- Or maybe you do a lot of screen-casts and want to call attention to a specific line of code:
      -- vim.api.nvim_set_keymap('n', '<leader>v', ':lua require('specs').show_specs({width = 97, winhl = 'Search', delay_ms = 610, inc_ms = 21})<CR>', { noremap = true, silent = true })
    end,
  },

  { -- Lightweight floating statuslines
    'b0o/incline.nvim',

    config = function()
      require('incline').setup({
        hide = { only_win = true },
      })
    end,
  },

  {
    'anuvyklack/windows.nvim',
    event = 'VeryLazy',

    dependencies = {
      { 'anuvyklack/middleclass' },
      { 'anuvyklack/animation.nvim' },
    },

    config = function()
      require('windows').setup({
        animation = {
          duration = 150,
        },
      })
    end,

    init = function()
      vim.opt.winwidth = 5
      vim.opt.winminwidth = 5
      vim.opt.equalalways = false

      vim.keymap.set('n', '<leader>z', ':WindowsMaximize<CR>')
    end,
  },

  {
    'petertriho/nvim-scrollbar',
    event = 'BufReadPost',

    config = function()
      require('scrollbar').setup();
    end,
  },

  { -- Fancier statusline, see `:help lualine.txt`
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',

    config = function()
      local function clock()
        return ' ' .. os.date('%H:%M')
      end

      require('lualine').setup({
        options = {
          theme = 'auto',
          section_separators = '',
          component_separators = '|',
          icons_enabled = true,
          globalstatus = true,
        },

        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff' },
          lualine_c = {
            { 'filetype', icon_only = true, separator = '', padding = { left = 1, right = 0 } },
            'filename',
            'diagnostics',
          },
          lualine_x = {},
          lualine_y = { 'location' },
          lualine_z = { clock },
        },

        extensions = { 'nvim-tree' },
      })
    end,
  },

  { -- fancy top buffer manager
    'akinsho/bufferline.nvim',

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
    end,

    init = function()
      vim.keymap.set('n', '<Left>', ':BufferLineCyclePrev<CR>', { silent = true, desc = 'Goto left buffer' })
      vim.keymap.set('n', '<Right>', ':BufferLineCycleNext<CR>', { silent = true, desc = 'Goto right buffer' })
      vim.keymap.set('n', '<Up>', ':BufferLineCloseLeft|:BufferLineCloseRight<CR>',
        { silent = true, desc = 'Close all buffers but this one' })
      vim.keymap.set('n', '<Down>', ':e#<CR>', { silent = true, desc = 'Toggle to previous buffer' })
    end,
  },

  { -- Add indentation guides even on blank lines, see `:help indent_blankline.txt`
    'lukas-reineke/indent-blankline.nvim',

    config = function()
      require('indent_blankline').setup({
        char = '┊',
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

  {
    'RRethy/vim-illuminate',
    event = 'BufReadPost',

    config = function()
      require('illuminate').configure({ delay = 200 })
    end,

    init = function()
      vim.keymap.set('n', ']]', function()
        require('illuminate').goto_next_reference(false)
      end, { desc = 'Next Reference' })

      vim.keymap.set('n', '[[', function()
        require('illuminate').goto_prev_reference(false)
      end, { desc = 'Prev Reference' })
    end,
  },

  -- { 'easymotion/vim-easymotion' }, -- vim motions on speed
  {
    'phaazon/hop.nvim',
    cmd = 'HopWord',

    config = function()
      require('hop').setup()
    end,

    init = function()
      vim.keymap.set('', ' ', ':HopWord<CR>', { desc = 'Hop Word' })
    end,
  },

  { 'bogado/file-line' }, -- open file given a line, e.g. vim index.html:20

  -- tmux setup
  { 'jby/tmux.vim' },
  {
    'christoomey/vim-tmux-navigator',

    keys = {
      { '<C-h>', ':TmuxNavigateLeft<CR>', noremap = true },
      { '<C-j>', ':TmuxNavigateDown<CR>', noremap = true },
      { '<C-k>', ':TmuxNavigateUp<CR>', noremap = true },
      { '<C-l>', ':TmuxNavigateRight<CR>', noremap = true },
    },

    config = function()
      -- ' Don't allow any default key-mappings.
      vim.cmd('let g:tmux_navigator_no_mappings = 1')

      -- vim.keymap.set('n', '<Left>', ':BufferLineCyclePrev<CR>', { silent = true, desc = 'Goto left buffer' })
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

      lsp.ensure_installed({
        'tsserver',
        'eslint',
        'sumneko_lua',
      })

      lsp.nvim_workspace()
      lsp.setup()
    end,

    init = function()
      -- vim.cmd [[autocmd BufWritePre lua vim.lsp.buf.formatting_sync()]]

      vim.keymap.set('n', '<leader>p', ':lua vim.lsp.buf.format()<CR>', { silent = true })

      vim.api.nvim_create_autocmd('BufWritePre', {
        callback = function()
          vim.lsp.buf.format()
        end,
      })
    end,
  },

  { -- Highlight, edit, and navigate code, see `:help nvim-treesitter`
    'nvim-treesitter/nvim-treesitter',

    dependencies = {
      'nvim-treesitter/nvim-treesitter-context', -- shows context of currently visible buffer contents
      'nvim-treesitter/nvim-treesitter-textobjects', -- Additional text objects via treesitter
    },

    -- build = ':TSUpdate',
    build = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,

    config = function()
      require('nvim-treesitter.configs').setup({
        -- Add languages to be installed here that you want installed for treesitter
        ensure_installed = { 'lua', 'python', 'rust', 'typescript', 'help' },

        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<c-backspace>',
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              [']m'] = '@function.outer',
              [']]'] = '@class.outer',
            },
            goto_next_end = {
              [']M'] = '@function.outer',
              [']['] = '@class.outer',
            },
            goto_previous_start = {
              ['[m'] = '@function.outer',
              ['[['] = '@class.outer',
            },
            goto_previous_end = {
              ['[M'] = '@function.outer',
              ['[]'] = '@class.outer',
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ['<leader>a'] = '@parameter.inner',
            },
            swap_previous = {
              ['<leader>A'] = '@parameter.inner',
            },
          },
        },
      })
    end,
  },

  { -- Fuzzy Finder (files, lsp, etc), see `:help telescope` and `:help telescope.setup()`
    'nvim-telescope/telescope.nvim',
    -- cmd = { 'Telescope' },

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
    end,

    init = function()
      local builtin = require('telescope.builtin')

      -- See `:help telescope.builtin`
      vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
      vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer]' })

      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]find by [G]rep' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
      -- vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind [B]uffers' })

      -- nnoremap <leader>ff <cmd>Telescope find_files<cr>
      -- nnoremap <leader>fs <cmd>Telescope live_grep<cr>
      -- nnoremap <leader>fc <cmd>Telescope grep_string<cr>
      -- nnoremap <leader>fb <cmd>Telescope buffers<cr>
      -- nnoremap <leader>fe <cmd>Telescope file_browser<cr>
      -- ' nnoremap <leader>fh <cmd>Telescope help_tags<cr>
    end,
  },
})

-- -- Remap for dealing with word wrap
-- vim.keymap.set('n', 'k', 'v:count == 0 ? 'gk' : 'k'', { expr = true, silent = true })
-- vim.keymap.set('n', 'j', 'v:count == 0 ? 'gj' : 'j'', { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
