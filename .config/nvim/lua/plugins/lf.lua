return {
	"lmburns/lf.nvim",
	config = function()
		vim.g.lf_netrw = 1
		local fn = vim.fn

		require("lf").setup({
			default_action = "drop", -- default action when `Lf` opens a file
			default_actions = { -- default action keybindings
				["<C-t>"] = "tabedit",
				["<C-s>"] = "split",
				["<C-v>"] = "vsplit",
				-- ["<C-o>"] = "tab drop",
				["<C-o>"] = "e",
			},

			winblend = 0,
			dir = "", -- directory where `lf` starts ('gwd' is git-working-directory, ""/nil is CWD)
			direction = "float", -- window type: float horizontal vertical
			border = "rounded",
			height = fn.float2nr(fn.round(0.90 * vim.o.lines)), -- height of the *floating* window
			width = fn.float2nr(fn.round(0.95 * vim.o.columns)), -- width of the *floating* window
			escape_quit = true, -- map escape to the quit command (so it doesn't go into a meta normal mode)
			focus_on_open = true, -- focus the current file when opening Lf (experimental)
			mappings = true, -- whether terminal buffer mapping is enabled
			tmux = false, -- tmux statusline can be disabled on opening of Lf
			default_file_manager = false, -- make lf default file manager
			disable_netrw_warning = true, -- don't display a message when opening a directory with `default_file_manager` as true
		})

		vim.keymap.set("n", "<leader>f", "<Cmd>Lf<CR>")

		-- vim.api.nvim_create_autocmd({
		-- 	event = "User",
		-- 	pattern = "LfTermEnter",
		-- 	callback = function(a)
		-- 		vim.api.nvim_buf_set_keymap(a.buf, "t", "q", "q", { nowait = true })
		-- 	end,
		-- })
	end,
	requires = { "toggleterm.nvim" },
}
