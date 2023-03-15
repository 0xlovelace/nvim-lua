local set = vim.opt

set.nu = true
set.relativenumber = true

set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true

set.smartindent = true

set.wrap = false

set.cursorline = true

set.swapfile = false
set.backup = false
set.writebackup = false
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true

set.hlsearch = false
set.incsearch = true

set.scrolloff = 12
set.signcolumn = "yes"
set.isfname:append("@-@")

set.updatetime = 50
set.clipboard = "unnamedplus"

vim.g.markdown_fenced_languages = {
    "ts=typescript"
}
