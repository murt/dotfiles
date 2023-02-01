(module filetypes {require {nvim aniseed.nvim
                            treesitter nvim-treesitter.configs
                            null_ls null-ls
                            rt rust-tools
                            : lspconfig}
                   require-macros [macros]})

;;Setup treesitter

;; fnlfmt: skip
(treesitter.setup {
    :ensure_installed [
          :fennel
          :vim
          :c
          :javascript
          :ruby
          :rust
          :typescript
          :python]
    :highlight {:enable true}
    :indent {:enable true}
    :incremental_search {:enable true}})

;;Rust
(rt.setup {:tools {:inlay_hints {:auto false}} :server {}})

;;Python (via pyright)
(if (executable! :pyright)
  (lspconfig.pyright.setup {}))

;;Null-ls
(local sources [
  (if (executable! :fnlfmt) null_ls.builtins.formatting.fnlfmt)
  (if (executable! :black) null_ls.builtins.formatting.black)
])

(null_ls.setup {:sources sources})

;;Disable the *stupid* <C-c> SQL completion
(set nvim.g.omni_sql_default_compl_type :syntax)
