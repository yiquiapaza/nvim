return {
	"mhartington/formatter.nvim",
	config = function()
		require("formatter").setup({
			loggin = true,
			log_level = vim.log.levels.WARN,
			filetype = {
				lua = {
					require("formatter.filetypes.lua").stylua(),
				},
			},
			["*"] = {
				require("formatter.filetypes.any").remove_trailing_whitespace,
			},
		})
	end,
}
