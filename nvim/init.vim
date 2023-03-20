set nocompatible

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

"Third-party
Plug 'nvim-lua/plenary.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-tree/nvim-web-devicons'

"Enable Fennel Config
Plug 'Olical/aniseed'

"Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'HiPhish/nvim-ts-rainbow2'

"Language Server
Plug 'neovim/nvim-lspconfig'
Plug 'j-hui/fidget.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'

"Typescript
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'

"Rust
Plug 'simrat39/rust-tools.nvim'

"Fish
Plug 'khaveesh/vim-fish-syntax'

"Statusline
Plug 'nvim-lualine/lualine.nvim'

"Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-omni'
Plug 'hrsh7th/nvim-cmp'

"Snippets
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

"Motion
Plug 'easymotion/vim-easymotion'

"Git
Plug 'tpope/vim-fugitive'

"UI
Plug 'kdheepak/tabline.nvim'
Plug 'sidebar-nvim/sidebar.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'delphinus/dwm.nvim'

"Misc
Plug 'tpope/vim-eunuch'

"Theme
Plug 'murt/gotham.nvim'
Plug 'levouh/tint.nvim'


call plug#end()

"Compile fennel into lua automatically
let g:aniseed#env = v:true

