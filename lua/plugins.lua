local fn = vim.fn
local cmd = vim.cmd

-- Boostrap Packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone','https://github.com/wbthomason/packer.nvim', install_path})
end

-- Rerun PackerCompile everytime pluggins.lua is updated
cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Load Packer
cmd([[packadd packer.nvim]])

return require('packer').startup(function(use)
  -- Let Packer manage itself
  use({'wbthomason/packer.nvim', opt = true})

  -- Themes
  -- use 'folke/tokyonight.nvim'
  -- use 'shaunsingh/moonlight.nvim'
  use 'ellisonleao/gruvbox.nvim'

  -- Icons
  use "kyazdani42/nvim-web-devicons"

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- Status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  
  -- LSP and CMP 
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    
    "neovim/nvim-lspconfig",
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',

  -- CMP Luasnip users
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
  }

  -- Neo vim tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', opt = true -- optional, for file icon
    },
    config = function() require'nvim-tree'.setup {
      open_on_setup       = true,
    } end
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
 
  -- Hop is a new Easymotion, rewrite in lua

  use {
    'phaazon/hop.nvim',
    branch = 'v2',
  }
  
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    -- tag = 'release' -- To use the latest release
  }

  -- Ident Blackline
  use "lukas-reineke/indent-blankline.nvim"

end)
