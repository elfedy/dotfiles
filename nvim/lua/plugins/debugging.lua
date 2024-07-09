return {
	'mfussenegger/nvim-dap',
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio"
	},
	config = function()
		require("dapui").setup()

		local dap = require("dap")
		local dapui = require("dapui")


		-- Open/Close dapui panes on specific events
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- Keymaps

		-- Set breakpoints, get variable values, step into/out of functions, etc.
		vim.keymap.set("n", "<leader>dl", require("dap.ui.widgets").hover)
		vim.keymap.set("n", "<leader>dc", dap.continue)
		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
		vim.keymap.set("n", "<leader>dn", dap.step_over)
		vim.keymap.set("n", "<leader>di", dap.step_into)
		vim.keymap.set("n", "<leader>do", dap.step_out)
		vim.keymap.set("n", "<leader>dC", function()
			dap.clear_breakpoints()
			require("notify")("Breakpoints cleared", "warn")
		end)
		-- Close debugger and clear breakpoints
		vim.keymap.set("n", "<leader>de", function()
			dap.clear_breakpoints()
			dapui.toggle({})
			dap.terminate()
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false)
			require("notify")("Debugger session ended", "warn")
		end)

		-- Adapters

		dap.adapters.lldb = {
			type = 'executable',
			command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
			name = 'lldb'
		}
		dap.configurations.cpp = {
			{
				name = 'Launch',
				type = 'lldb',
				request = 'launch',
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				cwd = '${workspaceFolder}',
				stopOnEntry = false,
				args = {},
			},
		}
		dap.configurations.rust = dap.configurations.cpp
	end
}
