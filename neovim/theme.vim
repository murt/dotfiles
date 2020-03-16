"Set the colours, this undoes highlights and other style properties so they
"must be reset below.
colorscheme gruvbox

"Transparent background
hi Normal ctermfg=255 ctermbg=none

"Comments will always be italic
hi Comment cterm=italic gui=italic

"Allow usage of bold font where apprioriate
let g:enable_bold_font=1

"Always show the status line
set laststatus=2

"Hide the mode as it is part of the status line now
set noshowmode

"Lightline theming
let g:lightline = {
            \ 'colorscheme': 'gruvbox',
            \ 'active': {
            \ 	'left': [ ['mode', 'paste' ],
            \ 		  ['gitbranch', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'component_function': {
            \ 	'gitbranch': 'FugitiveHead'
            \ },
            \}
