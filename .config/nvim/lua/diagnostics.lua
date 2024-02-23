local icons = require 'icons'
local diagnostic_config = {
  signs = {
    active = true,
    values = {
      { name = 'DiagnosticSignError', text = icons.diagnostics.Error },
      { name = 'DiagnosticSignWarn', text = icons.diagnostics.Warning },
      { name = 'DiagnosticSignHint', text = icons.diagnostics.Hint },
      { name = 'DiagnosticSignInfo', text = icons.diagnostics.Information },
    },
  },
  virtual_text = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = true,
    style = 'minimal',
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
}
vim.diagnostic.config(diagnostic_config)

for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), 'signs', 'values') or {}) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
end
