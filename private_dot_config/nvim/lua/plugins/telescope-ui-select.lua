return {
	"nvim-telescope/telescope-ui-select.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	event = "VeryLazy",
	config = function()
		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({
						previewer = false,
					}),
				},
			},
		})
		require("telescope").load_extension("ui-select")
	end,
}
