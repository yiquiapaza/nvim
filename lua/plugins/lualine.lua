return {
  "nvim-lualine/lualine.nvim",
  dependecies = {
    "kyazdani42/nvim-web-devicons",
  },
  config = function()
    require "lualine".setup {
      options = {
        theme =  "nightfly"
      },
    }
  end
}
