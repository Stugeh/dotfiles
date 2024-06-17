local servers = require("lsp.servers")

local masonConf = {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim'
  },

  config = function()
    require('mason').setup { ui = { border = 'rounded', }, }
    require 'mason-lspconfig'.setup { ensure_installed = servers.ensure_installed, }
    require 'mason-tool-installer'.setup { ensure_installed = servers.lint_fmt }
  end,
}

local lspConf = {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'folke/lazydev.nvim',
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true }
  },

  config = function()
    local lspconfig = require "lspconfig"
    local mason_lspconfig = require "mason-lspconfig"
    local cmp_nvim_lsp = require "cmp_nvim_lsp"

    -- vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
    -- vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })

    local telescope = require('telescope.builtin')

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConf", {}),
      callback = function(e)
        local nmap = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = e.buf, desc = desc })
        end

        nmap('gd', telescope.lsp_definitions, 'Definition')
        nmap('gr', telescope.lsp_references, 'References')
        nmap('gi', telescope.lsp_implementations, 'Implementation')
        nmap('gt', telescope.lsp_type_definitions, 'Type')
        nmap('<leader>ss', telescope.lsp_dynamic_workspace_symbols, 'Search symbols')
        nmap('<leader>rn', vim.lsp.buf.rename, 'Rename')
        nmap('<leader>la', vim.lsp.buf.code_action, 'Code actions')
        nmap('K', vim.lsp.buf.hover, 'Hover Documentation')

        nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

        local client = vim.lsp.get_client_by_id(e.data.client_id)
        if client.server_capabilities.inlayHintProvider then
          vim.lsp.inlay_hint.enable()
        end
      end

    })

    local common_capabilities = cmp_nvim_lsp.default_capabilities()
    common_capabilities.textDocument.completion.completionItem.snippetSupport = true

    require('lspconfig.ui.windows').default_options.border = 'rounded'

    mason_lspconfig.setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = common_capabilities,
        })
      end
    })
  end
}

local conformConf = {
  'stevearc/conform.nvim',
  event = { 'BufWritePre', 'BufNewFile' },
  config = function()
    local conform = require 'conform'
    conform.setup {
      formatters_by_ft = servers.fmt_by_language,
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 2000,
      }
    }
  end,
}
local nvim_lintConf = {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require 'lint'
    lint.linters_by_ft = servers.linters_by_language
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end
    })
  end,
}

local clangdConf = {
  'p00f/clangd_extensions.nvim',
  config = function()
    vim.keymap.set('n', '<leader>gs', '<cmd>ClangdSwitchSourceHeader<CR>', { noremap = true, silent = true })
    require('clangd_extensions').setup {
      inlay_hints = {
        inline = true,
        only_current_line = false,
        only_current_line_autocmd = { 'CursorHold' },
        show_parameter_hints = true,
        parameter_hints_prefix = '<- ',
        other_hints_prefix = '=> ',
        max_len_align = false,
        max_len_align_padding = 1,
        right_align = false,
        right_align_padding = 7,
        highlight = 'Comment',
        priority = 100,
      },
    }
  end,
}

return { masonConf, lspConf, conformConf, clangdConf, nvim_lintConf }
