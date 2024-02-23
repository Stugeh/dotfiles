return {
  'sainnhe/gruvbox-material',
  priority = 1000,
  config = function()
    vim.g.gruvbox_material_background = 'hard'
    vim.g.gruvbox_material_transparent_background = 1
    vim.g.gruvbox_material_ui_contrast = 'high'
    vim.g.gruvbox_material_foreground = 'original'
    vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'
    vim.g.gruvbox_material_current_word = 'bold'
    vim.g.gruvbox_material_invert_selection = true
    vim.cmd.colorscheme 'gruvbox-material'
    vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'black', fg = 'white' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'black', fg = 'white' })
    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'black', fg = 'gray' })
    vim.api.nvim_set_hl(0, 'MasonHeader', { bg = 'black', fg = 'white' })
    vim.api.nvim_set_hl(0, 'MasonMutedBlock', { bg = 'black', fg = 'white' })
  end,
}
