local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>am", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>a1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>a2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>a3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>a4", function() ui.nav_file(4) end)
