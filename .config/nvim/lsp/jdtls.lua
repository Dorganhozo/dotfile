local workspace_path = '~/.cache/jdtls/workspaces/'
local jdtls_path = '~/.local/share/language-servers/jdt-language-server/'
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.expand(workspace_path) .. project_name

local root_markers = {'gradlew', '.git', 'mvnw', 'Makefile'}


vim.api.nvim_create_user_command("WipeCacheAndRestart", function ()
	if vim.fn.isdirectory(workspace_dir) == 0 then
		vim.notify("Project workspace isn't exists", vim.log.levels.INFO, {})
		return
	end

	local function delete_and_restart()
		local client = {}

		for _, value in ipairs(vim.lsp.get_clients{name = "jdtls", bufnr = vim.api.nvim_get_current_buf()}) do
			if value then
				client = value
				break
			end
		end

		if not client.stop then
			if not vim.bo.filetype == "java" or not vim.bo.modifiable then
				return
			end

			vim.notify("Jdtls did not initialze in this Workspace", vim.log.levels.INFO, {})
			return
		end

		local bufs = vim.tbl_keys(client.attached_buffers or {})
		client:stop()

		 local miliseconds = 30 * 1000
		 vim.wait(miliseconds, function ()
		 	return vim.lsp.get_client_by_id(client.id) == nil
		 end)


		vim.fn.delete(workspace_dir, 'rf')

		local client_id
		if vim.bo.filetype == "java" then
			client_id = vim.lsp.start(client.config)
		end

		if client_id then
			for  _, buf in ipairs(bufs) do
				vim.lsp.buf_attach_client(buf, client_id)
			end
		end
	end

	vim.ui.select({'Yes', 'No'}, {prompt = 'Are you sure?'}, function (item, _)
		if item ~= 'Yes' then
			return
		end

		vim.schedule(delete_and_restart)

	end)



end, {})

return {
	name = 'jdtls',
	filetypes = {'java'},
	root_markers = root_markers,
	settings = {
		java = {
			configuration = {
				runtimes = {
					{
						name = "JavaSE-17",
						path = "/usr/lib/jvm/java-17-openjdk-i386"
					}
				}
			},

			import = {
				gradle = {
					enabled = true
				}
			}
		}
	},
	cmd = {
		'java',
		'-Declipse.application=org.eclipse.jdt.ls.core.id1',
		'-Dosgi.bundles.defaultStartLevel=4',
		'-Declipse.product=org.eclipse.jdt.ls.core.product',
		'-Dlog.protocol=true',
		'-Dlog.level=ALL',
		'-Xmx1g',
		'--add-modules=ALL-SYSTEM',
		'--add-opens', 'java.base/java.util=ALL-UNNAMED',
		'--add-opens', 'java.base/java.lang=ALL-UNNAMED',
		'-jar', vim.fn.expand(jdtls_path .. 'plugins/org.eclipse.equinox.launcher_*.jar'),
		'-configuration', vim.fn.expand(jdtls_path .. 'config_linux'),
		'-data', workspace_dir,
		'-Xms800m',
		'-Xmx1g'
	}

}
