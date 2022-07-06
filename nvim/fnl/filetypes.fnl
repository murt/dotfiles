(module filetypes {require {nvim aniseed.nvim
                            treesitter nvim-treesitter.configs
                            : lspconfig
                            lsputil :lspconfig/util
                            null_ls null-ls}
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
(if (executable! :rust-analyzer)
    (lspconfig.rust_analyzer.setup {}))

;;(augroup! rust)

;;Ruby
(if (executable! :solargraph)
    (lspconfig.solargraph.setup {}))

;;Typescript
(if (executable! :typescript-language-server)
    (lspconfig.tsserver.setup {}))

;;Python
;;If there is a globally installed python from asdf set it as the provider
;;executable check will not work as it's unreliable on symlinks
(if (exists! :$HOME/.asdf/shims/python)
    (set nvim.g.python3_host_prog :$HOME/.asdf/shims/python))

;;Enabling black formatter requires disabling pyrights formatter as they will conflict

;; fnlfmt: skip
(defn- black_attach [client]
  (set client.resolved_capabilities.document_formatting false)
  (set client.resolved_capabilities.document_range_formatting false))

;;Enable jedi-language-server and attach the black formatter
(if (executable! :jedi-language-server)
    (lspconfig.jedi_language_server.setup {:on_attach black_attach}))

;;Null-ls
(null_ls.setup {:sources [null_ls.builtins.formatting.prettier
                          null_ls.builtins.formatting.black
                          null_ls.builtins.formatting.fnlfmt]})

;;Disable the *stupid* <C-c> SQL completion
(set nvim.g.omni_sql_default_compl_type :syntax)
