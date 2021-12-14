"Determine the correct path to plugins
let plugin_path='$HOME/.local/share/nvim/plugins'
if has('win32')
    let plugin_path='$HOME/AppData/nvim-share/plugins'
endif

"Load plugins
call plug#begin(plugin_path)

Plug 'christianchiarulli/nvcode-color-schemes.vim'

Plug 'nvim-treesitter/nvim-treesitter'

Plug 'tpope/vim-fugitive'

Plug 'itchyny/lightline.vim'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'guns/vim-sexp'

Plug 'tpope/vim-sexp-mappings-for-regular-people'

Plug 'tpope/vim-repeat'

Plug 'tpope/vim-surround'

Plug 'easymotion/vim-easymotion'

Plug 'ervandew/supertab'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }

Plug 'tpope/vim-eunuch'

Plug 'ntpeters/vim-better-whitespace'

Plug 'rust-lang/rust.vim'

Plug 'dag/vim-fish'

Plug 'voldikss/vim-floaterm'

Plug 'vim-syntastic/syntastic'

if has('mac')
    Plug 'keith/swift.vim'
endif

Plug 'junegunn/goyo.vim'

Plug 'junegunn/limelight.vim'

Plug 'Shougo/echodoc.vim'

if has('win32')
    Plug 'fsharp/vim-fsharp', { 'for': 'fsharp', 'do': 'install.cmd' }
else
    Plug 'fsharp/vim-fsharp', { 'for': 'fsharp', 'do': 'make' }
endif

Plug 'OmniSharp/omnisharp-vim', { 'for': 'cs' }

if executable('npm')
    Plug 'prettier/vim-prettier', { 'do': 'npm install' }
endif

Plug 'HerringtonDarkholme/yats.vim'

Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

Plug 'mhinz/vim-startify'

Plug 'preservim/nerdtree'

Plug 'spolu/dwm.vim'

call plug#end()

"Coc Plugins
let g:coc_global_extensions=['coc-json', 'coc-css', 'coc-html', 'coc-tsserver', 'coc-rust-analyzer', 'coc-fsharp', 'coc-omnisharp']

"Omnisharp
"If not on Windows it's possible to use the much fast stdio channel
"Also use the installed mono on Macs - it may be required to set
"FrameworkPathOverride environment variable to something like
"/usr/local/lib/mono/4.7.1-api in case of a framework mismatch
if !has('win32')
    let g:OmniSharp_server_stdio=1
    if has('mac')
        let g:OmniSharp_server_use_mono=1
    endif
else
    let g:OmniSharp_server_stdio=0
endif
let g:OmniSharp_server_type='roslyn'
let g:OmniSharp_selector_ui='ctrlp'
let g:OmniSharp_highlight_types=3
let g:OmniSharp_timeout=10
let g:syntastic_cs_checkers = ['code_checker']


"Echodoc
let g:echodoc#enable_at_startup=1

"Supertab
"Change the completion type so that it starts at the top
let g:SuperTabDefaultCompletionType='context'
let g:SuperTabContextDefaultCompletionType="<c-x><c-o>"
let g:SuperTabDefaultCompletionTypeDiscovery=["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
let g:SuperTabClosePreviewOnPopupClose=1

"Ctrl-P
let g:ctrlp_custom_ignore={
            \ 'dir': '\v[\/](node_modules|target|dist|bin|obj|Library|Temp)',
            \ 'file': '\v\.(exe|so|dll|lock|log|meta|cache|unity|asset)$',
            \}

"Floaterm
let g:floaterm_width=0.75
let g:floaterm_height=0.75
let g:floaterm_position='center'
"let g:floaterm_borderchars=['', '', '', '', '', '', '', '']

"Goyo / Limelight
function! s:goyo_enter()
endfunction

function! s:goyo_exit()
endfunction

"Swift
if has('mac')
    let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']
endif

