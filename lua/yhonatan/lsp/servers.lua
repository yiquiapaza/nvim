local lsp_attach = require("yhonatan.lsp.attach")

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
	["volar"] = default,
	["lua_ls"] = function()
		return {
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
	["marksman"] = default,
	["pyright"] = default,
	["html"] = function()
		local config = {
			on_attach = lsp_attach,
			flags = lsp_flags,
		}
		if vim.fn.executable("html-languageserver") == 1 then
			config.cmd = { "html-languageserver", "--stdio" }
		end
		return config
	end,
	["jsonls"] = function()
		local config = {
			on_attach = lsp_attach,
			flags = lsp_flags,
		}
		if vim.fn.executable("json-languageserver") == 1 then
			config.cmd = { "json-languageserver", "--stdio" }
		end
		return config
	end,
	["gopls"] = function()
		return {
			on_attach = lsp_attach,
			flags = lsp_flags,
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
			filetype = { "html" },
		}
	end,
	["tsserver"] = function()
		return {
			on_attach = lsp_attach,
			flags = lsp_flags,
			settings = {
				typescript = {
					inlayHints = {
						includeInlayParameterNameHints = "all",
						includeInlayParameterNameHitsWhenArgumentMatchesName = false,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayVariableTypeHints = true,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
						includeInlayEnumMemberValueHints = true,
					},
				},
				javascript = {
					inlayHints = {
						includeInlayParameterNameHints = "all",
						includeInlayParameterNameHitsWhenArgumentMatchesName = false,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayVariableTypeHints = true,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
						includeInlayEnumMemberValueHints = true,
					},
				},
			},
		}
	end,
	["zls"] = function()
		return {
			on_attach = lsp_attach,
			flags = lsp_flags,
		}
	end,
}
