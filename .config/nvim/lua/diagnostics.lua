ErrorIcon = '✘'
WarningIcon = '▲'
HintIcon = ''
InfoIcon = ''

vim.diagnostic.config {
  severity_sort = true,
  signs = {
    active = true,
    values = {
      [vim.diagnostic.severity.ERROR] = ErrorIcon,
      [vim.diagnostic.severity.WARN] = WarningIcon,
      [vim.diagnostic.severity.HINT] = HintIcon,
      [vim.diagnostic.severity.INFO] = InfoIcon,
    },
  },
}

-- Set gutter icons
local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = '',
  })
end

sign { name = 'DiagnosticSignInfo', text = InfoIcon }
sign { name = 'DiagnosticSignHint', text = HintIcon }
sign { name = 'DiagnosticSignWarn', text = WarningIcon }
sign { name = 'DiagnosticSignError', text = ErrorIcon }
