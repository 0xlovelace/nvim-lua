-- Global Keys
vim.g.mapleader = " "
vim.keymap.set("n", "<C-t>", function() vim.cmd 'Neotree' end)

-- Cycle Through Buffers
vim.keymap.set("n", "<leader>bn", function() vim.cmd('bn') end)
vim.keymap.set("n", "<leader>bp", function() vim.cmd('bp') end)
vim.keymap.set("n", "<leader>bw", function() vim.cmd('bw') end)

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
