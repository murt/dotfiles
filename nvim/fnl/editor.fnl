(module editor {require {nvim aniseed.nvim
                         tree nvim-tree
                         mason mason
                         masonlsp mason-lspconfig
                         masontool mason-tool-installer
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
(set nvim.o.tabstop 4)

;;Incremental Highlight Search
(set nvim.o.incsearch true)
(set nvim.o.hlsearch true)

;;No Backup / Swapfile
(set nvim.g.nobackup true)
(set nvim.g.noswapfile true)

;;Tree
(tree.setup {})

;;Language server installs
(local ensure_installed [
                         ;; Language Servers
                         "jedi-language-server"
                         "rust-analyzer"
                         "typescript-language-server"
                         "gopls"
                         ;; Linters
                         "flake8"
                         ;; Formatters
                         "black"
                         "prettier"
                         ])
(mason.setup {})
(masonlsp.setup {:automatic_installation true
                 :ensure_installed ensure_installed})
(masontool.setup { :ensure_installed ensure_installed :auto_update true })

;;LSP Progress in status bar
(fidget.setup {})

;;LSP inline
(lsp_lines.setup {})
(lua "vim.diagnostic.config({virtual_text = false, virtual_lines = true})")

;;Telescope Finder
(telescope.setup {})
