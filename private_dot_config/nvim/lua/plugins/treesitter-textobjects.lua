return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	branch = "main",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("nvim-treesitter-textobjects").setup({
			select = {
				lookahead = true, -- jump forward to nearest textobj if cursor isn't inside one
			},
			move = {
				set_jumps = true, -- movements land in the jumplist, so <C-o> works
			},
		})

		local select = require("nvim-treesitter-textobjects.select")
		local move = require("nvim-treesitter-textobjects.move")
		local swap = require("nvim-treesitter-textobjects.swap")

		-- SELECT: use with d, c, y, v — e.g. daf, cia, vif
		local function sel(lhs, query, desc)
			vim.keymap.set({ "x", "o" }, lhs, function()
				select.select_textobject(query, "textobjects")
			end, { desc = desc })
		end
		sel("af", "@function.outer", "around function")
		sel("if", "@function.inner", "inside function")
		sel("aa", "@parameter.outer", "around argument")
		sel("ia", "@parameter.inner", "inside argument")
		sel("ac", "@class.outer", "around class/struct")
		sel("ic", "@class.inner", "inside class/struct")

		-- MOVE: structural jumps
		local function mov(lhs, fn, query, desc)
			vim.keymap.set({ "n", "x", "o" }, lhs, function()
				move[fn](query, "textobjects")
			end, { desc = desc })
		end
		mov("]f", "goto_next_start", "@function.outer", "Next function")
		mov("[f", "goto_previous_start", "@function.outer", "Previous function")
		mov("]c", "goto_next_start", "@class.outer", "Next class/struct")
		mov("[c", "goto_previous_start", "@class.outer", "Previous class/struct")

		-- SWAP: reorder arguments
		vim.keymap.set("n", "<leader>a", function()
			swap.swap_next("@parameter.inner")
		end, { desc = "Swap argument with next" })
		vim.keymap.set("n", "<leader>A", function()
			swap.swap_previous("@parameter.inner")
		end, { desc = "Swap argument with previous" })
	end,
}
