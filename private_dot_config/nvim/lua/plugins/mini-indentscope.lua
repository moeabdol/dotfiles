return {
	"nvim-mini/mini.indentscope",
	version = "*",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local indentscope = require("mini.indentscope")
		indentscope.setup({
			symbol = "▏",
			options = { try_as_border = true },
			draw = {
				animation = indentscope.gen_animation.none(),
			},
		})
	end,
}
