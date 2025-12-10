return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && npm install",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	ft = { "markdown" },
	config = function()
		vim.g.mkdp_auto_start = 0 -- don't start automatically
		vim.g.mkdp_auto_close = 0
		vim.g.mkdp_refresh_slow = 0
		vim.g.mkdp_open_to_the_world = 0
		vim.g.mkdp_browser = "brave" -- or "chromium", etc.
		vim.g.mkdp_markdown_css = vim.fn.expand("~/.config/nvim/markdown.css")
	end,
}
