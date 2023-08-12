vim.api.nvim_set_keymap(
  "n",
  "<space>fb",
  ":Telescope file_browser<CR>",
  { noremap = true}
)

vim.api.nvim_set_keymap(
  "n",
  "<space>mm",
  ":Trouble document_diagnostics<CR>",
  { noremap = true }
)
