return {
    "romgrk/barbar.nvim",
    dependencies = {
        "lewis6991/gitsigns.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        { "<A-,>", ":BufferPrevious<CR>", desc = "Buffer Previous" },
        { "<A-.>", ":BufferNext<CR>", desc = "Buffer Previous" },
        { "<A-1>", ":BufferGoto 1<CR>", desc = "Got to Buffer 1" },
        { "<A-2>", ":BufferGoto 2<CR>", desc = "Go to Buffer 2" },
        { "<A-3>", ":BufferGoto 3<CR>", desc = "Go to Buffer 3" },
        { "<A-4>", ":BufferGoto 4<CR>", desc = "Go to Buffer 4" },
        { "<A-5>", ":BufferGoto 5<CR>", desc = "Go to Buffer 5" },
        { "<A-6>", ":BufferGoto 6<CR>", desc = "Go to Buffer 6" },
        { "<A-7>", ":BufferGoto 7<CR>", desc = "Go to Buffer 7" },
        { "<A-8>", ":BufferGoto 8<CR>", desc = "Go to Buffer 8" },
        { "<A-9>", ":BufferGoto 9<CR>", desc = "Go to Buffer 9" },
        { "<A-0>", ":BufferGoto 0<CR>", desc = "Go to last Buffer" },
        { "<A-p>", ":BufferPin<CR>", desc = "Pin/Unpin Buffer" },
        { "<A-c>", ":BufferClose<CR>", desc = "Close Buffer" },
    },
    init = function()
        vim.g.barbar_auto_setup = false
    end,
    config = function()
        require("barbar").setup {}
    end,
}
