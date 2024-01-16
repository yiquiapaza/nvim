return {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim"},
    keys = {
        {"<leader>nw", ":Neorg workspace work<CR>", desc = "Open work notes"},
        {"<leader>np", ":Neorg workspace personal<CR>", desc = "Open personal notes"},
        {"<leader>nr", ":Neorg workspace research<CR>", desc = "Open research notes"},
        {"<leader>na", ":Neorg workspace academic<CR>", desc = "Open academic notes"},
    },
    config = function ()
        require("neorg").setup {
            load = {
                ["core.defaults"] = {},
                ["core.dirman"] = {
                    config = {
                        workspaces = {
                            -- Create dir where you have your notes
                            -- Personal
                            personal = "~/Projects/Notes/Personal",
                            -- Work
                            work = "~/Projects/Notes/Work",
                            -- Research
                            research = "~/Projects/Notes/Research",
                            -- Academic
                            academic = "~/Projects/Notes/Academic",
                        }
                    }
                }
            }
        }
    end
}
