(module filetypes 
  {require {
            nvim aniseed.nvim
            treesitter nvim-treesitter.configs
            : lspconfig
            }})

;;Setup treesitter
(treesitter.setup {
                   :ensure_installed ["fennel" "vim" "c" "javascript" "rust" "typescript"]
                   :highlight { :enable true }
                   :indent { :enable true }
                   :incremental_search { :enable true }
                   })

;;Rust
(lspconfig.rust_analyzer.setup {})

