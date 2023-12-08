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
  require 'lsp.autoformat',

  require 'plugs.lazygit',
  require 'plugs.toggleterm',
  require 'plugs.cmp',
  require 'plugs.gitsigns',
  require 'plugs.lualine',
  require 'plugs.indent_blankline',
  require 'plugs.comment',
  require 'plugs.telescope',
  require 'plugs.bufferline',
  -- require 'plugs.ChatGPT',
  require 'plugs.nvim_tree',

  require 'theme',

  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
  },
  {
    'altermo/ultimate-autopair.nvim',
    event = { 'InsertEnter', 'CmdlineEnter' },
  },

  {
    'David-Kunz/gen.nvim',
    config = function()
      require('gen').model = 'codellama'
    end
  },
}, {})




require 'keybinds'
-- vim: ts=2 sts=2 sw=2 et
