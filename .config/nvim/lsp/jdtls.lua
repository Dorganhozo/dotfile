local workspace_path = '~/.cache/jdtls/workspaces/'
local jdtls_path = '~/.local/share/language-servers/jdt-language-server/'
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.expand(workspace_path) .. project_name

local root_markers = {'gradlew', '.git', 'mvnw', 'Makefile'}

return {
	name = 'jdtls',
	filetypes = {'java'},
	root_markers = root_markers,
	settings = {
		java = {
			configuration = {
				runtimes = {
					{
						name = "JavaSE-21",
						path = "/data/data/com.termux/files/usr/lib/jvm/java-21-openjdk/"
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
		'-jar', vim.fn.expand(jdtls_path .. 'plugins/org.eclipse.equinox.launcher_*.jar'), '-configuration', vim.fn.expand(jdtls_path .. 'config_linux'),
		'-data', workspace_dir,
		'-Xms800m',
		'-Xmx1g'
	}

}
