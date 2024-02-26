return {
  'projekt0n/github-nvim-theme',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('github-theme').setup {
      options = {
        hide_end_of_buffer = true, -- Hide the '~' character at the end of the buffer for a cleaner look
        transparent = true, -- Disable setting background
        terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
        dim_inactive = false, -- Non focused panes set to alternative background
        module_default = true, -- Default enable value for modules
        inverse = { -- Inverse highlight for different types
          match_paren = false,
          visual = false,
          search = false,
        },
        darken = { -- Darken floating windows and sidebar-like windows
          floats = false,
          sidebars = {
            enabled = true,
            list = {}, -- Apply dark background to specific windows
          },
        },
        modules = { -- List of various plugins and additional options
        },
      },
      palettes = {},
      specs = {},
      groups = {},
    }

    vim.cmd 'colorscheme github_dark_high_contrast'
  end,
}
