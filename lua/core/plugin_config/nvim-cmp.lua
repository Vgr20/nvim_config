local cmp = require('cmp')
cmp.setup({
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- You can replace this with LuaSnip
    end,
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping.select_prev_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' }, -- LSP-based completions
    { name = 'buffer' },   -- Text in buffer
  },
})
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').pyright.setup { capabilities = capabilities }

