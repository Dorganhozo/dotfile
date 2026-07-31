vim.api.nvim_create_autocmd("WinLeave", {
	callback = function(args)
		local win_type = vim.api.nvim_get_option_value('buftype', { buf = args.buf })
		if win_type == 'quickfix' then
			vim.cmd('lclose|cclose')
		end
	end,
})
