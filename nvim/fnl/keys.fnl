(module keys {require {core aniseed.core nvim aniseed.nvim}})

;;Maps a key in a mode - disallows remapping and is by default silent.
(defn- kymp [mode from to ?opts]
       (nvim.set_keymap mode from to
                        (core.concat {:noremap true} (or ?opts {:silent true}))))

;;Leader
(set nvim.g.mapleader ",")

;;Backspace best behaviour
(set nvim.o.backspace "indent,eol,start")

;;Disable ex and macros mode
(kymp :n :Q :<nop>)
(kymp :n :q :<nop>)

;;Faster Command Entry
(kymp :n ";" ":" {:silent false})

;;Faster Escape in Insert Mode
(kymp :i :jk :<esc>)

;;Undo/Redo
(kymp :n :<C-Z> :u)
(kymp :i :<C-Z> :<C-O>u)
(kymp :n :<C-Y> :<C-R>)
(kymp :i :<C-Y> :<C-O><C-R>)

;;Tabs
(kymp :n :<leader>t ":tabnew<CR>")
(kymp :n :<leader>w ":tabclose<CR>")
(kymp :n "<leader>[" ":tabprev<CR>")
(kymp :n "<leader>]" ":tabnext<CR>")

;;Splits
(kymp :n :<C-N> ":FocusSplitNicely<CR>")
(kymp :n :<C-space> ":FocusToggle<CR>")
;;(kymp :n :<C-H> ":FocusSplitLeft<CR>")
;;(kymp :n :<C-J> ":FocusSplitDown<CR>")
;;(kymp :n :<C-K> ":FocusSplitUp<CR>")
;;(kymp :n :<C-L> ":FocusSplitRight<CR>")
(kymp :n :<C-J> :<C-W><C-J>)
(kymp :n :<C-K> :<C-W><C-K>)

;;Vertical Navigation Across Wrapped Lines
(kymp :n :j :gj)
(kymp :n :k :gk)

;;Format
;;(kymp :n "FF" "gg=G``")
(kymp :n :FF "<cmd>lua vim.lsp.buf.formatting()<CR>")

;;LSP rename symbol
(kymp :n :<leader>r "<cmd>lua vim.lsp.buf.rename()<CR>")

;;Faster Clearing of Search Highlights
(kymp :n :<leader>/ ":nohlsearch<CR>")

;;Tree
(kymp :n :<leader>e ":NvimTreeToggle<CR>")

;;Finder
(kymp :n :<C-P> ":Telescope git_files<CR>")
