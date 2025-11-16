local utils = require("utils")

-- Set the leader key before lazy
vim.g.mapleader = ","

-- Backspace behaviour
vim.opt.backspace = "indent,eol,start"

-- Keymapper utility
local function kymp (mode, seq, cmd, opts)
    vim.keymap.set(mode, seq, cmd, utils.merge({ silent = true }, opts or {}))
end

local function nkymp (seq, cmd, opts)
    kymp("n", seq, cmd, opts)
end

local function ikymp (seq, cmd, opts)
    kymp("i", seq, cmd, opts)
end

-- Normal mode escaping
ikymp("jk", "<Esc>")

-- Faster command entry
nkymp(";", ":", { silent = false })

-- Disable macros
nkymp("Q", "<nop>")
nkymp("q", "<nop>")

-- Unhilight Searches
nkymp("<Leader>/", ":nohlsearch<CR>")

-- Window Navigation
nkymp("<C-j>", "<C-W>w")
nkymp("<C-k>", "<C-W>W")
nkymp("<C-n>", ":vertical botright split<CR>")
nkymp("<Leader>t", ":tabnew<CR>")
nkymp("<Leader>[", ":tabprevious<CR>")
nkymp("<Leader>]", ":tabnext<CR>")

-- Mouse Menu
vim.cmd([[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]])
vim.cmd([[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]])
-- vim.cmd [[:amenu 10.120 mousemenu.-sep- *]]
vim.keymap.set("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
