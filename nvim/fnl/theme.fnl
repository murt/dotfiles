(module theme {require {nvim aniseed.nvim
                        : gotham
                        : lualine
                        : tint
                        tabby tabby.tabline}})

;;Always show status bar
(set nvim.o.laststatus 2)

;;Hide mode as it is part of status line now
(nvim.ex.set :noshowmode)

;;Allow bold fonts
(set nvim.g.enable_bold_font 1)

;;Theme Colours
;;(set nvim.colorscheme :base16-gotham)
(gotham.setup {})
(tint.setup {})

;;Tabs
(tabby.use_preset :active_wins_at_tail {:nerdfont true})

;; Function to filter out nvim-tree from tabby
(defn not_nvim_tree [win] (not (string.find (win.buf_name) :NvimTree)))

(tabby.set (fn [line]
             ((. (line.wins not_nvim_tree) :foreach) (fn [x]
                                                       [(x.buf_name)
                                                        {:hl :Fill}])))
           {})

;;Status
(lualine.setup {:options {:disabled_filetypes [:nofile :NvimTree]}})
;;:tabline {:lualine_a {}
;;          :lualine_b {}
;;          :lualine_c {}
;;          ;;:lualine_c [(. (require :tabline) :tabline_buffers)]
;;          ;;:lualine_x [(. (require :tabline) :tabline_tabs)]
;;          :lualine_y {}
;;          :lualine_z {}}})

;;No cursor line
(nvim.ex.set :nocursorline)
