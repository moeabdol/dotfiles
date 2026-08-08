vim.g.mapleader = ","
vim.g.maplocalleader = ","

local keymap = vim.keymap

keymap.set("n", "<space>", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "n", "nzz", { desc = "Next search result" })
keymap.set("n", "N", "Nzz", { desc = "Previous search result" })
keymap.set("n", "*", "*zz", { desc = "Search next for word under cursor" })
keymap.set("n", "#", "#zz", { desc = "Search previous for word under cursor" })
keymap.set("n", "<leader>o", "o<esc>k$", { desc = "Add line below" })
keymap.set("n", "<leader>O", "O<esc>j$", { desc = "Add line above" })
keymap.set("i", "<C-o>zz", "<C-o>zz", { noremap = true, silent = true })
keymap.set("i", "<C-o>zt", "<C-o>zt", { noremap = true, silent = true })
keymap.set("i", "<C-o>zb", "<C-o>zb", { noremap = true, silent = true })
keymap.set("n", "<leader>q", function()
	require("quicker").toggle({ min_height = 8, max_height = 12 })
end, { desc = "Toggle quickfix" })
keymap.set("n", "<leader>l", function()
	require("quicker").toggle({ loclist = true })
end, { desc = "Toggle loclist" })
keymap.set("n", "]q", "<cmd>cnext<CR>zz", { desc = "Next quickfix entry" })
keymap.set("n", "[q", "<cmd>cprev<CR>zz", { desc = "Previous quickfix entry" })
keymap.set("n", "<leader>B", "<cmd>%bd|e#|bd#<CR>", { desc = "Delete all buffers except current" })
