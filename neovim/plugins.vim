"Determine the correct path to plugins
let plugin_path='$HOME/.local/share/nvim/plugins'
if has('win32')
    let plugin_path='./plugins'
endif

"Load plugins
call plug#begin(plugin_path)

Plug 'tpope/vim-fugitive'

Plug 'morhetz/gruvbox'

Plug 'itchyny/lightline.vim'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'easymotion/vim-easymotion'

Plug 'spolu/dwm.vim'

Plug 'ervandew/supertab'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }

Plug 'tpope/vim-eunuch'

Plug 'ntpeters/vim-better-whitespace'

Plug 'rust-lang/rust.vim'

Plug 'dag/vim-fish'

Plug 'vim-syntastic/syntastic'

Plug 'voldikss/vim-floaterm'

if has('win32')
    Plug 'fsharp/vim-fsharp', { 'for': 'fsharp', 'do': 'install.cmd' }
else
    Plug 'fsharp/vim-fsharp', { 'for': 'fsharp', 'do': 'make' }
endif

call plug#end()

"Coc Plugins
let g:coc_global_extensions=['coc-json', 'coc-css', 'coc-html', 'coc-tsserver', 'coc-rls', 'coc-fsharp']

"Supertab
"Change the completion type so that it starts at the top
let g:SuperTabDefaultCompletionType='<C-X><C-O>'

"Ctrl-P
let g:ctrlp_custom_ignore={
            \ 'dir': '\v[\/](node_modules|target)',
            \ 'file': '\v\.(exe|so|dll|lock|log)$',
            \}

"Floaterm
let g:floaterm_width=0.5
let g:float_height=0.5
let g:floaterm_position='center'
let g:floaterm_borderchars=['', '', '', '', '', '', '', '']
