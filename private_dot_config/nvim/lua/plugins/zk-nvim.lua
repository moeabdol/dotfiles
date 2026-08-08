return {
	"zk-org/zk-nvim",
	config = function()
		require("zk").setup({
			picker = "telescope", -- or "telescope" / "fzf_lua" if you use them
		})
	end,
}
