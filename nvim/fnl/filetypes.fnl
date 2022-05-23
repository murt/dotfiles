(module filetypes 
  {require {
            nvim aniseed.nvim
            treesitter nvim-treesitter.configs
            : lspconfig
            null_ls null-ls
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
(if (executable! "rust-analyzer")
  (lspconfig.rust_analyzer.setup {}))

;;(augroup! rust)

;;Ruby
(if (executable! "solargraph")
  (lspconfig.solargraph.setup {}))

;;Typescript
(if (executable! "typescript-language-server")
  (lspconfig.tsserver.setup {}))

;;Null-ls
(null_ls.setup { :sources [null_ls.builtins.formatting.prettier] })

;;Disable the *stupid* <C-c> SQL completion
(set nvim.g.omni_sql_default_compl_type "syntax")
