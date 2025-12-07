local filetype_attach = setmetatable({}, {
    __index = function()
        return function() end
    end,
})

return function(client, bufnr)
    local filetype = vim.api.nvim_get_option_value("filetype", { filetype = 'on' })

    -- Keymaps for lsp
    -- vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0, des = "LSP Help information of symbol under the cursor" })
    -- vim.keymap.set({ "n", "v" }, "<leader>vca", vim.lsp.buf.code_action, { buffer = 0, desc = "LSP Code Action" })

    vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

    filetype_attach[filetype](client, bufnr)
end
