vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
-- vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>')
vim.keymap.set('n', '<leader>W', '<cmd>noautocmd w<cr>')
vim.keymap.set('n', '<leader>h', '<cmd>noh<cr>')
vim.keymap.set('n', '<leader>q', '<cmd>q<cr>')
vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<cr>')
vim.keymap.set('n', '<S-l>', '<cmd>bn<cr>')
vim.keymap.set('n', '<S-h>', '<cmd>bp<cr>')
vim.keymap.set('n', '<leader>c', '<cmd>bd<cr>')

-- ToggleTerm
vim.keymap.set('n', '<leader>\\1', '<cmd>1ToggleTerm<cr>')
vim.keymap.set('n', '<leader>\\2', '<cmd>2ToggleTerm<cr>')
vim.keymap.set('n', '<leader>\\3', '<cmd>3ToggleTerm<cr>')
vim.keymap.set('n', '<leader>\\4', '<cmd>4ToggleTerm<cr>')
vim.keymap.set('n', '<leader>\\5', '<cmd>5ToggleTerm<cr>')
vim.keymap.set('n', '<leader>\\6', '<cmd>6ToggleTerm<cr>')

local Terminal = require('toggleterm.terminal').Terminal
local ranger   = Terminal:new({ cmd = "ranger ~", hidden = true, direction = 'float' })

function Ranger_toggle()
  ranger:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>\\r", "<cmd>lua Ranger_toggle()<CR>", { noremap = true, silent = true })

-- gen nvim
vim.keymap.set('v', '<C-;>', ':Gen<CR>')
vim.keymap.set('n', '<C-;>', ':Gen<CR>')

-- telescope
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = 'Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = 'Find existing buffers' })
vim.keymap.set('n', '<leader>f', require('telescope.builtin').find_files, { desc = 'Search files' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = 'Search current word' })
vim.keymap.set('n', '<leader>st', require('telescope.builtin').live_grep, { desc = 'Search text' })
vim.keymap.set('n', '<leader>sT', ':LiveGrepGitRoot<cr>', { desc = 'Search by text from git Root' })
vim.keymap.set('n', '<leader>sc', ':SearchConfigFiles<cr>', { desc = 'Search config files' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = 'Search diagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = 'Search resume' })
vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = 'Fuzzy search in buf' })

require('which-key').register {
  ['<leader>l'] = { name = 'Lsp', _ = 'which_key_ignore' },
  ['<leader>g'] = { name = 'Git', _ = 'which_key_ignore' },
  ['<leader>r'] = { name = 'Rename', _ = 'which_key_ignore' },
  ['<leader>s'] = { name = 'Search', _ = 'which_key_ignore' },
  ['<leader>w'] = { name = 'Workspace', _ = 'which_key_ignore' },
}

-- Toggle for formatting on save
vim.api.nvim_create_user_command("ToggleFormatting", function(args)
  if args.bang then
    vim.b.disable_autoformat = not vim.b.disable_autoformat
    if vim.b.disable_autoformat == true then
      vim.notify("Disabled Formatting for buffer.")
    else
      vim.notify("Enabled Formatting for buffer.")
    end
  else
    vim.g.disable_autoformat = not vim.g.disable_autoformat
    if vim.g.disable_autoformat == true then
      vim.notify("Disabled Formatting.")
    else
      vim.notify("Enabled Formatting.")
    end
  end
end, {
  desc = "Disable autoformat-on-save",
  bang = true,
})

vim.keymap.set('n', '<leader>tf', '<cmd>ToggleFormatting<cr>')
