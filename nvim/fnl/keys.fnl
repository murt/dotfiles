(module keys
  {require {
            core aniseed.core
            nvim aniseed.nvim}})

;;Maps a key in a mode - disallows remapping and is by default silent.
(defn- kymp [mode from to ?opts]
  (nvim.set_keymap mode from to (core.concat {:noremap true} (or ?opts {:silent true}))))

;;Leader
(set nvim.g.mapleader ",")

;;Backspace best behaviour
(set nvim.o.backspace "indent,eol,start")

;;Disable ex and macros mode
(kymp :n "Q" "<nop>")
(kymp :n "q" "<nop>")

;;Faster Command Entry
(kymp :n ";" ":" {:silent false})

;;Faster Escape in Insert Mode
(kymp :i :jk :<esc>)

;;Undo/Redo
(kymp :n "<C-Z>" "u")
(kymp :i "<C-Z>" "<C-O>u")
(kymp :n "<C-Y>" "<C-R>")
(kymp :i "<C-Y>" "<C-O><C-R>")

;;Tabs
(kymp :n "<leader>t" ":tabnew<CR>")
(kymp :n "<leader>w" ":tabclose<CR>")
(kymp :n "<leader>[" ":tabprev<CR>")
(kymp :n "<leader>]" ":tabnext<CR>")

;;Vertical Navigation Across Wrapped Lines
(kymp :n "j" "gj")
(kymp :n "k" "gk")

;;Format
(kymp :n "FF" "gg=G``")

;;Faster Clearing of Search Highlights
(kymp :n "<leader>/" ":nohlsearch<CR>")

;;Tree
(kymp :n "<leader>e" ":NvimTreeToggle<CR>")

;;Finder
(kymp :n "<C-P>" ":Telescope git_files<CR>")
