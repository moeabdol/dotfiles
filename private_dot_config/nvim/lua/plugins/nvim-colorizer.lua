return {
	"catgoose/nvim-colorizer.lua",
	ft = { "html", "css", "javascript", "typescript" },
	config = function()
		require("colorizer").setup({
			"html",
			"css",
			"javascript",
			"typescript",
		})
	end,
}
