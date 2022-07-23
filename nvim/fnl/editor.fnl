(module editor {require {nvim aniseed.nvim
                         tree nvim-tree
                         : fidget
                         : telescope
                         : lsp_lines}})

(set nvim.o.hidden true)

(set nvim.o.encoding :utf-8)

;;Title
(set nvim.o.title true)

(set nvim.o.autoread true)

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

;;LSP inline
(lsp_lines.setup {})
(lua "vim.diagnostic.config({virtual_text = false, virtual_lines = true})")

;;Telescope Finder
(telescope.setup {})
