return {
	"nvim-neorg/neorg",
	buld = ":Neorg sync-parsers",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {},
				["core.dirman"] = {
					config = {
						workspaces = {
							common_tasks = "~/Neorg/task",
							research_tasks = "~/Neorg/research",
						},
					},
				},
			},
		})
	end,
}
