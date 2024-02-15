require 'options'

require('lazy').setup({
  'tpope/vim-sleuth',
  'folke/which-key.nvim',
  {
    'RRethy/vim-illuminate',
  },
  'nvim-tree/nvim-web-devicons',
  'tpope/vim-surround',

  require 'lsp.lsp',
  require 'lsp.treesitter',
  require 'lsp.conform',
  require 'lsp.nvim-lint',

  require 'plugs.toggleterm',
  -- require 'plugs.lazygit',
  require 'plugs.cmp',
  require 'plugs.gitsigns',
  -- require 'plugs.lualine',
  require 'plugs.indent_blankline',
  require 'plugs.comment',
  require 'plugs.telescope',
  require 'plugs.bufferline',
  -- require 'plugs.ChatGPT',
  require 'plugs.nvim_tree',
  require 'plugs.leap',
  require 'plugs.autopairs',
  require 'plugs.noice',
  require 'plugs.neorg',

  require 'theme',

  {
    'David-Kunz/gen.nvim',
    config = function()
      require('gen').model = 'codellama'
    end
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
    config = function()
      require('typescript-tools').setup {
        settings = {
          expose_as_code_action = "all",
          tsserver_plugins = {},
          tsserver_file_preferences = { "vue", "ts", "tsx", "typescriptreact", "typescript" },
          tsserver_locale = "en",
          complete_function_calls = true,
          include_completions_with_insert_text = true,
          -- possible values: ("off"|"all"|"implementations_only"|"references_only")
          code_lens = "all",
          -- by default code lenses are displayed on all referencable values and for some of you it can
          -- be too much this option reduce count of them by removing member references from lenses
          disable_member_code_lens = true,
          jsx_close_tag = {
            enable = true,
            filetypes = { "vue", "ts", "tsx", "typescriptreact", "typescript" },
          }
        },
      }
    end
  }
  -- {
  --   "hinell/lsp-timeout.nvim",
  --   dependencies = { "neovim/nvim-lspconfig" }
  -- }
}, {})




require 'keybinds'
-- vim: ts=2 sts=2 sw=2 et
