-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local nvim_lsp = require('lspconfig')
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
    'bashls',
    'clangd',
    'cmake',
    'gopls',
    'intelephense',
    'jedi_language_server',
    'denols'
});

-- Auto Format on Save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- Keybind to Format
vim.keymap.set('n', '<C-f>', vim.lsp.buf.format)

local on_attach = function(client)
    if nvim_lsp.util.root_pattern("deno.json")(vim.fn.getcwd()) then
        if client.name == "tsserver" then
            client.stop()
            return
        end
    end
end

vim.g.markdown_fenced_languages = {
    "ts=typescript"
}

-- Fix For Deno & TSserver Clash!
lsp.configure('tsserver', {
    on_attach = on_attach,
    single_file_support = true,
})

lsp.configure('denols', {
    on_attach = on_attach,
    single_file_support = false,
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = false,
    float = true,
})
