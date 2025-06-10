require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")
local nvlsp = require("nvchad.configs.lspconfig")

local init = nvlsp.on_init
local attach = nvlsp.on_attach
local capabilities = nvlsp.capabilities

local servers = { "lua_ls", "html", "cssls", "basedpyright" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_init = init,
    on_attach = attach,
    capabilities = capabilities
  })
end

 -- vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
