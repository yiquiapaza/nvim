return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-git",
        "saadparwaiz1/cmp_luasnip",
        "onsails/lspkind-nvim",
        "windwp/nvim-autopairs",
        -- "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    event = "VeryLazy",
    config = function()
        require "core.completition"
    end,
}
