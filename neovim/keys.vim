"Set leader to ',' as it is quicker and easier to reach
let g:mapleader=','

"Save a keystroke for commands
nnoremap ; :

"Escape to normal more quickly from the home row
inoremap jk <esc>

"Disable ex and macros mode (never use them)
nnoremap Q <nop>
map q <nop>

"Normalise backspace so it works like how it... should
set backspace=2

"Vertical navigation works across wrapped lines
nnoremap j gj
nnoremap k gk

"Tabs
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>w :tabclose<CR>
nnoremap <leader>[ :tabprevious<CR>
nnoremap <leader>] :tabnext<CR>

"Clear search highlights quickly
nmap <silent> <leader>/ :nohlsearch<CR>

"Undo/Redo
noremap <C-Z> u
inoremap <C-Z> <C-O>u
noremap <C-Y> <C-R>
inoremap <C-Y> <C-O><C-R>

"Formatting shortcut (TODO: See if this can be tied into specific formatters)
nnoremap FF gg=G``
