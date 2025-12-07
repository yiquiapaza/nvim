return {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    dependencies = { 'nvim-mini/mini.icons' },
    keys = {
        { "<leader>mm", ":Trouble diagnostics toggle<CR>", desc = "Diagnostics (Trouble)" },
        -- vim.api.nvim_set_keymap("n", "<space>mm", ":Trouble document_diagnostics<CR>", { noremap = true })
    },
    config = true,
}
