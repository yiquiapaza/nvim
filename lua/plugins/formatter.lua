return {
	"mhartington/formatter.nvim",
	config = function()
		local util = require("formatter.util")
		require("formatter").setup({
			loggin = true,
			log_level = vim.log.levels.WARN,
			filetype = {
				lua = {
					require("formatter.filetypes.lua").stylua(),
				},
				html = {
					function()
						return {
							exe = "npx prettier --write .",
						}
					end,
				},
			},
			["*"] = {
				require("formatter.filetypes.any").remove_trailing_whitespace,
			},
		})
	end,
}
