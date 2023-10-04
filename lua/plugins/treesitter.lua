return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/playground",
        "nvim-treesitter/nvim-treesitter-refactor",
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = {
                "javascript",
                "typescript",
                "go",
                "rust",
                "zig",
                "java",
                "lua",
                "css",
                "yaml",
                "html",
                "kotlin",
                "tsx",
                "vue",
                "json",
                "org",
                "git_config",
                "git_rebase",
                "gitattributes",
                "gitcommit",
                "gitignore",
                "astro",
            },
            modules = {},
            ignore_install = {},
            sync_install = {},
            auto_install = {},
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gnn",
                    node_incremental = "grn",
                    scope_incremental = "grc",
                    node_decremental = "grm",
                },
            },
            refactor = {
                highlight_definitions = { enable = true },
                smart_rename = {
                    enable = true,
                    keymaps = {
                        smart_rename = "trr",
                    },
                },
            },
        }
    end,
}
