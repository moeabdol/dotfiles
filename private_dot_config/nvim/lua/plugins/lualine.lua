return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")
		lualine.setup({
			options = {
				theme = "auto",
			},
			sections = {
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {
					{ "filename", path = 1, color = { fg = "#c0caf5", gui = "bold" } },
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{
						"lsp_status",
						icon = "",
						symbols = {
							spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
							done = "",
							separator = " ",
						},
						ignore_lsp = { "emmet_ls", "eslint" },
					},
					{ "searchcount" },
					{
						"encoding",
						cond = function()
							return vim.bo.fileencoding ~= "utf-8" and vim.bo.fileencoding ~= ""
						end,
					},
					{
						"fileformat",
						cond = function()
							return vim.bo.fileformat ~= "unix"
						end,
					},
					{ "filetype" },
				},
			},
			inactive_sections = {
				lualine_c = { { "filename", path = 1 } },
			},
		})
	end,
}
