return {
	"sindrets/diffview.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose" },
	keys = {
		{ "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Diff working tree" },
		{ "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", desc = "File history (current file)" },
		{ "<leader>gH", "<cmd>DiffviewFileHistory<CR>", desc = "Repo history" },
	},
	opts = {
		keymaps = {
			file_panel = {
				{ "n", "q", "<cmd>DiffviewClose<CR>", { desc = "Close diffview" } },
				{ "n", "<leader><space>", "<cmd>DiffviewToggleFiles<CR>", { desc = "Toggle file panel" } },
			},
			file_history_panel = {
				{ "n", "q", "<cmd>DiffviewClose<CR>", { desc = "Close diffview" } },
				{ "n", "<leader><space>", "<cmd>DiffviewToggleFiles<CR>", { desc = "Toggle file panel" } },
			},
			view = {
				{ "n", "q", "<cmd>DiffviewClose<CR>", { desc = "Close diffview" } },
				{ "n", "<leader><space>", "<cmd>DiffviewToggleFiles<CR>", { desc = "Toggle file panel" } },
			},
		},
		hooks = {
			view_opened = function()
				vim.o.showtabline = 0
			end,
			view_closed = function()
				vim.o.showtabline = 1
				-- your existing buffer cleanup:
				for _, buf in ipairs(vim.api.nvim_list_bufs()) do
					if vim.api.nvim_buf_is_valid(buf) then
						local name = vim.api.nvim_buf_get_name(buf)
						if name:match("^diffview://") then
							vim.api.nvim_buf_delete(buf, { force = true })
						end
					end
				end
			end,
		},
	},
}
