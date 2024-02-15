vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.termguicolors = true
vim.opt.showtabline = 1
vim.o.wrap = false
vim.o.hlsearch = true
vim.wo.number = true
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect'
vim.o.termguicolors = true
vim.o.scrolloff = 20
ErrorIcon = '✘'
WarningIcon = '▲'
HintIcon = ''
InfoIcon = ''

vim.cmd([[hi StatusLine guibg=NONE]])

vim.diagnostic.config {
  severity_sort = true,
  virtual_text = {
    format = function(diagnostic)
      if diagnostic.severity == vim.diagnostic.severity.N then
        return string.format('%s %s', HintIcon, diagnostic.message)
      end
      if diagnostic.severity == vim.diagnostic.severity.I then
        return string.format('%s %s', InfoIcon, diagnostic.message)
      end
      if diagnostic.severity == vim.diagnostic.severity.W then
        return string.format('%s %s', WarningIcon, diagnostic.message)
      end
      if diagnostic.severity == vim.diagnostic.severity.E then
        return string.format('%s %s', ErrorIcon, diagnostic.message)
      end
    end,
  },
  signs = {
    active = true,
    values = {
      { name = 'DiagnosticSignError', text = ErrorIcon },
      { name = 'DiagnosticSignWarn',  text = WarningIcon },
      { name = 'DiagnosticSignHint',  text = HintIcon },
      { name = 'DiagnosticSignInfo',  text = InfoIcon },
    },
  },
}

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

-- Briefly highlight selection when yanking
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
