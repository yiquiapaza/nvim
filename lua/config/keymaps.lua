-- Telescope

vim.api.nvim_set_keymap(
  "n",
  "<space>fb",
  ":Telescope file_browser<CR>",
  { noremap = true}
)

-- Trouble

vim.api.nvim_set_keymap(
  "n",
  "<space>mm",
  ":Trouble document_diagnostics<CR>",
  { noremap = true }
)

