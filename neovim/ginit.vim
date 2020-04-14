" nvim-qt
if exists('g:GuiLoaded')
    GuiFont! Dank Mono:h10
    GuiTabline 0
    GuiPopupmenu 0
endif

if exists('g:fvim_loaded')
    set termguicolors
    set guifont='Dank\ Mono:h14'

    " Cursor tweaks
    FVimCursorSmoothBlink v:true

    " Background composition, can be 'none', 'blur' or 'acrylic'
    FVimBackgroundComposition 'none'
    FVimBackgroundOpacity 0.85
    FVimBackgroundAltOpacity 0.85

    " Title bar tweaks (themed with colorscheme)
    FVimCustomTitleBar v:false

    " Debug UI overlay
    FVimDrawFPS v:false
    " Font debugging -- draw bounds around each glyph
    FVimFontDrawBounds v:false

    " Font tweaks
    FVimFontAntialias v:true
    FVimFontAutohint v:true
    FVimFontHintLevel 'full'
    FVimFontSubpixel v:true
    FVimFontLigature v:true
    FVimFontLcdRender v:false
    " can be 'default', '14.0', '-1.0' etc.
    FVimFontLineHeight '+2.0'

    " Try to snap the fonts to the pixels, reduces blur
    " in some situations (e.g. 100% DPI).
    FVimFontAutoSnap v:false

    " Font weight tuning, possible valuaes are 100..900
    FVimFontNormalWeight 400
    FVimFontBoldWeight 700

    FVimUIPopupMenu v:false
endif
