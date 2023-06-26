(module theme {require {nvim aniseed.nvim : gotham : lualine : tint}})

;;Always show status bar
(set nvim.o.laststatus 2)

;;Hide mode as it is part of status line now
(nvim.ex.set :noshowmode)

;;Allow bold fonts
(set nvim.g.enable_bold_font 1)

;;Theme Colours
(nvim.ex.set :termguicolors)
(gotham.setup {})
(tint.setup {})

;;Status
(lualine.setup {:options {:disabled_filetypes [:nofile :NvimTree]}})

;;No cursor line
(nvim.ex.set :nocursorline)
