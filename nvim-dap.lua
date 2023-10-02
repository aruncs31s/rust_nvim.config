-- require https://romangeber.com/blog/tech/nvim_rust_debugger
local dap = require("dap")

dap.adapters.lldb = {
	type = "executable",
	command = "/usr/bin/lldb-vscode", -- adjust as needed
	name = "lldb",
}

dap.configurations.c = {
	{
		name = "rust-debug",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.getcwd() .. "/target/debug/<project-name>"
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
	},
}
