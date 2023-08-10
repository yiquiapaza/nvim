return {
  "nvim-tree/nvim-tree.lua",
  dependecies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    require "nvim-tree".setup {
      sort_by = "case_sensitive",
      view = {
        width = 30,
      },
      filters = {
        dotfiles = false
      },
    }
  end
}
