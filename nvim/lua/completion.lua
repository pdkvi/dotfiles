local cmp = require('cmp')

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(4),
		['<C-f>'] = cmp.mapping.scroll_docs(-4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<Tab>'] = cmp.mapping.select_next_item(),
		['<S-Tab>'] = cmp.mapping.select_prev_item(),
		['<CR>'] = cmp.mapping.confirm({ select = false })
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' }
	})
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

lspconfig.clangd.setup({
	capabilities = capabilities
})

lspconfig.cmake.setup({
	capabilities = capabilities
})

lspconfig.sumneko_lua.setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
})
