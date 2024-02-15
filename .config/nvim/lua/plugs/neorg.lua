return {
  'nvim-neorg/neorg',
  build = ':Neorg sync-parsers',
  -- tag = "*",
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('neorg').setup {
      load = {
        ['core.defaults'] = {}, -- Loads default behaviour
        ['core.concealer'] = {}, -- Adds pretty icons to your documents
        ['core.dirman'] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              games = '~/notes/games',
            },
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  dependencies = { "nvim-lua/plenary.nvim" },

  config = function()
    require("neorg").setup {
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/notes/work",
              misc = "~/notes/work/misc",
              hours = "~/notes/work/hours",
            },
            default_workspace = "notes",
          },
        },
      },
    }

    vim.wo.foldlevel = 99
    vim.wo.conceallevel = 2
  end,
}
