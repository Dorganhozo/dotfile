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
			'ray-x/lsp_signature.nvim',
		},
		opts = function()
			local ls = require'luasnip'
			local cmp = require'cmp'

			require "lsp_signature".setup()
			return {
				snippet= {
					expand = function(args)
						ls.lsp_expand(args.body)
					end
				},
				mapping = cmp.mapping.preset.insert{
					['<TAB>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
							return
						end

						if ls.expand_or_jumpable() then
							ls.expand_or_jump()
							return
						end


						fallback()
					end, {'i', 's'}),
					['<S-TAB>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
							return
						end

						if ls.jumpable(-1) then
							ls.jump(-1)
							return
						end

						fallback()
					end, { "i", "s" }),
					['<CR>'] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true
					}),
					['<C-e>'] = cmp.mapping.close(),
				},
				sources= {
					{ name = "nvim_lsp" },
					{ name = "path" },
					{ name = 'luasnip'},
				}
			}
		end
	}
}
