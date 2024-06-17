return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    {
      'hrsh7th/cmp-nvim-lsp',
      event = 'InsertEnter',
    },
    {
      'hrsh7th/cmp-emoji',
      event = 'InsertEnter',
    },
    {
      'hrsh7th/cmp-buffer',
      event = 'InsertEnter',
    },
    {
      'hrsh7th/cmp-path',
      event = 'InsertEnter',
    },
    {
      'hrsh7th/cmp-cmdline',
      event = 'InsertEnter',
    },
    {
      'saadparwaiz1/cmp_luasnip',
      event = 'InsertEnter',
    },
    {
      'L3MON4D3/LuaSnip',
      event = 'InsertEnter',
      dependencies = {
        'rafamadriz/friendly-snippets',
      },
    },
    'hrsh7th/cmp-nvim-lua',
  },
  config = function()
    vim.api.nvim_set_hl(0, 'CmpItemKindCrate', { fg = '#F64D00' })

    local cmp = require 'cmp'
    local luasnip = require 'luasnip'

    luasnip.filetype_extend('vue', { 'html' })
    luasnip.filetype_extend('typescriptreact', { 'html' })

    require('luasnip/loaders/from_vscode').lazy_load()

    local check_backspace = function()
      local col = vim.fn.col '.' - 1
      return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s'
    end

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
        ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-e>'] = cmp.mapping {
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        },

        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ['<CR>'] = cmp.mapping.confirm { select = true },

        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expandable() then
            luasnip.expand()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif check_backspace() then
            fallback()
          else
            fallback()
          end
        end, {
          'i',
          's',
        }),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, {
          'i',
          's',
        }),
      },

      formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        expandable_indicator = true,
        format = function(entry, vim_item)
          vim_item.menu = ({
            nvim_lsp = '',
            nvim_lua = '',
            luasnip = '',
            buffer = '',
            path = '',
            emoji = '',
          })[entry.source.name]

          vim_item.kind = ({
            Text = 'Text',
            Method = 'Method ',
            Function = 'Func',
            Constructor = 'Constructor',
            Field = 'Field',
            Variable = 'Var',
            Class = 'Class',
            Interface = 'Interface',
            Module = 'Module',
            Property = 'Prop',
            Unit = 'Unit',
            Value = 'Value',
            Enum = 'Enum',
            Keyword = 'Keyword',
            Snippet = 'Snippet',
            Color = 'Color',
            File = 'File',
            Reference = 'Reference',
            Folder = 'Folder',
            EnumMember = 'EnumMember',
            Constant = 'Constant',
            Struct = 'Struct',
            Event = 'Event',
            Operator = 'Operator',
            TypeParameter = 'Type',
          })[vim_item.kind]

          if entry.source.name == 'crates' then
            vim_item.kind_hl_group = 'CmpItemKindCrate'
          end

          if entry.source.name == 'lab.quick_data' then
            vim_item.kind_hl_group = 'CmpItemKindConstant'
          end

          return vim_item
        end,
      },
      sources = {
        {
          name = 'nvim_lsp',
          entry_filter = function(entry, ctx)
            local kind = require('cmp.types.lsp').CompletionItemKind[entry:get_kind()]
            if kind == 'Snippet' and ctx.prev_context.filetype == 'java' then
              return false
            end

            if ctx.prev_context.filetype == 'markdown' then
              return true
            end

            if kind == 'Text' then
              return false
            end

            return true
          end,
        },
        { name = 'luasnip' },
        { name = 'nvim_lua' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'calc' },
        { name = 'treesitter' },
        { name = 'crates' },
      },
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      window = {
        completion = {
          border = 'rounded',
          winhighlight = 'Normal:Pmenu,CursorLine:PmenuSel,FloatBorder:FloatBorder,Search:None',
          col_offset = -3,
          side_padding = 1,
          scrollbar = false,
          scrolloff = 8,
        },
        documentation = {
          border = 'rounded',
          winhighlight = 'Normal:Pmenu,FloatBorder:FloatBorder,Search:None',
        },
      },
      experimental = {
        ghost_text = false,
      },
    }

    pcall(function()
      local function on_confirm_done(...)
        require('nvim-autopairs.completion.cmp').on_confirm_done()(...)
      end
      require('cmp').event:off('confirm_done', on_confirm_done)
      require('cmp').event:on('confirm_done', on_confirm_done)
    end)
  end,
}
