(module editor
  {require {
            nvim aniseed.nvim
            tree nvim-tree
            : fidget
            }})

(set nvim.o.hidden true)

(set nvim.o.encoding "utf-8")

;;Title
(set nvim.o.title true)

(set nvim.o.autoread true)
(set nvim.o.cursorline true)

;;Line Numbers
(set nvim.o.number true)

;;Spaces
(set nvim.o.expandtab true)
(set nvim.o.smarttab true)
(set nvim.o.autoindent true)
(set nvim.o.copyindent true)
(set nvim.o.softtabstop 4)
(set nvim.o.shiftwidth 4)

;;Incremental Highlight Search
(set nvim.o.incsearch true)
(set nvim.o.hlsearch true)

;;No Backup / Swapfile
(set nvim.g.nobackup true)
(set nvim.g.noswapfile true)

;;Tree
(tree.setup {})

;;LSP Progress in status bar
(fidget.setup {})

;;Custom Ctrl-p ignores
(set nvim.g.ctrlp_custom_ignore {
                                 :dir "\\v[\\/](node_modules|target|dist|bin|obj|Library|Temp)"
                                 :file "\\v\\.(exe|so|dll|lock|log|meta|cache|unity|asset)$"
                                 }
     )
