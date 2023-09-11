return {
	"mhartington/formatter.nvim",
	keys = {
		{ "<leader>p", ":Format<CR>", desc = "Formatter" },
		-- vim.api.nvim_set_keymap("n", "<space>p", ":Format<CR>", { noremap = true })
	},
	config = function()
		local util = require("formatter.util")
		require("formatter").setup({
			loggin = true,
			log_level = vim.log.levels.WARN,
			filetype = {
				lua = {
					require("formatter.filetypes.lua").stylua(),
				},
				-- html = {
				-- 	function()
				-- 		return {
				-- 			exe = "npx prettier --write .",
				-- 		}
				-- 	end,
				-- }
				html = {
					function()
						return {
							exe = "prettierd",
							args = { vim.api.nvim_buf_get_name(0) },
							stdin = true,
						}
					end,
				},
				javascript = {
					require("formatter.filetypes.javascript").prettier(),
				},
				typescript = {
					require("formatter.filetypes.typescript").prettier(),
				},
				["*"] = {
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})
	end,
}
