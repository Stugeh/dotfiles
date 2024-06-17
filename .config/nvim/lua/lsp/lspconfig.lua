local M = {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'folke/neodev.nvim',
  },

  on_attach = function(client, bufnr)
    -- set lsp key maps
    local nmap = function(keys, func, desc)
      if desc then
        desc = '' .. desc
      end

      vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    local lspRefs = function()
      require('telescope.builtin').lsp_references { show_line = false }
    end

    local lspDefs = function()
      require('telescope.builtin').lsp_definitions { show_line = false }
    end

    local lspImps = function()
      require('telescope.builtin').lsp_implementations { show_line = false }
    end
    nmap('<leader>rn', vim.lsp.buf.rename, 'Rename')
    nmap('<leader>la', vim.lsp.buf.code_action, 'Code actions')
    nmap('gd', lspDefs, 'Definition')
    nmap('gr', lspRefs, 'References')
    nmap('gi', lspImps, 'Implementation')
    nmap('gt', require('telescope.builtin').lsp_type_definitions, 'Type')
    nmap('<leader>ss', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Search symbols')
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- enable inlay hints if available
    vim.lsp.inlay_hint.enable(true)
  end,
}

function M.common_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return capabilities
end

function M.config()
  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })

  require('lspconfig.ui.windows').default_options.border = 'rounded'

  local server_configs = require('lsp.servers').server_configs

  local lspconfig = require 'lspconfig'

  lspconfig.contextive.setup { on_attach = M.on_attach, capabilities = M.common_capabilities() }

  for server, config in pairs(server_configs) do
    local opts = {
      on_attach = M.on_attach,
      capabilities = M.common_capabilities(),
    }

    if server == 'lua_ls' then
      require('neodev').setup {}
    end

    if type(config) == 'table' then
      opts = vim.tbl_deep_extend('force', config, opts)
    end

    lspconfig[server].setup(opts)
  end
end

return M
