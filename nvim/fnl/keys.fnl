(module keys {require {core aniseed.core nvim aniseed.nvim : lsp_lines}})

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
(kymp :n :<leader>t ":TablineTabNew<CR>")
(kymp :n :<leader>w ":tabclose<CR>")
(kymp :n "<leader>[" ":tabprev<CR>")
(kymp :n "<leader>]" ":tabnext<CR>")

;;Splits
(kymp :n :<C-N> ":vsplit<CR>")
(kymp :n :<C-M> ":split<CR>")
(kymp :n :<C-H> :<C-W><C-H>)
(kymp :n :<C-J> :<C-W><C-J>)
(kymp :n :<C-K> :<C-W><C-K>)
(kymp :n :<C-L> :<C-W><C-L>)

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
(kymp :n :<leader>e ":SidebarNvimToggle<CR>")

;;Finder
(kymp :n :<C-P> ":Telescope git_files<CR>")

;;Diagnostics (inline toggle)
(kymp :n :<leader>l ":lua require('lsp_lines').toggle()<CR>")
