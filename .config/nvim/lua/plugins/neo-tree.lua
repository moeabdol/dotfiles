return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons", -- optional, but recommended
	},
	lazy = false, -- neo-tree will lazily load itself
	config = function()
		require("neo-tree").setup({
			enable_git_status = false,
			enable_modified_markers = true,
			enable_diagnostics = false,
			window = {
				position = "left",
				mappings = {
					["s"] = "",
					["S"] = "",
					["<C-s>"] = "open_split",
					["<C-v>"] = "open_vsplit",
				},
			},
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					hide_by_name = {
						".git",
						".DS_Store",
						"node_modules",
					},
					always_show = {
						".env",
						".gitignore",
						".dockerignore",
					},
				},
			},
		})

		vim.keymap.set("n", "<leader> ", ":Neotree toggle<CR>")
	end,
}
