(module keys {
              require {
                       core aniseed.core
                       nvim aniseed.nvim
                       : utils
              }
              require-macros [macros]
              }
  )

;;Maps a key in a mode - disallows remapping and is by default silent.
;;TODO: This can probably be switched to fn
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
(kymp :n :<C-z> :u)
(kymp :i :<C-z> :<C-O>u)
(kymp :n :<C-y> :<C-R>)
(kymp :i :<C-y> :<C-O><C-R>)

;;Tabs
(kymp :n :<leader>t ":tabnew<CR>")
(kymp :n :<leader>w ":tabclose<CR>")
(kymp :n "<leader>[" ":tabprev<CR>")
(kymp :n "<leader>]" ":tabnext<CR>")

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

;;Finder
(if (utils.isgit)
  (kymp :n :<C-p> ":Telescope git_files<CR>")
  (kymp :n :<C-p> ":Telescope find_files<CR>")
)

(if (executable! :rg)
    (kymp :n :<leader>f ":Telescope live_grep<CR>")
    (kymp :n :<leader>f ":Telescope grep_string<CR>"))

;;Diagnostics (inline toggle)
(kymp :n :<leader>l ":lua require('lsp_lines').toggle()<CR>")
