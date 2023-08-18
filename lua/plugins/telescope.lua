return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.1",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-lua/popup.nvim" },
		{ "nvim-telescope/telescope-fzy-native.nvim" },
		{ "kyazdani42/nvim-web-devicons" },
		{ "nvim-telescope/telescope-file-browser.nvim" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
	},
	config = function()
		local trouble = require("trouble.providers.telescope")
		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_ivy({}),
				},
				file_browser = {
					theme = "ivy",
					hijack_netrw = true,
				},
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
			defaults = {
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line_number",
					"--column",
					"--hidden",
					"--smart-case",
					"--glob '!.git'",
				},
				mappings = {
					i = { ["<c-t>"] = trouble.open_with_trouble },
					n = { ["<c-t>"] = trouble.open_with_trouble },
				},
			},
		})
		require("telescope").load_extension("file_browser")
                require("telescope").load_extension("ui-select")
	end,
}
