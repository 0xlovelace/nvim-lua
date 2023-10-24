-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local nvim_lsp = require('lspconfig')
local lsp = require('lsp-zero')
lsp.preset('recommended')

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.ensure_installed({
    'tsserver',
    'tailwindcss',
    'prismals',
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
    'intelephense',
    'ltex'
});

-- Auto Format on Save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- Keybind to Format
vim.keymap.set('n', '<C-f>', vim.lsp.buf.format)

-- on every lsp attach it does a check for deno app
lsp.on_attach(function(client)
    if nvim_lsp.util.root_pattern("deno.json", "import_map.json")(vim.fn.getcwd()) then
        if client.name == "tsserver" then
            client.stop()
            return
        end
    end
end)

-- Fix For Deno & TSserver Clash!
lsp.configure('denols', {
    root_dir = nvim_lsp.util.root_pattern("deno.json", "import_map.json"),
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
