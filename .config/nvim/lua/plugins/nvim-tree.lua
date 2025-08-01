return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local nvimtree = require("nvim-tree")
		local api = require("nvim-tree.api")

		-- Recommended settings from nvim-tree docs
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			view = {
				side = "left",
				width = 30,
			},
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = " ",
							arrow_open = " ",
						},
					},
				},
			},
			actions = {
				open_file = {
					resize_window = true,
					window_picker = {
						enable = true,
					},
				},
			},
			filters = {
				custom = { ".DS_Store" },
			},
			git = {
				ignore = false,
			},
		})

		-- Keymaps
		local keymap = vim.keymap
		keymap.set("n", "<leader><space>", api.tree.toggle, { desc = "Toggle file explorer" })
		keymap.set("n", "<C-s>", api.node.open.horizontal, { desc = "Open horizontal split" })
	end,
}
