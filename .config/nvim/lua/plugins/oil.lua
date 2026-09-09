return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
	  float={
		  -- border=''
		padding = 2,
		border='single'
	  },
	  keymaps = {
		["<ESC>"] = {"actions.close", opts={exit_if_last_buf = true}},
		["q"] = {"actions.close", opts={exit_if_last_buf=true}}
	  }
  },
  -- Optional dependencies
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
