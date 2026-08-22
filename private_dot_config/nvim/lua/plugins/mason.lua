return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"bashls",
				"clangd",
				"gopls",
				"html",
				"lua_ls",
				"emmet_ls",
				"pyright",
				"ruff",
				"vtsls",
				"eslint",
				"postgres_lsp",
				"dockerls",
				"docker_compose_language_service",
				"taplo",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"shfmt",
				"shellcheck",
				"goimports",
				"gofumpt",
				"golangci-lint",
				"golines",
				"stylelint",
				"yamllint",
				"debugpy",
			},
		})
	end,
}
