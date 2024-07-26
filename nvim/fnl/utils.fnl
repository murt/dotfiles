(module utils
  {require {nvim aniseed.nvim} require-macros [macros] })

(def config-path (nvim.fn.stdpath "config"))

(defn glob [path]
  (nvim.fn.glob path true true true))

(defn isgit []
  (if (executable! :git)
    (= (nvim.eval "\"!git rev-parse --is-inside-work-tree\"") :true)
    false
  )
)
