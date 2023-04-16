require("config.options")
require("config.lazy")
	vim.api.nvim_create_autocmd("User", {
	  group = vim.api.nvim_create_augroup("LazyVim", { clear = true }),
	  pattern = "VeryLazy",
	  callback = function()
      require("config.autocmds")
	  end
	})
