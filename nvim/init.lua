--
-- plugin agnostic configuration
--

vim.loader.enable()

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.o.termguicolors = true

-- Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.cmd([[
  " Put these in an autocmd group, so that you can revert them with:
  " ":augroup vimStartup | au! | augroup END"
  augroup vimStartup
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid, when inside an event handler
    " (happens when dropping a file on gvim) and for a commit message (it's
    " likely a different one than last time).
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

  augroup END
]])

vim.o.hidden = true -- Enable modified buffers in background
vim.o.list = true   -- Show some invisible characters
-- Set some invisible characters
vim.opt.listchars = { tab = '› ', trail = '·', extends = '…', precedes = '…', nbsp = '␣' }
-- Customize session options. Namely, I don't want to save hidden and unloaded buffers or empty windows.
vim.o.sessionoptions = "curdir,folds,help,options,tabpages,winsize"

-- Tame tab settings; thanks https://arisweedler.medium.com/tab-settings-in-vim-1ea0863c5990
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.smartindent = true

-- Show a few lines of context around the cursor.  Note that this makes the text scroll if you mouse-click near the start or end of the window.
vim.opt.scrolloff = 5

--Set highlight on search
vim.o.hlsearch = true
vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':silent! nohls<CR>',
  { noremap = true, silent = true, desc = 'Turn off search highlighting' })

--Make line numbers default
vim.wo.number = true

--Enable mouse mode
vim.o.mouse = 'a'

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

--Set colorscheme (order is important here)
-- vim.o.termguicolors = true
-- vim.g.onedark_terminal_italics = 2
-- vim.cmd [[colorscheme onedark]]

-- Shortcut to yanking to the system clipboard
vim.api.nvim_set_keymap('', '<leader>y', '"+y', { noremap = true, silent = true, desc = 'Copy to system clipboard' })
vim.api.nvim_set_keymap('', '<leader>p', '"+p', { noremap = true, silent = true, desc = 'Paste from system clipboard' })

-- Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- Save buffer changes with cmd-s
vim.api.nvim_set_keymap('n', '<D-s>', '<cmd>w<CR>', { noremap = true, silent = true, desc = 'Save current buffer' })
vim.api.nvim_set_keymap('i', '<D-s>', '<cmd>w<CR>', { noremap = true, silent = true, desc = 'Save current buffer' })
vim.api.nvim_set_keymap('v', '<D-s>', '<cmd>w<CR>', { noremap = true, silent = true, desc = 'Save current buffer' })

vim.keymap.set("n", "<esc>", function()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_config(win).relative == "win" then
      vim.api.nvim_win_close(win, false)
    end
  end
end)

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

--
-- plugin specific configuration
--

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  --[[ {
    'navarasu/onedark.nvim',
    lazy = false,
    priority = 1000, -- make sure we load this during startup as it is the main colorscheme
    opts = {
      style = 'cool',
      code_style = {
        comments = 'italic',
        keywords = 'bold',
        functions = 'none',
        strings = 'none',
        variables = 'none'
      },
    },
    init = function() -- make sure to load this before all the other start plugins
      require('onedark').load()
    end
  }, ]]

  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    init = function()
      vim.cmd 'colorscheme tokyonight-storm'
    end
  },

  --[[ { -- Light color scheme for Vim with comfortable contrast
    'kkga/vim-envy',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd 'colorscheme envy'
    end
  }, ]]

  --[[ {
    'shaunsingh/nord.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = false
      vim.g.nord_disable_background = false
      vim.g.nord_italic = false
      vim.g.nord_uniform_diff_background = true
      vim.g.nord_bold = false

      require('nord').set()
    end
  }, ]]

  --[[ {
    -- 'ntk148v/komau.vim',
    -- 'pbrisbin/vim-colors-off',
    -- 'girishji/declutter.nvim',
    'oahlen/iceberg.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.g.colors_off_a_little = 1
      vim.cmd.colorscheme 'iceberg'
    end
  }, ]]

  {
    'nvim-tree/nvim-web-devicons',
    lazy = true,
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    opts = {
      theme = 'auto',
      icons_enabled = true,
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      always_divide_middle = true,
      globalstatus = true,
    }
  },

  -- Add indentation guides even on blank lines
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      local ibl = require('ibl')

      vim.api.nvim_set_hl(0, "IblWhitespace", { link = "IblIndent" })

      ibl.setup({
        indent = {
          char = '⠅',
        },
        scope = {
          char = '⠅',
          enabled = true,
          show_start = false,
          show_end = false,
        },
      })
    end,
  },

  -- Git commands in nvim
  { 'tpope/vim-fugitive' },

  -- Fugitive-companion to interact with github
  { 'tpope/vim-rhubarb' },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = true,
  },

  -- UI to select things (files, grep results, open buffers...)
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'telescope-frecency.nvim',
      'telescope-fzf-native.nvim',
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
      },
      extensions = {
        frecency = {
          workspaces = {
            dot = '/Users/dmotylev/Workshop/dotfiles',
            rs = '/Users/dmotylev/Workshop/redsift',
          }
        },
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = 'smart_case',
        },
      },
      pickers = {
        lsp_references = { theme = 'dropdown' },
        lsp_code_actions = { theme = 'dropdown' },
        lsp_definitions = { theme = 'dropdown' },
        lsp_implementations = { theme = 'dropdown' },
        buffers = {
          sort_lastused = true,
          previewer = false,
        },
      },
    },
    keys = {
      { '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]],                          desc = 'Open buffers list' },
      { '<leader>sf',      [[<cmd>lua require('telescope.builtin').find_files({ previewer = false })<CR>]],  desc = 'Find files' },
      { '<leader>sb',      [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]],        desc = 'Fuzzy find in current buffer' },
      { '<leader>sh',      [[<cmd>lua require('telescope.builtin').help_tags()<CR>]],                        desc = 'Help tags' },
      { '<leader>sd',      [[<cmd>lua require('telescope.builtin').grep_string()<CR>]],                      desc = 'GREP string' },
      { '<leader>sp',      [[<cmd>lua require('telescope.builtin').live_grep()<CR>]],                        desc = 'Live GREP' },
      { '<leader>so',      [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], desc = 'List tags in current buffer' },
      { '<leader>?',       [[<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>]],             desc = 'Frecency' },
    }
  },

  {
    'nvim-telescope/telescope-frecency.nvim',
    lazy = true,
    config = function()
      require("telescope").load_extension("frecency")
    end,
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    lazy = true,
    build = 'make',
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },

  -- Add git related info in the signs columns and popups
  {
    'lewis6991/gitsigns.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, { expr = true })

        map('n', '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, { expr = true })

        -- Actions
        map('n', '<leader>hs', gs.stage_hunk, { desc = 'Stage hunk' })
        map('n', '<leader>hr', gs.reset_hunk, { desc = 'Reset hunk' })
        map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
          { desc = 'Stage hunk' })
        map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
          { desc = 'Reset hunk' })
        map('n', '<leader>hS', gs.stage_buffer, { desc = 'Stage buffer' })
        map('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'Undo stage hunk' })
        map('n', '<leader>hR', gs.reset_buffer, { desc = 'Reset buffer' })
        map('n', '<leader>hp', gs.preview_hunk, { desc = 'Preview hunk' })
        map('n', '<leader>hb', function() gs.blame_line { full = true } end, { desc = 'Blame line' })
        map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'Toggle current line blame' })
        map('n', '<leader>hd', gs.diffthis, { desc = 'Diff this' })
        map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = 'Diff this (ignore whitespace)' })
        map('n', '<leader>td', gs.toggle_deleted, { desc = 'Toggle deleted' })

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Select hunk' })
      end
    }
  },

  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      git = {
        enable = false,
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
      },
    },
    keys = {
      { '<leader>ec', '<Cmd>NvimTreeToggle<CR>',         desc = 'Open or close the tree' },
      { '<leader>ef', '<Cmd>NvimTreeFindFileToggle<CR>', desc = 'Open the tree for the current buffer' },
      { '<leader>ee', '<Cmd>NvimTreeFocus<CR>',          desc = 'Focus on the tree' },
    },
  },

  -- Highlight, edit, and navigate code using a fast incremental parsing library
  {
    'nvim-treesitter/nvim-treesitter',
    dependencise = {
      -- Additional textobjects for treesitter
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = {
          "vim", "go", "zig", "terraform", "lua", "yaml", "json", "rust",
          "hcl", "dockerfile", "bash", "toml", "python", "html", "css" },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true, -- false will disable the whole extension
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = 'gnn',
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm',
          },
        },
        indent = {
          enable = true,
          disable = { 'yaml' },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
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
        },
      })
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    lazy = true
  },

  {
    'nvim-treesitter/nvim-treesitter-context',
    opts = {
      enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    }
  },

  { 'neovim/nvim-lspconfig', lazy = true },

  {
    'ray-x/navigator.lua',
    dependencies = {
      { 'ray-x/guihua.lua', build = 'cd lua/fzy && make' }
    },
    opts = {
      transparency = 100,
    },
  },

  {
    'numToStr/Comment.nvim',
    config = true,
  },

  {
    'almo7aya/openingh.nvim',
    config = true,
    keys = {
      { '<Leader>gr', ':OpenInGHRepo <CR>',      desc = 'Open GitHub repo' },
      { '<Leader>gf', ':OpenInGHFile <CR>',      desc = 'Open file on GitHub' },
      { '<Leader>gf', ':OpenInGHFileLines <CR>', mode = 'v',                  desc = 'Show lines on GitHub' },
    },
  },

  {
    'github/copilot.vim'
  },

  {
    'lucidph3nx/nvim-sops',
    event = { 'BufEnter' },
    config = true,
  },

  {
    'L3MON4D3/LuaSnip',
    config = true,
  },

  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      -- luasnip setup
      local luasnip = require 'luasnip'

      -- nvim-cmp setup
      local cmp = require 'cmp'
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = {
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-Down>'] = cmp.mapping.scroll_docs(-4),
          ['<C-Up>'] = cmp.mapping.scroll_docs(4),
          ['<C-e>'] = cmp.mapping.close(),
          ['<Esc>'] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping({
            i = function(fallback)
              if cmp.visible() and cmp.get_active_entry() then
                cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
              else
                fallback()
              end
            end,
            s = cmp.mapping.confirm({ select = true }),
            c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
          }),
          ['<Down>'] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end,
          ['<Up>'] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end,
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        },
      })
    end,
  },

  {
    'hrsh7th/cmp-nvim-lsp',
    --[[ config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      require('cmp_nvim_lsp').default_capabilities(capabilities)
    end, ]]
  },

  {
    'ziglang/zig.vim',
    ft = 'zig',
    config = true,
  },

  {
    'hashivim/vim-terraform',
    ft = { 'terraform', 'tf', 'tfvars', 'hcl' },
    init = function()
      vim.g.terraform_align = 1
      vim.g.terraform_fmt_on_save = 1
    end,
  },

  {
    "folke/neodev.nvim",
    config = true,
  },

  {
    'ray-x/go.nvim',
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = { 'go', 'gomod' },
    event = { "CmdlineEnter" },
    build = ':lua require("go.install").update_all_sync()',
    config = true,
  },

  {
    'leoluz/nvim-dap-go',
    dependencies = {
      'mfussenegger/nvim-dap',
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
      --[[ {
        'nvim-telescope/telescope-dap.nvim',
        init = function()
          require('telescope').load_extension('dap')
        end,
      }, ]]
    },
    ft = 'go',
    config = true
  },
})
