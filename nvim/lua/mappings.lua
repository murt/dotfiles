require "nvchad.mappings"

local conform = require "conform"

-- Utilities
local function map(mode, seq, cmd, action, props)
  if type(action) ~= "function" then
    action = props
    props = nil
  end
  vim.keymap.set(mode, seq, cmd, action, props)
end

local function nmap(seq, cmd, action, props)
  map("n", seq, cmd, action, props)
end

local function imap(seq, cmd, action, props)
  map("i", seq, cmd, action, props)
end

-- Disable macros
nmap("Q", "<nop>")
nmap("q", "<nop>")

-- Command mode toggle
nmap(";", ":")
imap("jk", "<ESC>")

-- Undo / Redo
nmap("<C-z>", "u")
imap("<C-z>", "<C-O>u")
nmap("<C-y>", "<C-R>")
imap("<C-y>", "<C-O><C-R>")

-- Tabs
nmap("<leader>t", ":tabnew<CR>")
nmap("<leader>w", ":tabclose<CR>")
nmap("<leader>[", ":tabprev<CR>")
nmap("<leader>]", ":tabnext<CR>")

-- Formatter (WIP)
nmap("FF", function()
  conform.format {
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  }
end)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
