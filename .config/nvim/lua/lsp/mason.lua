return {
  'williamboman/mason-lspconfig.nvim',
  config = function()
    local on_attach = function(_, bufnr)
      local nmap = function(keys, func, desc)
        if desc then
          desc = '' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end

      nmap('<leader>rn', vim.lsp.buf.rename, 'Rename')
      nmap('<leader>la', vim.lsp.buf.code_action, 'Code actions')
      nmap('gd', require('telescope.builtin').lsp_definitions, 'Definition')
      nmap('gr', require('telescope.builtin').lsp_references, 'References')
      nmap('gi', require('telescope.builtin').lsp_implementations, 'Implementation')
      nmap('gt', require('telescope.builtin').lsp_type_definitions, 'Type')
      nmap('<leader>ss', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Search symbols')
      nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
      nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
      -- Create a command `:Format` local to the LSP buffer
      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })
    end

    require('mason').setup {
      ui = { border = "rounded" }
    }

    local servers = {
      gopls = {},
      -- eslint = {},
      rust_analyzer = { check = { command = "clippy" } },
      volar = { filetypes = { 'vue' } },
      tsserver = { filetypes = { 'tsx', 'ts', 'vue', 'typescript' } },
      omnisharp = { filetypes = { 'cs', 'csharp', 'c#' } },
      html = { filetypes = { 'html', 'twig', 'hbs' } },

      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    }

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    local mason_lspconfig = require 'mason-lspconfig'

    mason_lspconfig.setup {
      ensure_installed = servers,
    }

    mason_lspconfig.setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        }
      end,
    }

    require('lspconfig').eslint.setup({
      --- ...
      on_attach = function(_, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll",
        })
      end,
    })

    require('mason-lspconfig').setup()
  end
}
