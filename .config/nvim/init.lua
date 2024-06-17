-- Lazy.nvim init
require 'plugin_manager'

-- Native settings
require 'options'
require 'diagnostics'

require('lazy').setup({
  ui = { border = 'rounded' },
  -- Set indent style based on current file
  'tpope/vim-sleuth',

  'folke/trouble.nvim',

  -- Highlight other usages of currently hovered symbol
  'RRethy/vim-illuminate',

  -- Surround selection with symbol
  'folke/which-key.nvim',

  {
    "kndndrj/nvim-dbee",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    build = function()
      -- Install tries to automatically detect the install method.
      -- if it fails, try calling it with one of these parameters:
      --    "curl", "wget", "bitsadmin", "go"
      require("dbee").install()
    end,
    config = function()
      require("dbee").setup( --[[optional config]])
    end,
  },

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

  'tpope/vim-surround',

  -- Icons for page tree
  'nvim-tree/nvim-web-devicons',

  'github/copilot.vim',

  -- Language server configs
  require 'lsp.mason',
  require 'lsp.lspconfig',
  require 'lsp.treesitter',

  -- Formatters
  require 'lsp.conform',

  -- Linters
  require 'lsp.nvim-lint',

  {
    'LunarVim/breadcrumbs.nvim',
    config = function()
      require('breadcrumbs').setup()
    end,
  },

  require 'plugs.eyeliner',
  require 'plugs.ufo',

  require 'plugs.workspaces',
  -- Tooltips for remembering keybinds
  -- require 'plugs.whichkey',
  --
  -- Floating terminal
  require 'plugs.toggleterm',

  -- Floating lazy git instance
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

  require 'plugs.nvim_tree',

  -- Quick code navigation
  require 'plugs.leap',

  -- Close brackets, braces etc.
  require 'plugs.autopairs',

  require 'plugs.eye_candy',

  require 'plugs.debug',

  require 'theme',

  require 'plugs.eye_candy',
  require 'plugs.colorizer',

  require 'theme',

  require 'plugs.dressing',
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    config = function()
      require('typescript-tools').setup {
        settings = {
          expose_as_code_action = 'all',
          tsserver_plugins = { '@vue/typescript-plugin' },
          tsserver_file_preferences = { 'vue', 'js', 'ts', 'tsx', 'typescriptreact', 'typescript' },
          tsserver_locale = 'en',
          complete_function_calls = true,
          include_completions_with_insert_text = true,
          -- possible values: ("off"|"all"|"implementations_only"|"references_only")
          code_lens = 'off',
          -- by default code lenses are displayed on all referencable values and for some of you it can
          -- be too much this option reduce count of them by removing member references from lenses
          disable_member_code_lens = true,
          jsx_close_tag = {
            enable = true,
            filetypes = { 'vue', 'ts', 'tsx', 'typescriptreact', 'typescript' },
          },
        },
      }
    end,
  },
}, {})

require 'keybinds'
require 'user_commands'
-- vim: ts=2 sts=2 sw=2 et
