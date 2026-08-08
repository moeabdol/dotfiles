return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns
			local keymap = vim.keymap

			keymap.set("n", "]h", gs.next_hunk, { buffer = bufnr, desc = "Next hunk" })
			keymap.set("n", "[h", gs.prev_hunk, { buffer = bufnr, desc = "Previous hunk" })
			keymap.set("n", "<leader>hr", gs.reset_hunk, { buffer = bufnr, desc = "Reset hunk" })

			vim.cmd([[ highlight GitSignsAdd    guifg=green ]])
			vim.cmd([[ highlight GitSignsChange guifg=blue ]])
			vim.cmd([[ highlight GitSignsDelete guifg=red ]])
		end,
	},
}
