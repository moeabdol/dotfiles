return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"L3MON4D3/LuaSnip",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,popup,preview,noinsert,noselect",
			},
			preselect = cmp.PreselectMode.None,
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.scroll_docs(4),
				["<C-k>"] = cmp.mapping.scroll_docs(-4),
				["<C-space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				-- ["<CR>"] = cmp.mapping(function(fallback)
				-- 	if cmp.visible() then
				-- 		if luasnip.expandable() then
				-- 			luasnip.expand()
				-- 		else
				-- 			cmp.confirm({
				-- 				select = true,
				-- 			})
				-- 		end
				-- 	else
				-- 		fallback()
				-- 	end
				-- end),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.locally_jumpable(1) then
						luasnip.jump(1)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sorting = {
				comparators = {
					cmp.config.compare.offset,
					cmp.config.compare.exact,
					cmp.config.compare.score,
					function(entry1, entry2) -- Alphabetical order
						local result = vim.stricmp(entry1.completion_item.label, entry2.completion_item.label)
						if result < 0 then
							return true
						end
					end,
					-- cmp.config.compare.kind,
					-- cmp.config.compare.sort_text,
					-- cmp.config.compare.length,
					-- cmp.config.compare.order,
				},
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			},
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 100,
					ellipsis_char = "...",
				}),
			},
		})
	end,
}
