require"cmp".setup {
  sources = {
    { name = "nvim_lsp" }
  }
}
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("lspconfig")["lua_ls"].setup{
  capabilities = capabilities
}

require("lspconfig")["gopls"].setup{
  capabilities = capabilities,
  filetypes = { "go", "gomod", "tmpl", "gotmpl" },
  root_dir = require("lspconfig/util").root_pattern("go.work", "go.sum", "go.mod", ".git"),
  cmd = { "gopls" },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}

require("lspconfig")["golangci_lint_ls"].setup{
  capabilities = capabilities
}
