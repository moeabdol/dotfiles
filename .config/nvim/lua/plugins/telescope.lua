return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
		"benfowler/telescope-luasnip.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					width = 0.95,
					prompt_position = "top",
					preview_width = 0.5,
				},
				mappings = {
					i = {
						["<C-s>"] = function(prompt_bufnr)
							actions.file_split(prompt_bufnr)
						end,
					},
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("luasnip")

		-- Keymaps
		local keymap = vim.keymap

		keymap.set("n", "<C-p>", "<cmd>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<C-x><C-p>", "<cmd>Telescope live_grep<CR>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>b", "<cmd>Telescope buffers<CR>", { desc = "Fuzzy find open buffers" })
		keymap.set("n", "<leader>t", "<cmd>TodoTelescope<CR>", { desc = "Fuzzy find todo comments" })
		keymap.set("n", "<leader>s", "<cmd>Telescope luasnip<CR>", { desc = "Fuzzy find snippets" })
	end,
}
