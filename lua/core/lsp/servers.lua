local lsp_attach = require "core.lsp.attach"
local mason_registry = require "mason-registry"

local lsp_flags = {
    debounce_text_changes = 150,
}

local default = function()
    return {
        on_attach = lsp_attach,
        flags = lsp_flags,
    }
end

return {
    ["emmet_ls"] = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
        return {
            on_attach = lsp_attach,
            flags = lsp_flags,
            capabilities = capabilities,
            filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "blade", "vue" },
        }
    end,
    ["cssls"] = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
        return {
            on_attach = lsp_attach,
            flags = lsp_flags,
            capabilities = capabilities,
            filetypes = { "css", "scss", "less" },
        }
    end,
    ["volar"] = function()
        return {
            on_attach = lsp_attach,
            flags = lsp_flags,
            init_options = {
                plugins = {
                    {
                        vue = {
                            hybridmode = false,
                        },
                    },
                },
            },
            filetypes = { "vue" },
        }
    end,
    -- function()
    -- return {
    --     on_attach = lsp_attach,
    --     flags = lsp_flags,
    --     init_options = {
    --         vue = {
    --             hybridMode = false,
    --         },
    --     },
    --     settings = {
    --         typescript = {
    --             inlayHints = {
    --                 enumMemberValues = {
    --                     enabled = true,
    --                 },
    --                 functionLikeReturnTypes = {
    --                     enabled = true,
    --                 },
    --                 propertyDeclarationTypes = {
    --                     enabled = true,
    --                 },
    --                 parameterTypes = {
    --                     enabled = true,
    --                     suppressWhenArgumentMatchesName = true,
    --                 },
    --                 variableTypes = {
    --                     enabled = true,
    --                 },
    --             },
    --         },
    --     },
    --     filetypes = { "typescript", "javascript", "vue" },
    -- }
    -- end,
    ["lua_ls"] = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
        return {
            capabilities = capabilities,
            on_attach = lsp_attach,
            flags = lsp_flags,
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT",
                    },
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false,
                    },
                    telemetry = {
                        enable = false,
                    },
                    hit = {
                        enable = true,
                    },
                },
            },
        }
    end,
    ["marksman"] = function()
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true
        local config = {
            on_attach = lsp_attach,
            flags = lsp_flags,
            capabilities = capabilities,
            filetypes = { "markdown" },
        }
        return config
    end,
    ["pyright"] = default,
    ["html"] = function()
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true
        local config = {
            on_attach = lsp_attach,
            flags = lsp_flags,
            capabilities = capabilities,
        }
        if vim.fn.executable "html-language-server" == 1 then
            config.cmd = { "html-language-server", "--stdio" }
        end
        return config
    end,
    ["jsonls"] = function()
        local config = {
            on_attach = lsp_attach,
            flags = lsp_flags,
        }
        if vim.fn.executable "json-languageserver" == 1 then
            config.cmd = { "json-languageserver", "--stdio" }
        end
        return config
    end,
    ["gopls"] = function()
        return {
            on_attach = lsp_attach,
            flags = lsp_flags,
            settings = {
                gopls = {
                    hints = {
                        assignVariableTypes = true,
                        compositeLiteralFields = true,
                        compositeLiteralTypes = true,
                        constantValues = true,
                        functionTypeParameters = true,
                        parameterNames = true,
                        rangeVariableTypes = true,
                    },
                },
            },
        }
    end,
    ["rust_analyzer"] = function()
        return {
            on_attach = lsp_attach,
            flags = lsp_flags,
            settings = {
                ["rust-analyzer"] = {
                    checkOnSave = {
                        allFeatures = true,
                        overrideCommand = {
                            "cargo",
                            "clippy",
                            "--workspace",
                            "message-format=json",
                            "--all-targets",
                            "--all-features",
                        },
                    },
                },
            },
        }
    end,
    ["tailwindcss"] = function()
        return {
            on_attach = lsp_attach,
            flags = lsp_flags,
        }
    end,
    ["ts_ls"] = function()
        -- local vue_language_sever_path = mason_registry.get_package("vue-language-server"):get_install_path()
        --     .. "/home/yhonatan/.nvm/versions/node/v20.18.0/lib/node_modules/@vue/language-server"
        local vue_language_sever_path =
            "/home/yhonatan/.nvm/versions/node/v20.18.0/lib/node_modules/@vue/language-server"
        return {
            on_attach = lsp_attach,
            flags = lsp_flags,
            init_options = {
                plugins = {
                    {
                        name = "@vue/typescript-plugin",
                        location = vue_language_sever_path,
                        languages = { "vue" },
                    },
                },
            },
            -- settings = {
            --     typescript = {
            --         tsserver = {
            --             useSyntaxServer = false,
            --         },
            --         inlayHints = {
            --             includeInlayParameterNameHints = "all",
            --             includeInlayParameterNameHintsWhenArgumentMatchesName = true,
            --             includeInlayFunctionParameterTypeHints = true,
            --             includeInlayVariableTypeHints = true,
            --             includeInlayVariableTypeHintsWhenTypeMatchesName = true,
            --             includeInlayPropertyDeclarationTypeHints = true,
            --             includeInlayFunctionLikeReturnTypeHints = true,
            --             includeInlayEnumMemberValueHints = true,
            --         },
            --     },
            -- },
            filetypes = {
                "vue",
                "javascript",
                "typescript",
            },
        }
    end,
    ["zls"] = function()
        return {
            on_attach = lsp_attach,
            flags = lsp_flags,
        }
    end,
    ["ltex_plus"] = function()
        return {
            on_attach = lsp_attach,
            flags = lsp_flags,
            settings = {
                ltex = {
                    language = "en-GB",
                },
            },
            filetypes = {
                "bib",
                "gitcommit",
                "markdown",
                "org",
                "plaintex",
                "rst",
                "rnoweb",
                "tex",
                "pandoc",
                "md",
            },
        }
    end,
    ["astro"] = function()
        return {
            on_attach = lsp_attach,
            flags = lsp_flags,
            filetypes = {
                "astro",
            },
        }
    end,
    ["eslint"] = function()
        return {
            on_attach = lsp_attach,
            flags = lsp_flags,
            filetypes = {
                "javascript",
                "javascriptreact",
                "javascript.jsx",
                "typescript",
                "typescriptreact",
                "typescript.tsx",
                "vue",
                "svelte",
                "astro",
            },
        }
    end,
    ["kotlin_language_server"] = function()
        return {
            on_attach = lsp_attach,
            flags = lsp_flags,
            filetypes = {
                "kotlin",
            },
        }
    end,
    ["texlab"] = function()
        return {
            on_attach = lsp_attach,
            flags = lsp_flags,
            filetypes = {
                "tex",
                "plaintex",
                "bib",
            },
            settings = {
                texlab = {
                    auxDirectory = ".",
                    bibtexFormatter = "texlab",
                    build = {
                        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
                        executable = "latexmk",
                        forwardSearchAfter = false,
                        onSave = false,
                    },
                    chktex = {
                        onEdit = false,
                        onOpenAndSave = false,
                    },
                    diagnosticsDelay = 300,
                    formatterLineLength = 80,
                    forwardSearch = {
                        args = {},
                    },
                    latexFormatter = "latexindent",
                    latexindent = {
                        modifyLineBreaks = false,
                    },
                },
            },
        }
    end,
    ["ocamllsp"] = function()
        return {
            on_attach = lsp_attach,
            flags = lsp_flags,
            filetypes = {
                "ocaml",
                "menhir",
                "ocamlinterface",
                "ocamllex",
                "reason",
                "dune",
            },
        }
    end,
    ["jdtls"] = function()
        return {
            on_attach = lsp_attach,
            flags = lsp_flags,
        }
    end,
    ["golangci_lint_ls"] = function()
        return {
            on_attach = lsp_attach,
            flags = lsp_flags,
            filetypes = {
                "go",
                "gomod",
            },
        }
    end,
}
