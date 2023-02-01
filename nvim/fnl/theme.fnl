(module theme {require {nvim aniseed.nvim : gotham : lualine : tabline : tint}})

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

;;Status
(lualine.setup {:options {:disabled_filetypes [:SidebarNvim]}
                :tabline {:lualine_a {}
                          :lualine_b {}
                          :lualine_c {}
                          ;;:lualine_c [(. (require :tabline) :tabline_buffers)]
                          :lualine_x [(. (require :tabline) :tabline_tabs)]
                          :lualine_y {}
                          :lualine_z {}}})

;;No cursor line
(nvim.ex.set :nocursorline)
