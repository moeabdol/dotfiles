return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup()

		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({
			cmd = "lazygit",
			direction = "float",
			hidden = true,
			float_opts = {
				border = "none",
				width = function()
					return vim.o.columns
				end,
				height = function()
					return vim.o.lines
				end,
			},
			on_open = function()
				vim.cmd("startinsert!")
			end,
		})
		vim.keymap.set("n", "<leader>gg", function()
			lazygit:toggle()
		end, { desc = "Lazygit" })
	end,
}
