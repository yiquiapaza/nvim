--require("mason").setup({
--  ui = {
--    icons = {
--      package_installed = "✓",
--      package_pending = "➜",
--      package_uninstalled = "✗"
--    }
--  }
--})
local lspconfig = require("lspconfig")
local servers = require("yhonatan.lsp.servers")

for server, setup in pairs(servers) do
  lspconfig[server].setup(setup())
end

require("yhonatan.lsp.mason")
