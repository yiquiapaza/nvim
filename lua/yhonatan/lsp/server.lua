require"cmp".setup {
  sources = {
    { name = "nvim_lsp" }
  }
}
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("lspconfig")["lua_ls"].setup{
  capabilities = capabilities
}
