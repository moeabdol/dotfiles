return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	build = function()
		require("lazy").load({ plugins = { "markdown-preview.nvim" } })
		vim.fn["mkdp#util#install"]()
	end,
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
		vim.g.mkdp_auto_start = 0
		vim.g.mkdp_auto_close = 0
		vim.g.mkdp_refresh_slow = 0
		vim.g.mkdp_open_to_the_world = 0
		vim.g.mkdp_browser = "brave"
		vim.g.mkdp_markdown_css = vim.fn.expand("~/.config/nvim/markdown-preview/custom.css")
		vim.g.mkdp_preview_options = {
			disable_sync_scroll = 1,
		}
	end,
}
