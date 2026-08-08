return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	version = "1.*", -- uses prebuilt fuzzy-matcher binary; no Rust toolchain needed
	dependencies = {
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
		"moyiz/blink-emoji.nvim",
		"Kaiser-Yang/blink-cmp-dictionary",
	},
	opts = {
		keymap = {
			preset = "none",
			["<C-n>"] = { "select_next", "fallback" },
			["<C-p>"] = { "select_prev", "fallback" },
			["<C-j>"] = { "scroll_documentation_down", "fallback" },
			["<C-k>"] = { "scroll_documentation_up", "fallback" },
			["<C-space>"] = { "show", "fallback" },
			["<C-e>"] = { "hide", "fallback" },
			["<CR>"] = { "accept", "fallback" },
			["<Tab>"] = { "snippet_forward", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "fallback" },
		},
		completion = {
			accept = { auto_brackets = { enabled = true } },
			list = {
				selection = { preselect = false, auto_insert = true },
			},
			menu = {
				border = "single",
				draw = {
					columns = {
						{ "kind_icon" },
						{ "label", "label_description", gap = 1 },
						{ "kind" },
					},
					treesitter = { "lsp" },
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
				window = { border = "single" },
			},
		},
		snippets = { preset = "luasnip" },
		sources = {
			default = function()
				local ft = vim.bo.filetype
				if ft == "markdown" or ft == "text" or ft == "gitcommit" then
					return { "lsp", "snippets", "buffer", "path", "emoji", "dictionary" }
				end
				return { "lsp", "snippets", "buffer", "path" }
			end,
			providers = {
				emoji = {
					module = "blink-emoji",
					name = "Emoji",
					score_offset = -10,
				},
				dictionary = {
					module = "blink-cmp-dictionary",
					name = "Dict",
					min_keyword_length = 3,
					score_offset = -10,
					opts = {
						dictionary_files = { "/usr/share/dict/words" },
					},
				},
			},
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
