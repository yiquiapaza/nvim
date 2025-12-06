return {
    "neovim/nvim-lspconfig",
    dependencies = {
        {
            "williamboman/mason.nvim",
            opts = {
                ui = {
                    border = "rounded",
                },
            },
        },
        "nvimtools/none-ls.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "j-hui/fidget.nvim",
    },
    wants = {
        "inlay-hints.nvim",
    },
    event = "VeryLazy",
    config = function()
        require "core.lsp"
    end,
    requires = {
        "simrat/inlay-hints.nvim",
        config = function()
            require("inlay-hints").setup()
        end,
    },
}
