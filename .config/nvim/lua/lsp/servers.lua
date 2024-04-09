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
    'csharp_ls',
  },
  server_configs = {
    gopls = { filetypes = { 'go', 'templ' } },
    templ = { filetypes = { 'templ' } },
    rust_analyzer = { check = { command = 'clippy' } },
    volar = { filetypes = { 'vue' } },
    html = { filetypes = { 'html', 'templ' } },
    tailwindcss = { filetypes = { 'html', 'vue' } },
    clangd = { filetypes = { 'c', 'h', 'c++', 'cpp', 'hpp' }, capabilities = { offsetEncoding = 'utf-8' } },
    csharp_ls = { filetypes = { 'cs', 'csharp', 'c#' } },

    lua_ls = {
      Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
      },
    },
  },
}
