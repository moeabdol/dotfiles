return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		-- Project-aware linter selection
		local function get_linters(ft)
			local linters = {
				css = { "stylelint" },
				scss = { "stylelint" },
				sass = { "stylelint" },
				bash = { "shellcheck" },
				yaml = { "yamllint" },
				go = { "golangcilint" },
			}

			return linters[ft] or {}
		end

		lint.linters_by_ft = {}

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
				local ft = vim.bo.filetype
				local linters = get_linters(ft)
				if #linters > 0 then
					lint.try_lint(linters)
				end
			end,
		})
	end,
}
