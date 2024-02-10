(module init
  {require {core aniseed.core
            nvim aniseed.nvim
            : neoconf
            : mason
            mason_lspconfig :mason-lspconfig
            mason_tool_installer :mason-tool-installer
            }})

;; Neoconf needs to be setup before anything
(neoconf.setup)

;; Mason needs to be connected and tools installed
(mason.setup)
(mason_tool_installer.setup { :ensure_installed [
    ;; Language Servers
    :lua_ls :fennel_language_server :rust_analyzer :pyright
    ;; Formatters
    :black
    :sqlfmt
]})
(mason_lspconfig.setup { :automatic_installation true })

(require :utils)
(require :editor)
(require :keys)
(require :theme)
(require :filetypes)
(require :completion)
