local lspconfig = require("lspconfig")

local servers = { "lua_ls", "html", "cssls", "basedpyright" }

-- for _, lsp in ipairs(servers) do
--  lspconfig[lsp].setup({
--    on_init = init,
--    on_attach = attach,
--    capabilities = capabilities
--  })
-- end

 -- vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
