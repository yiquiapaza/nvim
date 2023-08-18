return {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		require("indent_blankline").setup({
			show_end_of_line = true,
			show_current_context = true,
			space_chart_blackline = " ",
		})
		vim.opt.list = true
		vim.opt.listchars:append("space:⋅")
		vim.opt.listchars:append("eol:↴")
	end,
}
