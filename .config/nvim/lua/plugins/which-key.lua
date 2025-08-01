return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opt = {
		-- Your configurations comes here
	},
	config = function()
		local whichkey = require("which-key")

		whichkey.setup({
			preset = "modern",
		})
	end,
}
