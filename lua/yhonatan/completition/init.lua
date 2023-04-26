local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(argc)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {

  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort()
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config,sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "buffer"}
  })
})

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