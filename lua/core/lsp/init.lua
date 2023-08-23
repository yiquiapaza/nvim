local lspconfig = require("lspconfig")
local servers = require("core.lsp.servers")

for server, setup in pairs(servers) do
	lspconfig[server].setup(setup())
end

require("core.lsp.mason")
require("core.lsp.null-ls")
