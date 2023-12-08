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
    vim.cmd.colorscheme 'gruvbox-material'
  end,
}
