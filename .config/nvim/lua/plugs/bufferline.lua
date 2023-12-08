return {
  'akinsho/bufferline.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local bufferline = require 'bufferline'
    bufferline.setup {
      options = {
        mode = "buffers",
        style_preset = bufferline.style_preset.minimal,
        diagnostics = 'nvim_lsp',
        color_icons = true,
        separator_stile = 'slant',
        diagnostics_indicator = diagnostics_indicator,
      },
    }
  end
}
