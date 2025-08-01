return {
	"L3MON4D3/LuaSnip",
	dependencies = { "rafamadriz/friendly-snippets" },
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
	config = function()
		local luasnip = require("luasnip")
		local keymap = vim.keymap

		require("luasnip.loaders.from_vscode").lazy_load()

		keymap.set({ "i", "s" }, "<C-n>", function()
			luasnip.jump(1)
		end, { silent = true })
		keymap.set({ "i", "s" }, "<C-p>", function()
			luasnip.jump(-1)
		end, { silent = true })
	end,
}
