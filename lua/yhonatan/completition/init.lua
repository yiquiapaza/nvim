local cmp = require("cmp")

-- set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "cmp_git" },
  },
  {
    { name = "buffer" },
  })
})

-- use buffer source for / (if you enabled native_menu, this won't work anymore)
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmd(),
  sources = {
    { name = "buffer" }
  }
})

-- Use cmdline & path source for : (if you enabled native_menu, this won't work anymore)
cmp.setup.filetype(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, 
  {
    { name = "cmdline" }
  })
})
