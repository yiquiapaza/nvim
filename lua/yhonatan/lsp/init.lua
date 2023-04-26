require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

require("mason-tool-installer").setup({
  ensure_installed = {
    "lua-language-server"
  },
  auto_update = false,
  run_on_start = true,
  start_delay = 3000,
})

require "yhonatan.lsp.server"
