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
nnoremap <silent> <leader>t :tabnew<CR>
nnoremap <silent> <leader>w :tabclose<CR>
nnoremap <silent> <leader>[ :tabprevious<CR>
nnoremap <silent> <leader>] :tabnext<CR>

"Clear search highlights quickly
nmap <silent> <leader>/ :nohlsearch<CR>

"Undo/Redo
noremap <C-Z> u
inoremap <C-Z> <C-O>u
noremap <C-Y> <C-R>
inoremap <C-Y> <C-O><C-R>

"Formatting shortcut - see filetypes.vim for syntax specific formatters
nnoremap FF gg=G``

"Allow enter to be used in autocompletion
inoremap <expr> <cr> ((pumvisible())?("\<C-Y>"):("\<CR>"))

"PLUGINS

"GoldenView
let g:goldenview__enable_default_mapping=0
nmap <silent> <C-@>     :SwitchGoldenViewToggle<CR>
nmap <silent> <C-space> :SwitchGoldenViewToggle<CR>
nmap <silent> <C-N>     <Plug>GoldenViewSplit
nmap <silent> <C-K>     <Plug>GoldenViewPrevious
nmap <silent> <C-J>     <Plug>GoldenViewNext

"NERDTree
nnoremap <silent> <leader>e :NERDTreeToggle<CR>
