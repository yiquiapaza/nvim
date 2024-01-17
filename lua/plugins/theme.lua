return {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
        require("catppuccin").setup {
            flavour = "mocha",
            background = {
                dark = "mocha",
            },
            integrations = {
                cmp = true,
                gitsigns = true,
                treesitter = true,
                noice = false,
                telescope = {
                    enabled = true,
                },
                harpoon = false,
                hop = false,
                lsp_trouble = false,
            },
        }
        vim.cmd.colorscheme "catppuccin"
    end,
}
