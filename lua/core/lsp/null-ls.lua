local null_ls = require("null-ls")

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.jq,
    null_ls.builtins.formatting.astyle,
    null_ls.builtins.formatting.autoflake,
    null_ls.builtins.formatting.cbfmt,
    null_ls.builtins.formatting.fixjson,
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.markdownlint,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.stylua,

    null_ls.builtins.code_actions.refactoring,

    null_ls.builtins.diagnostics.luacheck,
  },
}

vim.keymap.set({"n","v"}, "<leader>vca", vim.lsp.buf.code_action, {desc = "LSP (null ls) Code Actions"})
