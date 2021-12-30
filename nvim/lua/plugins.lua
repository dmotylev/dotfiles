vim.cmd([[packadd packer.nvim]])

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup {
  function(use)
    use 'wbthomason/packer.nvim'
    use 'lewis6991/impatient.nvim'
    use 'NLKNguyen/papercolor-theme'

    use 'neovim/nvim-lspconfig'

    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
    }

    use {
      {
        'nvim-telescope/telescope.nvim',
        requires = {
          'nvim-lua/popup.nvim',
          'nvim-lua/plenary.nvim',
          'telescope-frecency.nvim',
          'telescope-fzf-native.nvim',
        },
        wants = {
          'popup.nvim',
          'plenary.nvim',
          'telescope-frecency.nvim',
          'telescope-fzf-native.nvim',
        },
        config = [[require('config.telescope')]],
        setup = [[require('config.telescope_setup')]], 
      },
      {
        'nvim-telescope/telescope-frecency.nvim',
        config = [[require"telescope".load_extension("frecency")]],
        requires = 'tami5/sqlite.lua',
      },
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
      },
    }

    use {
      'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      },
      tag = 'release', -- To use the latest release
      config = [[require('gitsigns').setup()]],
    }
  end,

  config = {
    -- Move to lua dir so impatient.nvim can cache it
    compile_path = vim.fn.stdpath('config')..'/lua/packer_compiled.lua'
  }
}
