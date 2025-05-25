(module editor {require {nvim aniseed.nvim
                         tree :nvim-tree
                         tree_api :nvim-tree.api
                         drawer :nvim-drawer
                         map :cartographer
                         : Comment
                         : bufferline
                         : gitsigns
                         : fidget
                         : telescope
                         : lsp_lines
                         : edgy
                         }})

(set nvim.o.hidden true)

(set nvim.o.encoding :utf-8)

;; Disable netrw
(set nvim.g.loaded_netrw 1)
(set nvim.g.loaded_netrwPlugin 1)

;; Title
(set nvim.o.title true)
(set nvim.o.autoread true)

;; Splits and extra chars
(lua "vim.cmd('highlight clear VertSplit')")
(lua "vim.cmd('highlight clear SignColumn')")
(lua "vim.cmd('set fcs=eob:\\\\ ')")

;; Line Numbers
(set nvim.o.number true)

;; Spaces
(set nvim.o.expandtab true)
(set nvim.o.smarttab true)
(set nvim.o.autoindent true)
(set nvim.o.copyindent true)
(set nvim.o.softtabstop 4)
(set nvim.o.shiftwidth 4)
(set nvim.o.tabstop 4)

;; Incremental Highlight Search
(set nvim.o.incsearch true)
(set nvim.o.hlsearch true)

;; No Backup / Swapfile
(set nvim.g.nobackup true)
(set nvim.g.noswapfile true)

;; Mouse
(set nvim.o.mouse :a)

;; Buffer / Tab line
(bufferline.setup {:options {:mode :tabs
                             :separator_style :padded_slant
                             :diagnostics :nvim_lsp}})

;; Layout
(edgy.setup {})

;; Tree
(tree.setup {})

(drawer.setup)
(drawer.create_drawer {
                       :size 40
                       :position :left
                       :should_reuse_previous_bufnr false
                       :should_close_on_bufwipeout true

                       ; Keymap for toggling
                       :on_vim_enter (fn [evt]
                                       (evt.instance.open { :focus false })
                                       ; Using cartographer here for function binding - this will focus or toggle
                                       (tset map.n.nore.silent :<leader>e evt.instance.toggle)
                                       )

                       ; Generate event structure
                       :on_did_create_buffer (fn []
                                               (tree_api.tree.open { :current_window true })
                                               )
                       :on_did_open (fn []
                                      (tree_api.tree.reload)
                                      (set nvim.o.number false)
                                      (set nvim.o.signcolumn :no)
                                      (set nvim.o.statuscolumn "")
                                      )
                       :on_did_close (fn []
                                      (tree_api.tree.close)
                                      )
                       })

;; Gutter
(gitsigns.setup)

;; LSP Progress in status bar
(fidget.setup {})

;; LSP inline
(lsp_lines.setup {})
(lua "vim.diagnostic.config({virtual_text = false, virtual_lines = true})")

;; Telescope Finder
(telescope.setup {})

;; Comments
(Comment.setup {})

;;Edgy
(edgy.setup {})
