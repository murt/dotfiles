(module utils
  {require {nvim aniseed.nvim}})

(def config-path (nvim.fn.stdpath "config"))

(defn glob [path]
  (nvim.fn.glob path true true true))
