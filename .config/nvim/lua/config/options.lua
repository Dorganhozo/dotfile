local opt = vim.opt
opt.path:append'**'
opt.cursorcolumn=false
opt.cursorline=true
opt.relativenumber=true
opt.number=true
opt.mouse='niv'
opt.eventignore:append'MenuPopup'

local statusline = {
	"%<",
	"%f ",
	"%h",
	"%w",
	"%m",
	"%r",
	"%=",
	"%{v:lua.lsp_status_text()}",
	"%=",
	"%-",
	"14.(%l,%c%V%) ",
	"%P"
}

vim.o.statusline = table.concat(statusline, "")

local g = vim.g
g.netrw_banner = 0
g.netrw_liststyle = 3
g.netrw_winsize = 20
g.netrw_browse_split = 0

local gitignore = vim.fn['netrw_gitignore#Hide']()

--g.netrw_list_hide = '^\\..*'

if not string.match(gitignore, '^fatal:')  then
	g.netrw_list_hide = gitignore
end
vim.cmd.colorscheme'gruvbox'
