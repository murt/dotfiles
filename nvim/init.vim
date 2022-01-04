"Force the shell to be sh if it is launched from fish
if &shell =~# 'fish$'
    set shell=sh
endif

"Determine the correct path to plugins
let plugin_path='$HOME/.local/share/nvim/plugins'
if has('win32')
    let plugin_path='$HOME/AppData/nvim-share/plugins'
endif

"Load plugins
call plug#begin(plugin_path)

"Enable Fennel Config
Plug 'Olical/aniseed'

"Language Server
Plug 'neovim/nvim-lspconfig'

"Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

"Status
Plug 'itchyny/lightline.vim'

"Motion
Plug 'easymotion/vim-easymotion'

call plug#end()

"lua require('aniseed.env').init()
let g:aniseed#env = v:true
