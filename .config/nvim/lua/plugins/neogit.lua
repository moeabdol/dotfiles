return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration

		-- Only one of these is needed.
		"nvim-telescope/telescope.nvim", -- optional
		"ibhagwan/fzf-lua", -- optional
		"echasnovski/mini.pick", -- optional
	},
	config = function()
		local neogit = require("neogit")
		local keymap = vim.keymap

		keymap.set("n", "<leader>ng", neogit.open, { desc = "Show Neogit" })
	end,
}
