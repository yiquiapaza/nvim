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
        "jose-elias-alvarez/null-ls.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "j-hui/fidget.nvim",
    },
    opts = {
        inlay_hints = { enabled = true },
    },
    event = "VeryLazy",
    config = function()
        require "core.lsp"
    end,
}
