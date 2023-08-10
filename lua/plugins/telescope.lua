return {
"nvim-telescope/telescope.nvim",
  tag = "0.1.1",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-lua/popup.nvim" },
    { "nvim-telescope/telescope-fzy-native.nvim" },
    { "kyazdani42/nvim-web-devicons" },
    { "nvim-telescope/telescope-file-browser.nvim" },
    { "nvim-telescope/telescope-ui-select.nvim" }
  },
  config = function ()
    require("telescope").setup {
      extensions = {
        file_browser = {
        },

      },
    }
    require("telescope").load_extension "file_browser"
  end
}
