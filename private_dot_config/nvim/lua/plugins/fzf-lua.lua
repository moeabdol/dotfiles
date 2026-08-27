return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local fzf = require("fzf-lua")

		fzf.setup({
			"default",
			files = {
				prompt = "file> ",
				cmd = os.getenv("FZF_DEFAULT_COMMAND"),
			},
			grep = {
				prompt = "rg> ",
				rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e",
			},
			winopts = {
				height = 0.85,
				width = 0.95,
				preview = {
					layout = "horizontal",
					horizontal = "right:50%",
				},
			},
			keymap = {
				fzf = {
					["ctrl-q"] = "select-all+accept", -- send results to quickfix
				},
			},
		})

		-- code actions / vim.ui.select through fzf-lua
		fzf.register_ui_select()

		-- Keymaps (ported from telescope)
		local keymap = vim.keymap
		keymap.set("n", "<C-p>", fzf.files, { desc = "Find files" })
		keymap.set("n", "<C-x>", fzf.live_grep, { desc = "Live grep" })
		keymap.set("n", "<C-t>", fzf.resume, { desc = "Resume last picker" })
		keymap.set("n", "<leader>b", fzf.buffers, { desc = "Find open buffers" })
		keymap.set("n", "<leader>t", "<cmd>TodoFzfLua<CR>", { desc = "Find todo comments" })
		keymap.set("n", "<leader><BS>", fzf.lsp_document_symbols, { desc = "Document symbols" })
	end,
}
