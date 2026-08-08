return {
	"nvim-telescope/telescope.nvim",
	branch = "master",
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
					horizontal = {
						width = 0.95,
						prompt_position = "top",
						preview_width = 0.5,
					},
				},
				mappings = {
					i = {
						["<C-s>"] = function(prompt_bufnr)
							actions.file_split(prompt_bufnr)
						end,
						["<C-q>"] = function(prompt_bufnr)
							actions.smart_send_to_qflist(prompt_bufnr)
							require("quicker").open({ min_height = 8, max_height = 12 })
						end,
					},
				},
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
				},
			},
			pickers = {
				find_files = {
					find_command = { "fd", "--type", "f", "--hidden", "--exclude", ".git" },
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("luasnip")

		-- Keymaps
		local keymap = vim.keymap
		keymap.set("n", "<C-p>", "<cmd>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<C-x>", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
		keymap.set("n", "<C-t>", "<cmd>Telescope resume<CR>", { desc = "Resume last picker" })
		keymap.set("n", "<leader>b", "<cmd>Telescope buffers<CR>", { desc = "Fuzzy find open buffers" })
		keymap.set("n", "<leader>t", "<cmd>TodoTelescope<CR>", { desc = "Fuzzy find todo comments" })
		keymap.set("n", "<leader>s", "<cmd>Telescope luasnip<CR>", { desc = "Fuzzy find snippets" })
		keymap.set("n", "<leader><BS>", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Document symbols" })
	end,
}
