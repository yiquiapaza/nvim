local filetype_attach = setmetatable({}, {
  __index = function()
    return function() end
  end,
})

return function(client, bufnr)
  local filetype = vim.api.nvim_buf_get_options(0, "filetype")

  vim.bo.ommifunc = "v:lua.vim.lsp.ommifunc"

  filetype_attach[filetype](client, bufnr)
end
