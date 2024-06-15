-- Lazy.nvim init
require 'plugin_manager'

-- Native settings
require 'options'
require 'diagnostics'

require('lazy').setup({
  ui = { border = 'rounded' },
  -- Set indent style based on current file
  'tpope/vim-sleuth',
  {
    'NeogitOrg/neogit',
    dependencies = {
      "nvim-lua/plenary.nvim",  -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
      "nvim-telescope/telescope.nvim",
    },
    config = true
  },

  'folke/trouble.nvim',

  -- Highlight other usages of currently hovered symbol
  'RRethy/vim-illuminate',

  -- Surround selection with symbol
  -- 'folke/which-key.nvim',
  {
    'p00f/clangd_extensions.nvim',
    config = function()
      vim.keymap.set('n', '<leader>gs', '<cmd>ClangdSwitchSourceHeader<CR>', { noremap = true, silent = true })
      require('clangd_extensions').setup {
        inlay_hints = {
          inline = true,
          only_current_line = false,
          only_current_line_autocmd = { 'CursorHold' },
          show_parameter_hints = true,
          parameter_hints_prefix = '<- ',
          other_hints_prefix = '=> ',
          max_len_align = false,
          max_len_align_padding = 1,
          right_align = false,
          right_align_padding = 7,
          highlight = 'Comment',
          priority = 100,
        },
      }
    end,
  },

  {
    "natecraddock/workspaces.nvim",
    config = function()
      require 'workspaces'.setup {

      }
    end
  },

  {
    "chentoast/marks.nvim",
    config = function()
      require 'marks'.setup {

      }
    end
  },

  'tpope/vim-surround',

  -- Language server configs
  require 'lsp.mason',
  require 'lsp.lspconfig',
  require 'lsp.treesitter',

  require 'lsp.conform',
  require 'lsp.nvim-lint',

  require 'plugs.eyeliner',
  require 'plugs.ufo',

  require 'plugs.toggleterm',

  require 'plugs.lazygit',

  -- Code completion
  require 'plugs.cmp',

  -- Git gutter icons, blame etc.
  require 'plugs.gitsigns',

  -- require 'plugs.lualine',
  require 'plugs.indent_blankline',

  require 'plugs.comment',

  -- Floating search windows for all the things
  require 'plugs.telescope',

  require 'plugs.netrw',

  -- Quick code navigation
  require 'plugs.leap',

  -- Close brackets, braces etc.
  require 'plugs.autopairs',

  require 'plugs.eye_candy',

  require 'plugs.debug',

  require 'theme',

  -- require 'plugs.eye_candy',
  require 'plugs.colorizer',

  require 'theme',

}, {})

require 'keybinds'
require 'user_commands'
-- vim: ts=2 sts=2 sw=2 et
