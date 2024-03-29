return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
    'nvim-neotest/nvim-nio',

    -- Add your own debuggers here
    'leoluz/nvim-dap-go',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    -- C / CPP
    dap.adapters.gdb = {
      type = 'executable',
      command = 'gdb',
      args = { '-i', 'dap' },
    }

    dap.configurations.cpp = {
      {
        name = 'Debug Hyprland',
        type = 'gdb',
        request = 'launch',
        program = '~/Hyprland/build/Hyprland',
        cwd = '${workspaceFolder}',
        stopAtBeginningOfMainSubprogram = false,
      },
      {
        name = 'Debug fluid sim',
        type = 'gdb',
        request = 'launch',
        program = '~/fluid-sim/bin/debug/fluid-sim',
        cwd = '${workspaceFolder}',
        stopAtBeginningOfMainSubprogram = false,
      },
    }

    -- C#
    -- dap.adapters.coreclr = {
    --   type = 'executable',
    --   command = '/usr/local/bin/netcoredbg/netcoredbg',
    --   args = { '--interpreter=vscode' },
    -- }
    --
    -- dap.configurations.cs = {
    --   {
    --     type = 'coreclr',
    --     name = 'Debug atria',
    --     request = 'launch',
    --     program = function()
    --       return '~/Atria2023/Atria.Web/bin/host/Debug/net6.0/Atria.Web.dll'
    --     end,
    --   },
    -- }

    require('mason-nvim-dap').setup {
      automatic_setup = true,
      handlers = {},
      ensure_installed = {
        'delve',
        'gdb',
      },
    }

    vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>B', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'Debug: Set Breakpoint' })

    local icons = require 'icons'
    dapui.setup {
      icons = icons.ui.debugger.other_icons,
      controls = {
        icons = icons.ui.debugger.controls,
      },
    }

    vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })
    vim.keymap.set('n', 'dbc', dapui.toggle, { desc = 'Debug: See last session result.' })

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    require('dap-go').setup()
  end,
}
