# Personal configuration

This is my personal configuration for NVIM with lua.


## Typescript and VueJS configuration

We need to install these packages to configure our custom nvim

```console

npm install -g typescript typescript-language-server
npm install -g vim-language-server
```

## Astro configuration

```console
npm install -g @astrojs/language-server

```

Configuration [link](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#angularls)

## VueJS configuration

We use the Non-hybrid configuration

```console
npm install -g @vue/language-server
```

```lua
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

```

