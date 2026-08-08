return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio", -- dap-ui dependency
		"mfussenegger/nvim-dap-python",
	},
	keys = {
		{
			"<F2>",
			function()
				require("dapui").toggle(1)
			end,
			desc = "Debug: toggle side panels",
		},
		{
			"<F3>",
			function()
				require("dapui").toggle(2)
			end,
			desc = "Debug: toggle console/repl",
		},
		{
			"<F4>",
			function()
				require("dapui").toggle()
			end,
			desc = "Debug: toggle all UI",
		},
		{
			"<F5>",
			function()
				require("dap").continue()
			end,
			desc = "Debug: continue/start",
		},
		{
			"<F6>",
			function()
				require("dap").terminate()
			end,
			desc = "Debug: terminate",
		},
		{
			"<F9>",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Toggle breakpoint",
		},
		{
			"<F10>",
			function()
				require("dap").step_over()
			end,
			desc = "Debug: step over",
		},
		{
			"<F11>",
			function()
				require("dap").step_into()
			end,
			desc = "Debug: step into",
		},
		{
			"<F12>",
			function()
				require("dap").step_out()
			end,
			desc = "Debug: step out",
		},
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup({
			layouts = {
				{
					position = "right",
					size = 55,
					elements = {
						{ id = "scopes", size = 0.55 },
						{ id = "watches", size = 0.20 },
						{ id = "stacks", size = 0.25 },
					},
				},
				{
					position = "bottom",
					size = 12,
					elements = {
						{ id = "repl", size = 0.6 },
						{ id = "console", size = 0.4 },
					},
				},
			},
		})

		-- Open/close the UI with the session lifecycle
		dap.listeners.after.event_initialized["dapui"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui"] = function()
			dapui.close()
		end

		-- Python via Mason's debugpy
		require("dap-python").setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")

		-- Breakpoint signs, matching your diagnostic icon style
		vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError" })
		vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DiagnosticWarn", linehl = "CursorLine" })
	end,
}
