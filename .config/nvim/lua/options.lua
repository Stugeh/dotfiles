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
-- vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect'
vim.o.termguicolors = true
vim.o.scrolloff = 40
vim.opt.relativenumber = true
vim.opt.guifont = 'monospace:h17' -- the font used in graphical neovim applications
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

vim.opt.fillchars = vim.opt.fillchars + 'eob: '
vim.opt.fillchars:append {
  stl = ' ',
}
vim.opt.shortmess:append 'c'

vim.cmd 'set whichwrap+=<,>,[,],h,l'
vim.cmd [[set iskeyword+=-]]

vim.filetype.add {
  extension = {
    templ = 'templ',
  },
}
