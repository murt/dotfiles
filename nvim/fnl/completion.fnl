(module completion {require {nvim aniseed.nvim
                             : lspconfig
                             : cmp
                             : cmp_nvim_lsp}
                    require-macros [macros]})

;;Supertab-like behaviour in nvim-cmp
(defn- supertab [fallback] (if (cmp.visible)
                               (cmp.select_next_item)
                               (fallback)))

;;nvim-cmp
(cmp.setup {:preselect cmp.PreselectMode.None
            :snippet {:expand (fn [args]
                                (nvim.fn.vsnip#anonymous args.body))}
            :mapping {:<Tab> (cmp.mapping supertab [:i :s])
                      :<CR> (cmp.mapping.confirm {:select true})}
            ;; Do not enable the omni completion, it forces autoinsertion and preview window for signatures / docs
            :sources (cmp.config.sources [{:name :nvim_lsp}
                                          {:name :nvim_lsp_signature_help}
                                          {:name :vsnip}
                                          {:name :buffer}])})

(if (executable! :rust_analyzer)
    ((. (. lspconfig :rust_analyzer) :setup) {:capabilities (cmp_nvim_lsp.default_capabilities)}))
