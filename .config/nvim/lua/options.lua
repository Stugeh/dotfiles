-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
vim.g.netrw_liststyle = 3
vim.g.netrw_preview = 1
vim.g.netrw_winsize = 50
vim.g.netrw_browse_split = 4
vim.g.netrw_banner = 0
vim.g.netrw_sizestyle = 'H'
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.termguicolors = true
vim.opt.showtabline = 1
vim.o.wrap = false
vim.o.hlsearch = true
vim.wo.number = true
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect'
vim.o.termguicolors = true
vim.o.scrolloff = 40
vim.opt.relativenumber = true
vim.opt.guifont = 'monospace:h17' -- the font used in graphical neovim applications

vim.opt.fillchars = vim.opt.fillchars + 'eob: '
vim.opt.fillchars:append {
  stl = ' ',
}
vim.opt.shortmess:append 'c'

vim.cmd 'set whichwrap+=<,>,[,],h,l'
vim.cmd [[set iskeyword+=-]]

-- Briefly highlight selection when yanking
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


local project_drawer = vim.api.nvim_create_augroup("ProjectDrawer", { clear = true })

-- Add an autocommand to the group
vim.api.nvim_create_autocmd("VimEnter", {
  group = project_drawer,
  command = "Lexplore"
})

local function close_netrw_buffers()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].filetype == 'netrw' then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
end

-- Add an autocommand to the group to close netrw buffers when entering a non-netrw buffer
vim.api.nvim_create_autocmd("BufEnter", {
  group = project_drawer,
  callback = function()
    if vim.bo.filetype ~= 'netrw' then
      close_netrw_buffers()
    end
  end
})

vim.filetype.add {
  extension = {
    templ = 'templ',
  },
}
