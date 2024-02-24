return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },
  config = function()
    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
      },
      pickers = {
        buffers = {
          ignore_current_buffer = true,
          sort_lastused = true,
        },
      },
    }

    pcall(require('telescope').load_extension, 'fzf')

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

    local function search_documentation_files()
      require('telescope.builtin').find_files {
        search_dirs = { '~/Atria2023.wiki' },
      }
    end

    local function search_notes()
      require('telescope.builtin').find_files {
        search_dirs = { '~/notes' },
      }
    end

    local function grep_notes()
      require('telescope.builtin').live_grep {
        search_dirs = { '~/notes' },
      }
    end

    vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})
    vim.api.nvim_create_user_command('SearchConfigFiles', search_config_files, {})

    vim.api.nvim_create_user_command('SearchNotes', search_notes, {})
    vim.api.nvim_create_user_command('GrepNotes', grep_notes, {})

    vim.api.nvim_create_user_command('SearchDocs', search_documentation_files, {})
  end,
}
