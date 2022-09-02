-- Load all config files

require('options')
require('keymaps')
-- require('commands')
require('plugins')
require('themes')
require'nvim-tree'.setup {
  open_on_setup = true,
}
require('lualine').setup{
options = {
    theme = 'nightfly'
  }
}

require('nvim-treesitter-config')
require('hop').setup()
require("mason").setup()
require("mason-lspconfig").setup()

require('nvim-cmp')
require('gitsigns').setup()
require('indent-blackline')
