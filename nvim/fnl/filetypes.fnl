(module filetypes {require {nvim aniseed.nvim
                            treesitter nvim-treesitter.configs
                            null_ls null-ls
                            rt rust-tools
                            ts_rainbow ts-rainbow
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
    :rainbow { :enable true :query :rainbow-parens :strategy ts_rainbow.strategy.global }
    :highlight {:enable true}
    :indent {:enable true}
    :incremental_search {:enable true}})

;;Lua
(lspconfig.lua_ls.setup {})

;;Fennel
(lspconfig.fennel_language_server.setup {})

;;Rust
(rt.setup {:tools {:inlay_hints {:auto false}} :server {}})

;;Python (via pyright)
(if (and (executable! :asdf) (executable! :tr))
  (set nvim.g.python3_host_prog (nvim.fn.system "asdf which python3 | tr -d '\\n'")))

(lspconfig.pyright.setup {})

;;Null-ls
(local sources
       [(if (executable! :fnlfmt) null_ls.builtins.formatting.fnlfmt)
        (if (executable! :black) null_ls.builtins.formatting.black)
        (if (executable! :sqlfmt) null_ls.builtins.formatting.sqlfmt)])

(null_ls.setup {: sources})

;;Disable the *stupid* <C-c> SQL completion
(set nvim.g.omni_sql_default_compl_type :syntax)
