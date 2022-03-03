-- Load all config files

require('options')
require('keymaps')
-- require('commands')
require('plugins')
require('themes')
require'nvim-tree'.setup {
  open_on_setup = true,
}
require('lualine').setup()

require('indent_blankline').setup{
  show_current_context = true,
  show_end_of_line = true,
  space_char_blackline = " ",
}
require('nvim-treesitter-config')
require('lsp-config')

require('nvim-cmp')
require('gitsigns').setup()

