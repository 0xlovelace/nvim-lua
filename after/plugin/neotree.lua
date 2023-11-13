-- Neo Tree Config
--
function SetBufferRoot()
    local current_file_path = vim.fn.shellescape(vim.fn.expand('%:p:h'))
    local git_root = vim.fn.system('git -C ' .. current_file_path .. ' rev-parse --show-toplevel 2>/dev/null')
    if git_root ~= '' then
        vim.cmd('Neotree ' .. git_root)
    else
        print('Not a Git repository. Setting to the root of the current file.')
        vim.cmd('Neotree ' .. current_file_path)
    end
end

function CloseNeotree()
    -- Check if Neotree is open
    if vim.fn.exists(':NvimTreeToggle') == 1 and vim.fn.nvim_tree_get_state().window ~= 0 then
        vim.cmd('NvimTreeClose')
    end
end

vim.keymap.set('n', '<leader>ng', function() SetBufferRoot() end, { noremap = true, silent = true })

-- Set up an autocmd to call the function on BufEnter
vim.api.nvim_exec([[autocmd BufEnter * lua CloseNeotree()]], false)

require('neo-tree').setup({
    close_if_last_window = true,
    follow_current_file = true,
    window = {
        position = "right"
    },
    event_handlers = {
        {
            event = "file_opened",
            handler = function(file_path)
                -- auto close
                -- vimc.cmd("Neotree close")
                -- OR
                require("neo-tree.command").execute({ action = "close" })
            end
        },
    }
})
