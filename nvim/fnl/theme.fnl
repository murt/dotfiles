(module theme {require {nvim aniseed.nvim : lualine : tabline}})

;;Always show status bar
(set nvim.o.laststatus 2)

;;Hide mode as it is part of status line now
(nvim.ex.set :noshowmode)

;;Allow bold fonts
(set nvim.g.enable_bold_font 1)

;;Theme Colours
(set nvim.g.tokyonight_style :night)
(set nvim.colorscheme :tokyonight)

;;Status
(lualine.setup {:options {:theme :tokyonight :disabled_filetypes [ :SidebarNvim ] }
                :tabline {:lualine_a {}
                          :lualine_b {}
                          :lualine_c {}
                          ;;:lualine_c [(. (require :tabline) :tabline_buffers)]
                          :lualine_x [(. (require :tabline) :tabline_tabs)]
                          :lualine_y {}
                          :lualine_z {}}})

;;No cursor line
(nvim.ex.set :nocursorline)
