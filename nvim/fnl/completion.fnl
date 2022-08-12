(module completion {require {nvim aniseed.nvim : lspconfig : cmp}})

;;Supertab-like behaviour in nvim-cmp
(defn- supertab [fallback] (if (cmp.visible)
                               (cmp.select_next_item)
                               (fallback)))

;;nvim-cmp
(cmp.setup {:snippet {:expand (fn [args]
                                (nvim.fn.vsnip#anonymous args.body))}
            :mapping {:<Tab> (cmp.mapping supertab [:i :s])
                      :<CR> (cmp.mapping.confirm {:select true})}
            :sources (cmp.config.sources [{:name :nvim_lsp}
                                          {:name :vsnip}
                                          {:name :buffer}
                                          {:name :omni}])})
