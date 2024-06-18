local null_ls = require "null-ls"

null_ls.setup {
    sources = {
        -- null_ls.builtins.formatting.gofmt,
        -- null_ls.builtins.formatting.goimports,
        -- null_ls.builtins.formatting.markdownlint,
        -- null_ls.builtins.formatting.prettier,
        -- null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.formatting.eslint,
    },
}

vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "LSP (null ls) Code Actions" })
