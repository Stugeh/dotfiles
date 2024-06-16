-- Lazy.nvim init
require 'plugin_manager'

-- Native settings
require 'options'
require 'diagnostics'

require('lazy').setup({
  ui = { border = 'rounded' },
  -- Set indent style based on current file
  'tpope/vim-sleuth',
  "tpope/vim-surround",
  'eandrju/cellular-automaton.nvim',
  'RRethy/vim-illuminate',
  {
    'NeogitOrg/neogit',
    dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim", "nvim-telescope/telescope.nvim" },
    config = true
  },
  { 'folke/trouble.nvim',           config = true },
  { "natecraddock/workspaces.nvim", config = true },
  { "chentoast/marks.nvim",         config = true },
  require 'lsp.treesitter',
  require 'lsp.lsp-config',
  require 'plugs.eyeliner',
  require 'plugs.toggleterm',
  require 'plugs.lazygit',
  require 'plugs.cmp',
  require 'plugs.gitsigns',
  require 'plugs.indent_blankline',
  require 'plugs.comment',
  require 'plugs.telescope',
  require 'plugs.netrw',
  require 'plugs.leap',
  require 'plugs.autopairs',
  require 'plugs.eye_candy',
  require 'plugs.debug',
  require 'plugs.colorizer',
  require 'theme',
}, {})

require 'user_commands'
require 'keybinds'
-- vim: ts=2 sts=2 sw=2 et
