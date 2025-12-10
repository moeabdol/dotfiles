return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			css = { "stylelint" },
			scss = { "stylelint" },
			sass = { "stylelint" },
			yaml = { "yamllint" },
			python = { "pylint" },
			go = { "golangcilint" },
		}

		-- Pylint virtualenv aware
		lint.linters.pylint.cmd = "python"
		lint.linters.pylint.args = {
			"-m",
			"pylint",
			"-f",
			"json",
			"--from-stdin",
			function()
				return vim.api.nvim_buf_get_name(0)
			end,
		}

		-- Golangcilint
		lint.linters.golangcilint.cmd = "golangci-lint"
		lint.linters.golangcilint.args = {
			"run",
			"--output.json.path=stdout",
			"--issues-exit-code=0",
			"--show-stats=false",
			function()
				return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h")
			end,
		}

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
