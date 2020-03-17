"Force the shell to be sh if it is launched from fish
if &shell =~# 'fish$'
    set shell=sh
endif

"Load Plugins first
runtime plugins.vim

"Setup the editor
runtime editor.vim

"Load Theme
runtime theme.vim

"Load Keybindings
runtime keys.vim

"Load Filetypes
runtime filetypes.vim
