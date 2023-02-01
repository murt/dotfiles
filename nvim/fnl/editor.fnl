(module editor {require {nvim aniseed.nvim
                         sidebar sidebar-nvim
                         : gitsigns
                         : tabline
                         : fidget
                         : telescope
                         : lsp_lines
                         : dwm}})

(set nvim.o.hidden true)

(set nvim.o.encoding :utf-8)

;; Title
(set nvim.o.title true)
(set nvim.o.autoread true)

;; Splits and extra chars
(lua "vim.cmd('highlight clear VertSplit')")
(lua "vim.cmd('highlight clear SignColumn')")
(lua "vim.cmd('set fcs=eob:\\\\ ')")

;; Line Numbers
(set nvim.o.number true)

;; Spaces
(set nvim.o.expandtab true)
(set nvim.o.smarttab true)
(set nvim.o.autoindent true)
(set nvim.o.copyindent true)
(set nvim.o.softtabstop 4)
(set nvim.o.shiftwidth 4)
(set nvim.o.tabstop 4)

;; Incremental Highlight Search
(set nvim.o.incsearch true)
(set nvim.o.hlsearch true)

;; No Backup / Swapfile
(set nvim.g.nobackup true)
(set nvim.g.noswapfile true)

;; Mouse
(set nvim.o.mouse :a)

;; Tabs
(tabline.setup {:options {:show_tabs_only true}})

;; Sidebar
(sidebar.setup {:open false
                :hide_statusline true
                :sections [:files :diagnostics :symbols :git]})

;; Gutter
(gitsigns.setup)

;; LSP Progress in status bar
(fidget.setup {})

;; LSP inline
(lsp_lines.setup {})
(lua "vim.diagnostic.config({virtual_text = false, virtual_lines = true})")

;; Telescope Finder
(telescope.setup {})

;; Layout
(dwm.setup {:key_maps false :master_pane_count 1 :master_pane_width "60%"})

(lua "vim.api.nvim_create_autocmd({ 'BufRead' }, {
  callback = function()
    if vim.opt.buftype:get() == 'nofile' then
      vim.b.dwm_disabled = true
    end
  end,
})")
