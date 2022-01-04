(module keys
  {require {nvim aniseed.nvim}})

(defn- kymp [mode from to]
  (nvim.set_keymap mode from to {:noremap true}))

(set nvim.g.mapleader ",")

(set nvim.g.backspace 2)

(kymp :n ";" ":")

(kymp :i :jk :<esc>)

(kymp :n "<leader>t" ":tabnew<CR>")
(kymp :n "<leader>w" ":tabclose<CR>")
(kymp :n "<leader>[" ":tabprev<CR>")
(kymp :n "<leader>]" ":tabnext<CR>")
