return {
    'lewis6991/hover.nvim',
    config = function()
        require('hover').setup {
            providers = {
                'hover.providers.diagnostic',
                'hover.providers.lsp',
                'hover.providers.man',
            },
            preview_opts = {
                border = "single",
            },
            preview_window = false,
            title = true,
            mouse_providers = {
                "hover.providers.lsp",
            },
            mouse_delay = 1000,
        }

        vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
        vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })
    end,
}
