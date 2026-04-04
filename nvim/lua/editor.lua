-- Line Numbers
vim.opt.number = true

-- Show tabline
vim.o.showtabline = 2

-- Spaces
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.copyindent = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Searching
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Backup
vim.opt.backupdir = vim.fn.stdpath("state") .. "/backup"
vim.opt.backup = true

-- Swap
vim.opt.directory = vim.fn.stdpath("cache") .. "/swap"
vim.opt.swapfile = true

-- Undo
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo"
vim.opt.undofile = true

-- Mouse
vim.opt.mouse = "a"
