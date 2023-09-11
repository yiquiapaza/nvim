-- Local Functions
--local function open_nvim_tree()
-- open the tree
--  require("nvim-tree.api").tree.open()
--end
-- Event loop fucntions
--
vim.api.nvim_create_autocmd({ "VimResized" }, {
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	pattern = { "*" },
	command = ":Alpha<CR>",
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"qf",
		"help",
		"man",
		"notify",
		"lspinfo",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"PlenaryTestPopup",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "gitcommit", "markdown", "NeogitCommitMessage" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	callback = function()
		vim.cmd([[%s/\s\+$//e]])
	end,
})
