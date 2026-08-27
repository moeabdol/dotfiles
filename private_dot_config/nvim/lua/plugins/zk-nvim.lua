return {
	"zk-org/zk-nvim",
	config = function()
		require("zk").setup({
			picker = "fzf_lua", -- or "telescope" / "fzf_lua" if you use them
		})
	end,
}
