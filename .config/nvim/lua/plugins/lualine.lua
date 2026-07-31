return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
	    options={
		    theme='gruvbox-material',
		    component_separators = '',
		    section_separators = ' ',
	    },
	    sections = {
		    lualine_a = {'mode'},
		    lualine_b = {'branch', 'diff'},
		    lualine_c = {'filename'},
		    lualine_x = {{'diagnostics', symbols = {}}, 'lsp_status', 'filetype'},
		    lualine_y = {'progress'},
		    lualine_z = {'location'}
	    }
    }
}
