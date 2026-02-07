local capabilities = require'cmp_nvim_lsp'.default_capabilities()

vim.lsp.config('*', {
	capabilities = capabilities
})

vim.diagnostic.config{
	virtual_lines = false,
	underline = true,
	virtual_text = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		source = true,
		border = 'single'
	}
}

vim.lsp.enable{'jdtls', 'clangd', 'lua_ls'}
