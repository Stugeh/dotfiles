return {
  'folke/which-key.nvim',
  require('which-key').register {
    ['<leader>l'] = { name = 'Lsp', _ = 'which_key_ignore' },
    ['<leader>g'] = { name = 'Git', _ = 'which_key_ignore' },
    ['<leader>r'] = { name = 'Rename', _ = 'which_key_ignore' },
    ['<leader>s'] = { name = 'Search', _ = 'which_key_ignore' },
  },
}
