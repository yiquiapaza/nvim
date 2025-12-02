local lspconfig = require("lspconfig")
local servers = require("core.lsp.servers")

for server, setup in pairs(servers) do
	vim.lsp.config[server]
end

require("core.lsp.mason")
require("core.lsp.null-ls")
