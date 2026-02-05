return {
	cmd = {'lua-language-server'},
	filetypes = {'lua'},
	settings = {
		Lua = {
			runtime = { version = 'LuaJIT' },
			completion = {
				callSnippet = "Replace"
			}
		},
		telemetry = { enable = true }
	}
}
