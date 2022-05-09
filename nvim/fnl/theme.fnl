(module theme
  {require {nvim aniseed.nvim}})

;;Always show status bar
(set nvim.o.laststatus 2)

;;Hide mode as it is part of status line now
(nvim.ex.set "noshowmode")

;;Allow bold fonts
(set nvim.g.enable_bold_font 1)

;;Theme Colours
(set nvim.g.tokyonight_style "night")
(set nvim.colorscheme "tokyonight")

;;Lightline
(set nvim.g.lightline {
                       :colorscheme "tokyonight"
                       :component_function { :gitbranch "FugitiveHead" }
                       :active { :left [ [ "mode" "paste" ] [ "gitbranch" "readonly" "filename" "modified" ] ] } })
