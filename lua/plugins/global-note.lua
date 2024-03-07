return {
    "backdround/global-note.nvim",
    config = function()
        require("global-note").setup {
            filename = "global.md",
            directory = "~/Projects/Notes/",

            additional_presets = {
                research = {
                    filename = "research.md",
                    title = "List of papers or draft",
                    command_name = "ResearchNote",
                    -- All not specified options are used from the root.
                },

                programming = {
                    filename = "programming.md",
                    title = "List of Programming Languages Notes",
                    command_name = "ProgrammingNote",
                    -- All not specified options are used from the root.
                },

                books = {
                    filename = "books.md",
                    title = "List of books",
                    command_name = "BookNote",
                }
            },
        }

        -- Functions to toggle notes:
        -- require("global-note").toggle_note()
        -- require("global-note").toggle_note "programming"
        -- require("global-note").toggle_note "research"
        -- require("global-note").toggle_note "books"

        -- Commands to toggle notes (they are generated by command_name field):
        -- :GlobalNote -- by default
        -- :ProjectsNote
        -- :FoodNote
    end,
}
