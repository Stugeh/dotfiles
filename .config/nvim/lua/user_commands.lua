-- Toggle for formatting on save
local function toggle_autoformat(args)
  if args.bang then
    vim.b.disable_autoformat = not vim.b.disable_autoformat
    if vim.b.disable_autoformat == true then
      vim.notify 'Disabled Formatting for buffer.'
    else
      vim.notify 'Enabled Formatting for buffer.'
    end
  else
    vim.g.disable_autoformat = not vim.g.disable_autoformat
    if vim.g.disable_autoformat == true then
      vim.notify 'Disabled Formatting.'
    else
      vim.notify 'Enabled Formatting.'
    end
  end
end

local function find_git_root()
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_dir
  local cwd = vim.fn.getcwd()
  if current_file == '' then
    current_dir = cwd
  else
    current_dir = vim.fn.fnamemodify(current_file, ':h')
  end
  local git_root = vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')[1]
  if vim.v.shell_error ~= 0 then
    print 'Not a git repository. Searching on current working directory'
    return cwd
  end
  return git_root
end

local function live_grep_git_root()
  local git_root = find_git_root()
  if git_root then
    require('telescope.builtin').live_grep {
      search_dirs = { git_root },
    }
  end
end

local function search_config_files()
  require('telescope.builtin').find_files {
    search_dirs = { '~/.config/nvim' },
  }
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    vim.bo.bufhidden = "wipe"
  end,
})

vim.api.nvim_create_user_command('ToggleFormatting', toggle_autoformat, {
  desc = 'Disable autoformat-on-save',
  bang = true,
})

vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})
vim.api.nvim_create_user_command('SearchConfigFiles', search_config_files, {})

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

local function close_netrw_buffers()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].filetype == 'netrw' then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
end

vim.api.nvim_create_autocmd("BufEnter", {
  group = project_drawer,
  callback = function()
    if vim.bo.filetype ~= 'netrw' then
      close_netrw_buffers()
    end
  end
})
