local ls = require "luasnip"
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require "luasnip.util.types"
local conds = require "luasnip.extras.conditions"
local conds_expand = require "luasnip.extras.conditions.expand"

-- If you're reading this file for the first time, best skip to around line 190
-- where the actual snippet-definitions start.

-- Every unspecified option will be set to the default.
ls.setup {
    history = true,
    -- Update more often, :h events for more info.
    update_events = "TextChanged,TextChangedI",
    -- Snippets aren't automatically removed if their text is deleted.
    -- `delete_check_events` determines on which events (:h events) a check for
    -- deleted snippets is performed.
    -- This can be especially useful when `history` is enabled.
    delete_check_events = "TextChanged",
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { "choiceNode", "Comment" } },
            },
        },
    },
    -- treesitter-hl has 100, use something higher (default is 200).
    ext_base_prio = 300,
    -- minimal increase in priority.
    ext_prio_increase = 1,
    enable_autosnippets = true,
    -- mapping for cutting selected text so it's usable as SELECT_DEDENT,
    -- SELECT_RAW or TM_SELECTED_TEXT (mapped via xmap).
    store_selection_keys = "<Tab>",
    -- luasnip uses this function to get the currently active filetype. This
    -- is the (rather uninteresting) default, but it's possible to use
    -- eg. treesitter for getting the current filetype by setting ft_func to
    -- require("luasnip.extras.filetype_functions").from_cursor (requires
    -- `nvim-treesitter/nvim-treesitter`). This allows correctly resolving
    -- the current filetype in eg. a markdown-code block or `vim.cmd()`.
    ft_func = function()
        return vim.split(vim.bo.filetype, ".", true)
    end,
}

ls.add_snippets("markdown", {
    s(
        {
            trig = "paper note template",
            name = "Research paper's metadata",
            dscr = "Template of header paper, We use it to get all metadata for research paper.",
        },
        fmt(
            [[
            ---
            title: {}
            authors: {}
            DOI: {}
            URL: {}
            year: {}
            event: {}
            tags: {}
            read: {}
            target: {}
            ---

            # The abstract

            {}

            ## Main Idea

            {}

            ## Paper Structure

            {}

            ## Experiment or Use Cases

            {}

            ## Discussions and Conclusions

            {}
        ]],
            {
                i(1, "Title for paper"),
                i(2, "Authors' names"),
                i(3, "Digital Object Identifier"),
                i(4, "Web Source"),
                i(5, "Year of publication"),
                i(6, "[Conference/Journal name, Abbreviation]"),
                i(7, "[Tags Abbreviation]"),
                i(8, "[Number of times this read was paper]"),
                i(9, "[Target of our research]"),
                i(10, "Rewrite the abstract with our words"),
                i(11, "Write the main idea or the proposal for this paper"),
                i(12, "Try to summarize the paper structure with our words"),
                i(13, "Describe the experiment or use cases with our words"),
                i(14, "summarize the discussions with the conclusions with our words"),
            }
        )
    ),
})

ls.add_snippets("markdown", {
    s(
        {
            trig = "paper draft notes",
            name = "Draft Note",
            dscr = "Template draft notes for a research paper",
        },
        fmt(
            [[
            # The proposal

            {}

            ## Use cases or experiment

            {}

            ### Tasks

            {}

            ### Interaction

            {}

            ## References

            {}

            ## Draft Structure

            {}
        ]],
            {
                i(1, "Write a draft with our proposal, try to be short and clear"),
                i(2, "Describe our experiment or use cases and write about that"),
                i(3, "Describe the future tasks that we should implementes in the future"),
                i(4, "Describe the interaction that we gonna do"),
                i(5, "Link the references and write about that"),
                i(6, "Describe our paper structure"),
            }
        )
    ),
})

ls.add_snippets("markdown", {
    s(
        {
            trig = "date",
            name = "Date",
            dscr = "Get date",
        },
        fmt(
            [[
            {}
        ]],
            {
                i(1, "Date: " .. os.date "%n"),
            }
        )
    ),
})

ls.add_snippets("markdown", {
    s(
        {
            trig = "book simple metadata",
            name = "Simple Metadata",
            dscr = "get simple metadata",
        },
        fmt(
            [[
            ---
            book title: {}
            language: {}
            author: {}
            ---
            ]],
            {
                i(1, "Book Title"),
                i(2, "Book Language"),
                i(3, "Book Author"),
            }
        )
    ),
})

ls.add_snippets("markdown", {
    s(
        {
            trig = "Zettelkasten",
            name = "Zettelkasten Notes",
            dscr = "Simple note to use get ideas or get information about a specific field. Use it for paper, book, and other source of information",
        },
        fmt(
            [[
            ---
            Title: {}
            Target: {}
            Source (url, or doi): {}
            Tags: {}
            ---

            # Abstract

            {}

            ## Ideas

            {}
            ]],
            {
                i(1, "Title of paper, book, or other source of information."),
                i(2, "Where are we use this information?. Example conference, or journal."),
                i(3, "What is the source?. Example ieee, acm, etc."),
                i(4, "What is the fields of research."),
                i(5, "A brief summary of the Abstract."),
                i(6, "List the ideas that are important."),
            }
        )
    ),
})
