return {
  'stevearc/conform.nvim',
  event = { "BufWritePre", "BufNewFile" },
  config = function()
    local conform = require 'conform'
    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        vue = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        lua = { "stylua" },
        rust = { "rustfmt" },
        csharp = { "csharpier" },
        tailwind = { "rustywind" },
        go = { "goimports", "gofmt" }
      },
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return {
          lsp_fallback = true,
          async = false,
        }
      end,
    })
  end
}
