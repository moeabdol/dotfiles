return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	cmd = "Trouble",
	keys = {
		{ "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Toggle trouble list" },
		{
			"<leader>xb",
			"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
			desc = "Toggle trouble buffer diagnostics list",
		},
		{ "<leader>xq", "<cmd>Trouble qflist toggle<CR>", desc = "Toggle trouble in quickfix list" },
		{ "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Toggle trouble in local list" },
	},
}
