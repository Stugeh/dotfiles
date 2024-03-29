return {
  server_list = {
    'gopls',
    'templ',
    'rust_analyzer',
    'volar',
    'clangd',
    'omnisharp',
    'lua_ls',
    'html',
    'cssls',
    'tailwindcss',
  },
  server_configs = {
    gopls = { filetypes = { 'go', 'templ' } },
    templ = { filetypes = { 'templ' } },
    rust_analyzer = { check = { command = 'clippy' } },
    volar = { filetypes = { 'vue' } },
    html = { filetypes = { 'html', 'templ' } },
    tailwindcss = { filetypes = { 'html', 'vue' } },
    clangd = { filetypes = { 'c++', 'cpp', 'hpp' }, capabilities = { offsetEncoding = 'utf-8' } },
    omnisharp = { filetypes = { 'cs', 'csharp', 'c#' } },

    lua_ls = {
      Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
      },
    },
  },
}
