-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')
lsp.preset('recommended')

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'lua_ls',
    'rust_analyzer',
    'sqlls',
    'cssls',
    'emmet_ls',
    'dockerls',
    'docker_compose_language_service',
    'html',
    'jsonls',
    'svlangserver',
    'bashls',
    'clangd',
    'cmake',
    'gopls',
    'nil_ls',
    'intelephense',
    'jedi_language_server',
    'svelte',
});

-- Auto Format on Save
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

-- Keybind to Format
vim.keymap.set('n', '<C-f>', vim.lsp.buf.format)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = false,
    float = true,
})
