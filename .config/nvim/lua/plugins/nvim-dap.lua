return {
	--{
	--	'mfussenegger/nvim-dap',
	--	config = function ()
	--		local dap = require'dap'

	--		function dap.listeners.before.attach:repl()
	--			dap.repl.open()
	--		end

	--		function dap.listeners.before.launch:repl()
	--			dap.repl.open()
	--		end

	--		function dap.listeners.before.event_terminated:repl()
	--			dap.repl.close()
	--		end

	--		function dap.listeners.before.event_exited:repl()
	--			dap.repl.close()
	--		end

	--		dap.adapters.gdb = {
	--			id = "gdb",
	--			type = 'executable',
	--			command = 'gdb',
	--			args = {"--quiet", "--interpreter=dap"},
	--		}
	--		dap.configurations.c = {
	--			{
	--				name = "Launch with GDB",
	--				type = "gdb",
	--				request = "launch",
	--				program = function ()
	--					return vim.fn.input({prompt = 'Path to executable: ', completion = 'file'})
	--				end,
	--				args = {},
	--				cwd = "${workspaceFolder}",
	--				stopAtBeginningOfMainSubprogram = false,
	--			},
	--			{
	--				name = 'Attach to process(GDB)',
	--				type = 'gdb',
	--				request = 'attach',
	--				cwd = "${workspaceFolder}",
	--				processId = require'dap.utils'.pick_process,
	--			}
	--		}

	--	end
	--},
}
