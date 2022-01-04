(module theme
  {require {nvim aniseed.nvim}})

;;Always show status bar
(set nvim.o.laststatus 2)

;;Hide mode as it is part of status line now
(nvim.ex.set "noshowmode")

;;Allow bold fonts
(set nvim.g.enable_bold_font 1)
