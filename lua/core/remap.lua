-- Global Keys
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>nt", function() vim.cmd('Neotree') end)
vim.keymap.set("n", "<leader>ts", function() vim.cmd('split term://bash | resize -5') end)
vim.keymap.set("n", "<leader>tf", function() vim.cmd('term') end)

-- Saving & Exiting Keybinds
vim.keymap.set("n", "<leader>qq", function() vim.cmd('qa!') end)     -- exits editor
vim.keymap.set("n", "<leader>ss", function() vim.cmd('w') end)       -- save buffer
vim.keymap.set("n", "<leader>sc", function() vim.cmd('w | bd!') end) -- save & close buffer
vim.keymap.set("n", "<leader>sq", function() vim.cmd('wqa') end)     -- save all buffers & exit

-- Buffer Keybinds
vim.keymap.set("n", "<Tab>", function() vim.cmd('bn') end)           -- Next Buffer alternative
vim.keymap.set("n", "<leader>bn", function() vim.cmd('bn') end)      -- Next Buffer
vim.keymap.set("n", "<leader>bp", function() vim.cmd('bp') end)      -- Previous Buffer
vim.keymap.set("n", "<leader>bd", function() vim.cmd('bd!') end)     --closes current buffer & tabs to the next one
vim.keymap.set("n", "<leader>bl", function() vim.cmd('ls') end)      -- list buffers
vim.keymap.set("n", "<leader>ch", function() vim.cmd('changes') end) -- Shows Changes in current buffer
vim.keymap.set("n", "<C-B>", function() vim.cmd('enew') end)         -- Create Empty Buffer

-- Switch from Terminal to previous buffer
--vim.keymap.set("t", "<Escape>", '<C-\\><C-n>:lua vim.cmd(\'bp\')<CR>', { noremap = true, silent = true })
vim.keymap.set("t", "<Escape>", '<C-\\><C-n>', { noremap = true, silent = true })

-- Remap split navigation keys
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W>l', { noremap = true })

-- Buffer Finder https://alpha2phi.medium.com/neovim-for-beginners-managing-buffers-91367668ce7
vim.keymap.set('n', "<leader>bf", function()
    local results = {}
    local buffers = vim.api.nvim_list_bufs()

    for _, buffer in ipairs(buffers) do
        if vim.api.nvim_buf_is_loaded(buffer) then
            local filename = vim.api.nvim_buf_get_name(buffer)
            table.insert(results, filename)
        end
    end

    vim.ui.select(results, { prompt = "Find buffer:" }, function(selected)
        if selected then
            vim.api.nvim_command("buffer " .. selected)
        end
    end)
end)

-- Terminal Disable Line Numbers
vim.api.nvim_exec([[
  augroup TerminalSettings
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber
  augroup END
]], false)
