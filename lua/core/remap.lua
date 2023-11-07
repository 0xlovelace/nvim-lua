-- Global Keys
vim.g.mapleader = " "
vim.keymap.set("n", "<C-f>", function() vim.cmd('Neotree') end)
vim.keymap.set("n", "<C-t>", function() vim.cmd('term') end)

-- Saving & Exiting Keybinds
vim.keymap.set("n", "<C-q>", function() vim.cmd('qa!') end) -- exits editor
vim.keymap.set("n", "<C-s>", function() vim.cmd('w') end)   -- save buffer
vim.keymap.set("n", "<C-w>", function() vim.cmd('wq') end)  -- save buffer & exit
vim.keymap.set("n", "<C-a>", function() vim.cmd('wqa') end) -- save all buffers & exit

-- Buffer Keybinds
vim.keymap.set("n", "<Tab>", function() vim.cmd('bn') end)           -- Next Buffer alternative
vim.keymap.set("n", "<leader>bn", function() vim.cmd('bn') end)      -- Next Buffer
vim.keymap.set("n", "<leader>bp", function() vim.cmd('bp') end)      -- Previous Buffer
vim.keymap.set("n", "<leader>bw", function() vim.cmd('bw | bn') end) --closes current buffer & tabs to the next one
vim.keymap.set("n", "<leader>bl", function() vim.cmd('ls') end)      -- list buffers
vim.keymap.set("n", "<leader>ch", function() vim.cmd('changes') end) -- Shows Changes in current buffer

-- Switch from Terminal to previous buffer
vim.keymap.set("t", "<Escape>", '<C-\\><C-n>:lua vim.cmd(\'bp\')<CR>', { noremap = true, silent = true })

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
