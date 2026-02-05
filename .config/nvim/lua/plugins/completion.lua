return {
	{
		'hrsh7th/nvim-cmp',
		event='InsertEnter',
		dependencies={
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
		},
		opts = function()
			local ls = require'luasnip'
			local cmp = require'cmp'

			return {
				snippet= {
					expand = function(args) ls.lsp_expand(args.body) end
				},
				mapping= cmp.mapping.preset.insert{
					['<TAB>']= cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif ls.expand_or_jumpable() then
							ls.expand_or_jump()
							vim.snippet.jump(1)
						else
							fallback()
						end
					end, {'i', 's'}),
					['<S-TAB>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif ls.jumpable(-1) then
							ls.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
					['<CR>']= cmp.mapping(function(fallback)
						if cmp.visible() then
							if ls.expandable() then
								ls.expand()
							else
								cmp.confirm({
									select = true,
								})
							end
						else
							fallback()
						end
					end)
				},
				sources= {
					{ name = "nvim_lsp" },
					{ name = "path" },
					{ name = 'luasnip'}
				}
			}
		end
	}
}
