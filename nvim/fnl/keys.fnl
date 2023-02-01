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
(kymp :n :<leader>t ":TablineTabNew<CR>")
(kymp :n :<leader>w ":tabclose<CR>")
(kymp :n "<leader>[" ":tabprev<CR>")
(kymp :n "<leader>]" ":tabnext<CR>")

;;Splits
(kymp :n :<C-N> ":lua require('dwm').new()<CR>")
(kymp :n :<C-J> :<C-w>w)
(kymp :n :<C-K> :<C-w>W)
(kymp :n :<C-H> ":lua require('dwm').shrink()<CR>")
(kymp :n :<C-L> ":lua require('dwm').grow()<CR>")
(kymp :n :<C-Space> ":lua require('dwm').focus()<CR>")
(kymp :n :<C-S-J> ":lua require('dwm').rotateRight()<CR>")
(kymp :n :<C-S-K> ":lua require('dwm').rotateLeft()<CR>")

;;Vertical Navigation Across Wrapped Lines
(kymp :n :j :gj)
(kymp :n :k :gk)

;;Format
;;(kymp :n "FF" "gg=G``")
(kymp :n :FF "<cmd>lua vim.lsp.buf.format({ async = true })<CR>")

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
