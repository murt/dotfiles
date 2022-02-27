(module filetypes 
  {require {
            nvim aniseed.nvim
            treesitter nvim-treesitter.configs
            : lspconfig
            }
   require-macros [macros]})

;;Setup treesitter
(treesitter.setup {
                   :ensure_installed ["fennel" "vim" "c" "javascript" "ruby" "rust" "typescript"]
                   :highlight { :enable true }
                   :indent { :enable true }
                   :incremental_search { :enable true }
                   })

;;Rust
(lspconfig.rust_analyzer.setup {})

;;(augroup! rust)

;;Ruby
(lspconfig.solargraph.setup {})
