return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    { "antosha417/nvim-lsp-file-operations", config = true },
    {
      "SmiteshP/nvim-navbuddy",
      dependencies = {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim"
      },
      opts = { lsp = { auto_attach = true } }
    }, 'folke/neodev.nvim',
  },
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

      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })
    end

    require('mason').setup {
      ui = { border = "rounded" }
    }

    local servers = {
      gopls = {},
      rust_analyzer = { check = { command = "clippy" } },
      volar = { filetypes = { 'vue' } },
      html = { filetypes = { 'html' } },
      clangd = { filetypes = { 'c++', 'cpp', 'hpp' } },
      -- tsserver = { filetypes = { 'tsx', 'ts', 'vue', 'typescript' } },
      omnisharp = { filetypes = { 'cs', 'csharp', 'c#' } },

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

    local lspconfig = require 'lspconfig'

    mason_lspconfig.setup_handlers {
      function(server_name)
        lspconfig[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        }
      end,
    }

    lspconfig.eslint.setup({
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
