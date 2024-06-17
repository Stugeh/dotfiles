local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Stay in visual selection after indent

map('v', '<', '<gv', { noremap = true, silent = true })
map('v', '>', '>gv', { noremap = true, silent = true })

-- Mouse context menus
vim.cmd [[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]]
vim.cmd [[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]]
vim.keymap.set('n', '<RightMouse>', '<cmd>:popup mousemenu<CR>')
vim.keymap.set('n', '<Tab>', '<cmd>:popup mousemenu<CR>')

-- Center cursor
map('n', 'n', 'nzz', opts)
map('n', 'N', 'Nzz', opts)
map('n', '*', '*zz', opts)
map('n', '#', '#zz', opts)
map('n', 'g*', 'g*zz', opts)
map('n', 'g#', 'g#zz', opts)

-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
map('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
map('n', '<leader>lq', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- map('n', '<leader>e', '<cmd>NvimTreeToggle<CR>')
map('n', '<leader>e', '<cmd>lua MiniFiles.open()<CR>')
-- map('n', '<leader>e', '<cmd>Oil<CR>')

map('n', '<leader>gw', '<cmd>Telescope workspaces<CR>')
map('n', '<leader>w', '<cmd>w<CR>')
map('n', '<leader>W', '<cmd>noautocmd w<cr>')
map('n', '<leader>h', '<cmd>noh<cr>')
map('n', '<leader>q', '<cmd>q<cr>')
map('n', '<leader>gg', '<cmd>LazyGit<cr>')
map('n', '<S-l>', '<cmd>bn<cr>')
map('n', '<S-h>', '<cmd>bp<cr>')
map('n', '<leader>c', '<cmd>bd<cr>')

-- ToggleTerm
map('n', '<leader>\\1', '<cmd>1ToggleTerm<cr>')
map('n', '<leader>\\2', '<cmd>2ToggleTerm<cr>')
map('n', '<leader>\\3', '<cmd>3ToggleTerm<cr>')
map('n', '<leader>\\4', '<cmd>4ToggleTerm<cr>')
map('n', '<leader>\\5', '<cmd>5ToggleTerm<cr>')
map('n', '<leader>\\6', '<cmd>6ToggleTerm<cr>')

vim.api.nvim_set_keymap('n', '<leader>\\r', '<cmd>lua Ranger_toggle()<CR>', { noremap = true, silent = true })

-- gen nvim
map('v', '<C-;>', ':Gen<CR>')
map('n', '<C-;>', ':Gen<CR>')

map('n', '<C-l>', ':wincmd l<CR>')
map('n', '<C-h>', ':wincmd h<CR>')

map('n', '<leader>ws', ':vsplit<CR>')

-- telescope
map('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = 'Find recently opened files' })
map('n', '<leader><space>', require('telescope.builtin').buffers, { desc = 'Find existing buffers' })
map('n', '<leader>f', require('telescope.builtin').find_files, { desc = 'Search files' })
map('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = 'Search current word' })
map('n', '<leader>st', require('telescope.builtin').live_grep, { desc = 'Search text' })
map('n', '<leader>sT', ':LiveGrepGitRoot<cr>', { desc = 'Search by text from git Root' })
map('n', '<leader>sc', ':SearchConfigFiles<cr>', { desc = 'Search config files' })
map('n', '<leader>sx', ':SearchDocs<cr>', { desc = 'Search documentation files' })

map('n', '<leader>tt', '<cmd>TroubleToggle<cr>')

-- neorg
map('n', '<leader>nh', '<cmd>e ~/notes/work/hours.md<cr>')
map('n', '<leader>nt', '<cmd>e ~/notes/work/todo.md<cr>')
map('n', '<leader>nd', '<cmd>e ~/Atria2023.wiki')

map('n', '<leader>ns', ':SearchNotes<cr>', { desc = 'Search neorg notes' })
map('n', '<leader>ng', ':GrepNotes<cr>', { desc = 'Grep neorg notes' })

map('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = 'Search diagnostics' })
map('n', '<leader>sr', require('telescope.builtin').resume, { desc = 'Search resume' })
map('n', '<leader>tf', '<cmd>ToggleFormatting<cr>')

vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap('i', '<M-b>', 'copilot#Accept("<CR>")', { silent = true, expr = true })

vim.cmd [[
  command! -nargs=1 EditWiki edit ~/Atria2023.wiki/<args>.md
]]

map('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = 'Fuzzy search in buf' })
