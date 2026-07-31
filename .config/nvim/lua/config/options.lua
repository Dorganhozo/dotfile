local opt = vim.opt
opt.path:append'**'
opt.cursorcolumn=false
opt.cursorline=true
opt.relativenumber=true
opt.number=true
opt.mouse='niv'
-- opt.eventignore:append'MenuPopup'

vim.cmd.colorscheme'gruvbox'
