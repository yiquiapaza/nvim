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
    keys = {
        { "<leader>fb", ":Telescope file_browser<CR>", desc = "Telescope File Browser" },
        { "<leader>ff", ":Telescope find_files<CR>", desc = "Telescope File Files" },
        -- vim.api.nvim_set_keymap("n", "<space>fb", ":Telescope file_browser<CR>", { noremap = true })
        -- vim.api.nvim_set_keymap("n", "<space>ff", ":Telescope find_files<CR>", { noremap = true })
    },
    config = function()
        local trouble = require "trouble.providers.telescope"
        local fb_actions = require("telescope").extensions.file_browser.actions
        require("telescope").setup {
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown {},
                },
                file_browser = {
                    theme = "dropdown",
                    hijack_netrw = true,
                    hidden = true,
                },
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
                pickers = {
                    find_files = {
                        prompt_prefix = "🔍",
                        hidden = true,
                    },
                },
                find_hidden = {
                    hidden = true,
                },
            },
            defaults = {
                file_ignore_patterns = {
                    "node_modules",
                },
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "-uu", -- **This is the setting not being respected**
                },
                mappings = {
                    i = {
                        ["<C-t>"] = trouble.open_with_trouble,
                        ["<C-c>"] = fb_actions.create,
                        ["<A-r>"] = fb_actions.rename,
                        ["<A-y>"] = fb_actions.copy,
                        ["<A-m>"] = fb_actions.move,
                        ["<C-d>"] = fb_actions.remove,
                        ["<C-f>"] = fb_actions.toggle_browser,
                        ["<C-h>"] = fb_actions.toggle_hidden,
                    },
                    n = { ["<C-t>"] = trouble.open_with_trouble },
                },
            },
        }
        require("telescope").load_extension "file_browser"
        require("telescope").load_extension "ui-select"
        require("telescope").load_extension "notify"
    end,
}
