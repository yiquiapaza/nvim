return {
    "nvim-lualine/lualine.nvim",
    dependecies = {
        "kyazdani42/nvim-web-devicons",
    },
    config = function()
        require("lualine").setup {
            options = {
                theme = "rose-pine",
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
            },
        }
    end,
}
