return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre', 'BufNewFile' },
  config = function()
    local conform = require 'conform'
    conform.setup {
      formatters_by_ft = {
        javascript = { 'eslint_d' },
        typescript = { 'eslint_d' },
        typescriptreact = { 'eslint_d' },
        javascriptreact = { 'eslint_d' },
        vue = { 'eslint_d' },
        tailwind = { 'rustywind' },

        css = { 'prettier' },
        html = { 'prettier' },
        json = { 'prettier' },
        yaml = { 'prettier' },
        markdown = { 'prettier' },

        lua = { 'stylua' },

        rust = { 'rustfmt' },
        go = { 'goimports', 'gofmt' },
        -- csharp = { 'csharpier' },

        -- ['*'] = { 'codespell' },
        ['_'] = { 'trim_whitespace' },
      },

      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return {}
        end
        return {
          lsp_fallback = true,
          timeout_ms = 2000,
        }
      end,
    }
  end,
}
