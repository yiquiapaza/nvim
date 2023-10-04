return {
    "catppuccin/nvim",
    name = "catppuccin",
    priotiy = 1000,
    config = function()
        require("catppuccin").setup {
            flavour = "macchiato",
            background = {
                dark = "macchiato",
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
