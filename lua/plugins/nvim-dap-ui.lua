return {
	"rcarriga/nvim-dap-ui",
	keys = { "<F5>", "<F10>", "<F11>", "<F12>" },
	dependencies = { "mfussenegger/nvim-dap" },
	config = function()
		local dapui = require("dapui")
		dapui.setup({})

		local dap = require("dap")

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end

		dap.listeners.before.event_terminated["dapui_config"] = function()
			print("terminated")
			dapui.close()
		end

		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end
	end,
}
