local nvim_lsp = require('lspconfig')

-- List of all the server language
local servers = {
    'rust_analyzer',
    'tsserver',
    'pyright',
    'clangd',
    'jdtls',
    'omnisharp',
    'html',
    'cssmodules_ls',
    'cssls',
    'sumneko_lua',
    'intelephense',
    'asm_lsp',
    'ltex',
    'ocamllsp',
    'bashls',
}

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    -- Mapping
    local opts = { noremap=true, silent=true }

    -- See ':help vim.lsp.*'
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', '°', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end


for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach
    }
end


-- For C#
local pid = vim.fn.getpid()
local omnisharp_bin = "/home/tuks/.local/opt/omnisharp/run"
nvim_lsp.omnisharp.setup {
    cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },

    enable_editorconfig_support = true,
    enable_ms_build_load_projects_on_demand = false,
    enable_roslyn_analyzers = false,
    organize_imports_on_format = false,
    enable_import_completion = true,
    sdk_include_prereleases = true,
    analyze_open_documents_only = false,

    on_attach = on_attach,
}


-- For lua
nvim_lsp.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
  on_attach = on_attach,
}

-- For CSS
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.cssls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

-- For Rust
nvim_lsp.rust_analyzer.setup {
    cmd = { 'rustup', 'run', 'nightly', 'rust-analyzer' },
    on_attach = on_attach,
}

-- For LTex
nvim_lsp.ltex.setup {
    capabilities = capabilities,
    settings = {
        ltex = {
            language = "en-US",
            enabled = { "bibtex", "context", "context.tex", "latex", "org", "restructuredtext", "rsweave" },
        },
    },
    on_attach = on_attach,
}



vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
