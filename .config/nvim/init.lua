vim.g.mapleader = ',' -- remap leader key

require('opt')
require('remap')

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
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
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
        dark_variant = 'moon',
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

  {
    -- file explorer
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    keys = {
      { '<leader>e', ':NvimTreeFindFileToggle<CR>', noremap = true, silent = true, desc = 'File Explorer' }
    },
    config = function()
      local window_width = function()
        return math.floor(vim.opt.columns:get() * 0.6)
      end
      local window_height = function()
        return math.floor((vim.opt.lines:get() - vim.opt.cmdheight:get()) * 0.6)
      end

      require('nvim-tree').setup({
        -- disable_netrw = true,
        -- hijack_netrw = true,
        respect_buf_cwd = true,
        sync_root_with_cwd = true,
        sort_by = "case_sensitive",
        view = {
          relativenumber = true,
          adaptive_size = true,
          float = {
            enable = true,
            open_win_config = function()
              local center_x = math.floor((vim.opt.columns:get() - window_width()) / 2)
              local center_y = math.floor((vim.opt.lines:get() - vim.opt.cmdheight:get() - window_height()) / 2)

              return {
                border = "rounded",
                relative = "editor",
                col = center_x,
                row = center_y,
                width = window_width(),
                height = window_height(),
              }
            end,
          },
          width = window_width,
          height = window_height,
          mappings = {
            list = {
              { key = "<ESC>", action = "close" },
              { key = "h",     action = "close_node" },
              { key = "l",     action = "edit" },
              -- { key = "H",     action = "collapse_all" },
              -- { key = "L",     action = "expand_all" },
            },
          },
        },
        filters = {
          dotfiles = true,
        },
      })
    end,
  },


  { 'tpope/vim-sleuth' },   -- Detect tabstop and shiftwidth automatically
  { 'tpope/vim-fugitive' }, -- git support

  {
    -- git in signcolumn, see `:help gitsigns.txt`
    'lewis6991/gitsigns.nvim',
    lazy = true,
    config = function()
      require('gitsigns').setup()
    end,
  },

  {
    -- smarter yank behaviour
    "gbprod/yanky.nvim",
    config = function()
      require("yanky").setup()

      vim.keymap.set({ 'n', 'x' }, 'p', '<Plug>(YankyPutAfter)')
      vim.keymap.set({ 'n', 'x' }, 'P', '<Plug>(YankyPutBefore)')
      vim.keymap.set({ 'n', 'x' }, 'gp', '<Plug>(YankyGPutAfter)')
      vim.keymap.set({ 'n', 'x' }, 'gP', '<Plug>(YankyGPutBefore)')
    end,
  },

  {
    -- highlight cursor
    'edluffy/specs.nvim',
    event = 'VeryLazy',
    config = function()
      require('specs').setup({
        show_jumps       = true,
        min_jump         = 30,
        popup            = {
          delay_ms = 0,     -- delay before popup displays
          inc_ms = 5,       -- time increments used for fade/resize effects
          blend = 80,       -- starting blend, between 0-100 (fully transparent), see :h winblend
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
    init = function()
      vim.keymap.set('n', '<C-m>', ':WindowsMaximize<CR>', { noremap = true, desc = "[M]aximize current window" })
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

  -- {
  --   'nanozuki/tabby.nvim',
  --   config = function()
  --     require('tabby.tabline').use_preset('active_wins_at_tail', {
  --       theme = {
  --         fill = 'TabLineFill', -- tabline background
  --         head = 'TabLine', -- head element highlight
  --         current_tab = 'TabLineSel', -- current tab label highlight
  --         tab = 'TabLine', -- other tab label highlight
  --         win = 'TabLine', -- window highlight
  --         tail = 'TabLine', -- tail element highlight
  --       },
  --       nerdfont = true, -- whether use nerdfont
  --       -- tab_name = {
  --       --   name_fallback = 'function({tabid}), return a string',
  --       -- },
  --       buf_name = {
  --         mode = "'unique'|'relative'|'tail'|'shorten'",
  --       },
  --     })
  --
  --     -- vim.keymap.set({ 'n', 'x' }, '<Left>', ':tabp<CR>',
  --     --   { silent = true, noremap = true, desc = 'Goto left tab' })
  --     -- vim.keymap.set({ 'n', 'x' }, '<Right>', ':tabn<CR>',
  --     --   { silent = true, noremap = true, desc = 'Goto right tab' })
  --     -- vim.keymap.set({ 'n', 'x' }, '<Up>', ':tabonly<CR>',
  --     --   { silent = true, noremap = true, desc = 'Close all tabs but this one' })
  --     -- vim.keymap.set({ 'n', 'x' }, '<Down>', ':e#<CR>',
  --     --   { silent = true, noremap = true, desc = 'Toggle to previous tab' })
  --   end,
  -- },

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
            { filetype = 'NvimTree', text = 'NvimTree', highlight = 'Directory', text_align = 'left' },
          },
        },
      })

      vim.keymap.set('n', '<Left>', ':BufferLineCyclePrev<CR>',
        { silent = true, noremap = true, desc = 'Goto left buffer' })
      vim.keymap.set('n', '<Right>', ':BufferLineCycleNext<CR>',
        { silent = true, noremap = true, desc = 'Goto right buffer' })
      vim.keymap.set('n', '<Up>', ':BufferLineCloseLeft<CR> :BufferLineCloseRight<CR>',
        { silent = true, noremap = true, desc = 'Close all buffers but this one' })
      vim.keymap.set('n', '<Down>', ':e#<CR>',
        { silent = true, noremap = true, desc = 'Toggle to previous buffer' })
    end,
  },

  -- {
  --   'romgrk/barbar.nvim',
  --   dependencies = {
  --     'nvim-tree/nvim-web-devicons',
  --   },
  --
  --   config = function()
  --     require 'bufferline'.setup({
  --       animation = false,
  --     })
  --
  --     vim.keymap.set('n', '<Left>', ':BufferPrevious<CR>',
  --       { silent = true, noremap = true, desc = 'Close all buffers but this one' })
  --     vim.keymap.set('n', '<Right>', ':BufferNext<CR>',
  --       { silent = true, noremap = true, desc = 'Close all buffers but this one' })
  --     vim.keymap.set('n', '<Up>', ':BufferCloseAllButCurrent<CR>',
  --       { silent = true, noremap = true, desc = 'Close all buffers but this one' })
  --     vim.keymap.set('n', '<Down>', ':BufferPick<CR>',
  --       { silent = true, noremap = true, desc = 'Pick a buffert' })
  --   end,
  -- },

  {
    -- Add indentation guides even on blank lines, see `:help indent_blankline.txt`
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

  {
    -- 'gc' to comment visual regions/lines
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
    -- highlight other uses of the word under the cursor
    'RRethy/vim-illuminate',
    -- event = 'BufReadPost',

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

  {
    -- displays a popup with possible key bindings of the command
    'folke/which-key.nvim',
    lazy = true,
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

  {
    -- LSP Configuration & Plugins
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
      })

      lsp.nvim_workspace()
      lsp.setup()
    end,
    init = function()
      -- vim.api.nvim_create_user_command('Format', function()
      --   vim.lsp.buf.format()
      -- end, {})

      -- code formatting on <leader>p and on file-save
      -- vim.keymap.set('n', '<leader>p', ':LspZeroFormat<CR>', { desc = 'Format Document and make it [P]retty' })
      vim.keymap.set('n', '<leader>p', function()
        vim.lsp.buf.format({ async = true })
      end, { noremap = true, desc = 'Format Document and make it [P]retty' })

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
      'nvim-treesitter/nvim-treesitter-context',     -- shows context of currently visible buffer contents
      'nvim-treesitter/nvim-treesitter-textobjects', -- Additional text objects via treesitter
      'nvim-treesitter/playground',                  -- show treesitter info in vim
    },
    -- build = ':TSUpdate',
    build = function()
      require('nvim-treesitter.install').update()
    end,
    config = function()
      -- local filetype_to_parser = require('nvim-treesitter.parsers').filetype_to_parsername
      -- filetype_to_parser.javascript = 'tsx' -- the javascript filetype will use the tsx parser
      vim.treesitter.language.register("jsx", "javascript") -- the javascript filetype will use the tsx parser

      require('nvim-treesitter.configs').setup({
        -- don't want TS on certain conditions
        disable = function(lang, bufnr)
          -- return lang == "text" -- and api.nvim_buf_line_count(bufnr) > 50000
          return api.nvim_buf_line_count(bufnr) > 10000
        end,
        auto_install = true,
        -- Add languages to be installed here that you want installed for treesitter
        ensure_installed = { 'typescript', 'css', 'lua', 'help' },
        ignore_install = { "javascript" },
        highlight = {
          enable = true,

          -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,

          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },

        -- nvim-treesitter/playground
        playground = {
          enable = true,
        },
      })

      -- Show treesitter capture group for textobject under cursor (nvim-treesitter/playground)
      vim.keymap.set('n', '<C-e>', ':TSHighlightCapturesUnderCursor<CR>', { noremap = true, silent = true })
    end,
  },

  {
    -- Fuzzy Finder (files, lsp, etc), see `:help telescope` and `:help telescope.setup()`
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
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
    config = function()
      local telescope = require('telescope')

      telescope.setup({
        defaults = {
          layout_config = {
            horizontal = {
              preview_width = 0.55,
              results_width = 0.8,
            },
            width = 0.87,
            height = 0.80,
          },
          path_display = { "truncate" },
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
        -- extensions = {
        --   file_browser = {
        --     -- disables netrw and use telescope-file-browser in its place
        --     hijack_netrw = true,
        --     -- mappings = {
        --     --   ["i"] = {
        --     --     -- your custom insert mode mappings
        --     --   },
        --     --   ["n"] = {
        --     --     -- your custom normal mode mappings
        --     --   },
        --     -- },
        --   },
        -- },
      })

      telescope.load_extension('fzf')
      telescope.load_extension('file_browser')
      telescope.load_extension('ui-select')

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
      vim.keymap.set('n', '<leader>/', ':Telescope current_buffer_fuzzy_find<CR>',
        { silent = true, noremap = true, desc = 'Fuzzy find in current buffer' })
      vim.keymap.set('n', '<leader>fc', ':Telescope commands<CR>',
        { silent = true, noremap = true, desc = '[F]ind [C]ommands' })

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

-- augroup LargeFile
--         let g:large_file = 10485760 " 10MB
--
--         " Set options:
--         "   eventignore+=FileType (no syntax highlighting etc
--         "   assumes FileType always on)
--         "   noswapfile (save copy of file)
--         "   bufhidden=unload (save memory when other file is viewed)
--         "   buftype=nowritefile (is read-only)
--         "   undolevels=-1 (no undo possible)
--         au BufReadPre *
--                 \ let f=expand("<afile>") |
--                 \ if getfsize(f) > g:large_file |
--                         \ set eventignore+=FileType |
--                         \ setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 |
--                 \ else |
--                         \ set eventignore-=FileType |
--                 \ endif
-- augroup END
