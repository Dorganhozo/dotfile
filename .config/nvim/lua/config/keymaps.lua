local wk = require'which-key'
--local dap = require'dap'

local oil = require'oil'

local mapping = {
	{'<leader>f' ,		'<cmd>FZF<CR>', 		 	   desc='Find a file in relative path'		},
	{'<leader>tf',		':tabf **/', 		  	   desc='Open a new tab with the found file'	},
	{'<leader>d' ,		vim.diagnostic.setloclist, 	   desc='Show local diagnostics'		},
	{'<leader>gd',	        vim.diagnostic.setqflist, 	   desc='Show all diagnostics'			},
	--{'<leader><ENTER>',     ':vsplit|wincmd L|term<CR>|i',	   desc='Open a terminal'			},
	{
		'<leader>e', function ()
			local is_oil = vim.bo.filetype == 'oil'

			if is_oil then
				oil.close()
				return
			end

			oil.open()
		end, desc="Explore files"
	},

	--{'<F5>',       dap.continue,		desc="Debug continue"		},
	--{'<F10>',      dap.step_over,		desc="Debug over(step over)"	},
	--{'<F11>',      dap.step_into,		desc="Debug into(step into)"	},
	--{'<F12>',      dap.step_out,		desc="Debug out(step out)"	},
	--{'<Leader>b',  dap.toggle_breakpoint,	desc="Debug toggle breakpoint"  },
	--{'<Leader>de', dap.continue,		desc="New/Continue Dap" 	},
}

-- for _, value in ipairs{'<Left>', '<Right>', '<Up>', '<Down>'} do
-- 	vim.keymap.set({'n', 'v', 'i'}, value, '<Nop>')
-- end

wk.add(mapping, {})
