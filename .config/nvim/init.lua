-- Lazy.nvim init
require 'plugin_manager'

-- Native settings
require 'options'
require 'diagnostics'

require('lazy').setup({
  -- Set indent style based on current file
  'tpope/vim-sleuth',
  -- Highlight other usages of currently hovered symbol
  'RRethy/vim-illuminate',
  -- Surround selection with symbol
  'tpope/vim-surround',
  -- Icons for page tree
  'nvim-tree/nvim-web-devicons',

  -- Language server configs
  require 'lsp.lsp',
  require 'lsp.treesitter',
  -- Formatters
  require 'lsp.conform',
  -- Linters
  require 'lsp.nvim-lint',

  -- Tooltips for remembering keybinds
  -- require 'plugs.whichkey',
  -- Floating terminal
  require 'plugs.toggleterm',
  -- Org style note taking
  require 'plugs.neorg',
  -- Floating lazy git instance
  require 'plugs.lazygit',
  -- Code completion
  require 'plugs.cmp',
  -- Git gutter icons, blame etc.
  require 'plugs.gitsigns',
  require 'plugs.indent_blankline',
  require 'plugs.comment',
  -- Floating search windows for all the things
  require 'plugs.telescope',
  -- Tab bar
  -- require 'plugs.bufferline',
  -- require 'plugs.ChatGPT',
  -- Page tree
  require 'plugs.nvim_tree',
  -- Quick code navigation
  require 'plugs.leap',
  -- Close brackets, braces etc.
  require 'plugs.autopairs',
  -- A Nicer looking command prompt
  require 'plugs.noice',

  require 'plugs.debug',

  require 'theme',

  -- Local llm assistant
  -- {
  --   'David-Kunz/gen.nvim',
  --   config = function()
  --     require('gen').model = 'codellama'
  --   end,
  -- },
}, {})

require 'keybinds'
require 'user_commands'
-- vim: ts=2 sts=2 sw=2 et
