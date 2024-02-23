return {
  'numToStr/Comment.nvim',
  lazy = false,
  dependencies = {
    {
      'JoosepAlviste/nvim-ts-context-commentstring',
      event = 'VeryLazy',
    },
  },
  opts = {
    toggler = {
      -- line = 'm,',
      -- block = 'm.',
    },
  },
}
