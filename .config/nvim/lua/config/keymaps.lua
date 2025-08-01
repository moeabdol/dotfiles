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
