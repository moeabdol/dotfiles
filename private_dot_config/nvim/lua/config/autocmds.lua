local augroup = vim.api.nvim_create_augroup("user_autocmds", { clear = true })

-- Indentation: tabs, width 4 (filetypes not formatted by prettier)
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = { "vim", "go", "cpp", "c", "sh", "bash", "sql", "make" },
	callback = function()
		vim.bo.shiftwidth = 4
		vim.bo.tabstop = 4
		vim.bo.expandtab = false
	end,
})

-- Indentation: spaces, width 4
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = { "python" },
	callback = function()
		vim.bo.shiftwidth = 4
		vim.bo.tabstop = 4
		vim.bo.expandtab = true
	end,
})

-- Indentation: spaces, width 2 (prettier-owned filetypes + yaml)
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"css",
		"scss",
		"sass",
		"markdown",
		"json",
		"jsonc",
		"html",
		"yaml",
	},
	callback = function()
		vim.bo.shiftwidth = 2
		vim.bo.tabstop = 2
		vim.bo.expandtab = true
	end,
})

-- Set English spell check on file types
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = { "markdown", "text", "gitcommit" },
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.spelllang = "en_us"
	end,
})

-- Set spelling typo colors after colorscheme is initialized
vim.api.nvim_create_autocmd("ColorScheme", {
	group = augroup,
	callback = function()
		vim.api.nvim_set_hl(0, "SpellBad", { undercurl = true, sp = "#ff0000" })
		vim.api.nvim_set_hl(0, "SpellCap", { undercurl = true, sp = "#ffaa00" })
	end,
})
