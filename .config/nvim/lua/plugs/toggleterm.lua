return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    direction = 'float',
    open_mapping = [[<c-\>]],
  },
  config = function()
    local Terminal = require('toggleterm.terminal').Terminal
    local ranger   = Terminal:new({ cmd = "ranger ~", hidden = true, direction = 'float' })

    function _ranger_toggle()
      ranger:toggle()
    end

    vim.api.nvim_set_keymap("n", "<leader>\\r", "<cmd>lua _ranger_toggle()<CR>", { noremap = true, silent = true })
  end
}
