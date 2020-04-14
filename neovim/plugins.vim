"Determine the correct path to plugins
let plugin_path='$HOME/.local/share/nvim/plugins'
if has('win32')
    let plugin_path='$HOME/AppData/nvim-share/plugins'
endif

"Load plugins
call plug#begin(plugin_path)

Plug 'tpope/vim-fugitive'

Plug 'morhetz/gruvbox'

Plug 'itchyny/lightline.vim'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'easymotion/vim-easymotion'

Plug 'zhaocai/GoldenView.Vim'

Plug 'ervandew/supertab'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }

Plug 'tpope/vim-eunuch'

Plug 'ntpeters/vim-better-whitespace'

Plug 'rust-lang/rust.vim'

Plug 'dag/vim-fish'

Plug 'voldikss/vim-floaterm'

Plug 'vim-syntastic/syntastic'

Plug 'Shougo/echodoc.vim'

if has('win32')
    Plug 'fsharp/vim-fsharp', { 'for': 'fsharp', 'do': 'install.cmd' }
else
    Plug 'fsharp/vim-fsharp', { 'for': 'fsharp', 'do': 'make' }
endif

if has('win32')
    Plug 'OmniSharp/omnisharp-vim', { 'for': 'cs' }
endif

if executable('npm')
    Plug 'prettier/vim-prettier', { 'do': 'npm install' }
endif

Plug 'HerringtonDarkholme/yats.vim'

Plug 'mhinz/vim-startify'

Plug 'preservim/nerdtree'

call plug#end()

"Coc Plugins
let g:coc_global_extensions=['coc-json', 'coc-css', 'coc-html', 'coc-tsserver', 'coc-rls', 'coc-fsharp']

"Omnisharp
if has('win32')
    "let g:OmniSharp_server_stdio=1
    let g:OmniSharp_server_type='roslyn'
    let g:OmniSharp_selector_ui='ctrlp'
    let g:OmniSharp_highlight_types=3
    let g:OmniSharp_timeout=10
    let g:syntastic_cs_checkers = ['code_checker']
    let g:coc_global_extensions = coc_global_extensions + ['coc-omnisharp']
endif

"Echodoc
let g:echodoc#enable_at_startup=1

"Supertab
"Change the completion type so that it starts at the top
let g:SuperTabDefaultCompletionType='<C-X><C-O>'

"Ctrl-P
let g:ctrlp_custom_ignore={
            \ 'dir': '\v[\/](node_modules|target|dist|bin|obj|Library)',
            \ 'file': '\v\.(exe|so|dll|lock|log|meta|cache|unity)$',
            \}

"Floaterm
let g:floaterm_width=0.75
let g:floaterm_height=0.75
let g:floaterm_position='center'
let g:floaterm_borderchars=['', '', '', '', '', '', '', '']
