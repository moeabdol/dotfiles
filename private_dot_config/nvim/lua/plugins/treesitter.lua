return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false, -- main branch doesn't support lazy-loading
	build = ":TSUpdate",
	dependencies = {},
	config = function()
		require("nvim-treesitter").setup({
			install_dir = vim.fn.stdpath("data") .. "/site",
		})

		-- Install parsers (only installs missing ones, won't reinstall existing)
		local ensure_installed = {
			"json",
			"javascript",
			"typescript",
			"tsx",
			"yaml",
			"toml",
			"html",
			"css",
			"scss",
			"markdown",
			"markdown_inline",
			"bash",
			"lua",
			"vim",
			"dockerfile",
			"gitignore",
			"vimdoc",
			"c",
			"cpp",
			"go",
			"sql",
			"csv",
			"tsv",
			"python",
			"xml",
		}

		local installed = require("nvim-treesitter.config").get_installed()
		local to_install = vim.iter(ensure_installed)
			:filter(function(p)
				return not vim.tbl_contains(installed, p)
			end)
			:totable()

		if #to_install > 0 then
			require("nvim-treesitter").install(to_install)
		end

		-- Enable highlighting and indentation per buffer
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				-- Skip filetypes without a parser
				if not pcall(vim.treesitter.start, args.buf) then
					return
				end
				-- Treesitter-based indentation
				vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
