local map = vim.keymap.set

map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
map('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

map('n', '<leader>e', '<cmd>NvimTreeToggle<CR>')
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

-- neorg
map('n', '<leader>nh', '<cmd>Neorg workspace hours<cr>')
map('n', '<leader>nr', '<cmd>Neorg workspace notes<cr>')
map('n', '<leader>nm', '<cmd>Neorg workspace misc<cr>')
map('n', '<leader>nt', '<cmd>edit ~/notes/work/todos.norg<cr>')
map('n', '<leader>nd', '<cmd>edit ~/Atria2023.wiki')

map('n', '<leader>ns', ':SearchNotes<cr>', { desc = 'Search neorg notes' })
map('n', '<leader>ng', ':GrepNotes<cr>', { desc = 'Grep neorg notes' })

map('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = 'Search diagnostics' })
map('n', '<leader>sr', require('telescope.builtin').resume, { desc = 'Search resume' })
map('n', '<leader>tf', '<cmd>ToggleFormatting<cr>')

vim.cmd [[
  command! -nargs=1 EditWiki edit ~/Atria2023.wiki/<args>.md
]]

map('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = 'Fuzzy search in buf' })
