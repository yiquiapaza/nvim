return {
	"folke/trouble.nvim",
	cmd = { "TroubleToggle", "Trouble" },
	dependencies = { "kyazdani42/nvim-web-devicons" },
	keys = {
		{ "<leader>mm", ":Trouble document_diagnostics<CR>", desc = "Trouble Document Diagnostics" },
		-- vim.api.nvim_set_keymap("n", "<space>mm", ":Trouble document_diagnostics<CR>", { noremap = true })
	},
	config = true,
}
