"Determine the correct path to plugins
let plugin_path = '$HOME/.local/share/nvim/plugins'
if has('win32')
    let plugin_path = './plugins'
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

if has('win32')
    Plug 'ionide/Ionide-vim', {'do': 'install.cmd'}
else
    Plug 'ionide/Ionide-vim', {'do': 'make fsautocomplete'}
endif

call plug#end()

"Coc Plugins
let g:coc_global_extensions=['coc-json', 'coc-css', 'coc-html', 'coc-tsserver', 'coc-rls', 'coc-omnisharp']

"Supertab
"Change the completion type so that it starts at the top
let g:SuperTabDefaultCompletionType = '<C-X><C-O>'
