return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				sass = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				go = { "goimports", "gofumpt", "gofmt", "golines" },
			},
			-- format_on_save = {
			-- 	lsp_format = "fallback",
			-- 	timeout_ms = 500,
			-- },
			format_after_save = function(bufnr)
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return {
					lsp_format = "fallback",
					timeout_ms = 500,
				}
			end,
		})

		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				-- :FormatDisable! disables autoformat for this buffer only
				vim.b.disable_autoformat = true
				vim.notify("Disabled autoformat for buffer")
			else
				-- :FormatDisable disables autoformat globally
				vim.g.disable_autoformat = true
				vim.notify("Disabled autoformat globally")
			end
		end, {
			desc = "Disable autoformat-on-save",
			bang = true, -- allows the ! variant
		})

		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
			vim.notify("Enabled autoformat")
		end, {
			desc = "Re-enable autoformat-on-save",
		})
	end,
}
