vim.api.nvim_create_autocmd("WinLeave", {
	callback = function(args)
		local win_type = vim.api.nvim_get_option_value('buftype', { buf = args.buf })
		if win_type == 'quickfix' then
			vim.cmd('lclose|cclose')
		end
	end,
})

local progress = nil


vim.api.nvim_create_autocmd("LspProgress", {
	callback = function (event)
		local value = event.data.params.value

		if not progress then
			progress = {}
		end

		progress.percentage = value.percentage or "100"
		progress.title = value.title or "Done"
		progress.message = value.message or ""
		progress.client_id = event.data.client_id

		vim.api.nvim__redraw {valid=false}
	end
})

function _G.lsp_status_text()
	if not progress then
		return ""
	end

	if not progress.percentage then
		return "Starting.."
	end

	if progress.percentage == "100" then
		return vim.lsp.get_client_by_id(progress.client_id).name
	end

	return string.format("%s%% - %.20s %.8s", progress.percentage, progress.title, progress.message)
end

