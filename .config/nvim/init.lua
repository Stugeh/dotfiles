require 'options'

require('lazy').setup({
  'tpope/vim-sleuth',
  'folke/which-key.nvim',
  'RRethy/vim-illuminate',
  'nvim-tree/nvim-web-devicons',
  'tpope/vim-surround',

  require 'lsp.mason',
  require 'lsp.lspconfig',
  require 'lsp.treesitter',

  require 'plugs.toggleterm',
  require 'plugs.lazygit',
  require 'plugs.cmp',
  require 'plugs.gitsigns',
  require 'plugs.lualine',
  require 'plugs.indent_blankline',
  require 'plugs.comment',
  require 'plugs.telescope',
  require 'plugs.bufferline',
  -- require 'plugs.ChatGPT',
  require 'plugs.nvim_tree',
  require 'plugs.leap',
  require 'plugs.autopairs',
  require 'plugs.noice',

  require 'theme',

  {
    'David-Kunz/gen.nvim',
    config = function()
      require('gen').model = 'codellama'
    end
  },
}, {})




require 'keybinds'
-- vim: ts=2 sts=2 sw=2 et
