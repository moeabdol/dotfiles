return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd("colorscheme tokyonight-night")
		vim.cmd("highlight ColorColumn guibg=#292E42")
	end,
}
