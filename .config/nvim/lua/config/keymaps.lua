local wk = require'which-key'
--local dap = require'dap'
local oil = require'oil'

local mapping = {
	{'<leader>e',		oil.toggle_float,		   desc="Explore files" 			},
	{'<leader>f' ,		FzfLua.files, 		 	   desc='Find a file in relative path'		},
	{'<leader>gg',		FzfLua.live_grep,	  	   desc='Search for a file by its content'	},
	{'<leader>b',  		FzfLua.buffers,			   desc='List all buffers'		  	},
	{'<leader>d' ,		FzfLua.lsp_document_diagnostics,   desc='Show local diagnostics'		},
	{'<leader>gd',	        FzfLua.lsp_workspace_diagnostics,  desc='Show all diagnostics'			},
	{'<leader><leader>',    FzfLua.builtin, 		   desc='Fzf-lua builtin commands'		},
	--{'<leader><ENTER>',     ':vsplit|wincmd L|term<CR>|i',   desc='Open a terminal'			},
	-- {'<leader>gm',		':copen<CR>', 		  	   desc='List of found files' 			},
	--{'<F5>',       dap.continue,		desc="Debug continue"		},
	--{'<F10>',      dap.step_over,		desc="Debug over(step over)"	},
	--{'<F11>',      dap.step_into,		desc="Debug into(step into)"	},
	--{'<F12>',      dap.step_out,		desc="Debug out(step out)"	},
	--{'<Leader>b',  dap.toggle_breakpoint,	desc="Debug toggle breakpoint"  },
	--{'<Leader>de', dap.continue,		desc="New/Continue Dap" 	},
}

for _, value in ipairs{'<Left>', '<Right>', '<Up>', '<Down>'} do
	vim.keymap.set({'n', 'v', 'i'}, value, '<Nop>')
end

wk.add(mapping, {})
