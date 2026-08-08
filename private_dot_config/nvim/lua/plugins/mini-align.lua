return {
	"echasnovski/mini.align",
	version = "*",
	keys = {
		{ "ga", mode = { "n", "x" }, desc = "Align" },
		{ "gA", mode = { "n", "x" }, desc = "Align with preview" },
	},
	config = function()
		require("mini.align").setup({})
	end,
}
