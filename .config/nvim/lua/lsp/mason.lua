return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    'williamboman/mason.nvim',
  },
  config = function()
    require('mason').setup {
      ui = {
        border = 'rounded',
      },
    }
    local mason_lspconfig = require 'mason-lspconfig'

    mason_lspconfig.setup {
      ensure_installed = require('lsp.servers').server_list,
    }
  end,
}
