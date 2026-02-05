return {
	{
		'sphamba/smear-cursor.nvim',
		opts = {
			stiffness = 0.8,
			trailing_stiffness = 0.5,
			distance_stop_animating = 0.5
		}

	},
	{
		'ellisonleao/gruvbox.nvim',
		priority = 1000,
		config = true,
		opts={}
	},
	{
		'uga-rosa/ccc.nvim',
		opts={
			highlighter={
				auto_enable = true,
				lsp = true
			}
		}
	}
}
