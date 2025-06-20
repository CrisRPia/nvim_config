require("mason").setup({
    registries =  {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
    }
})
local lspconfig = require("mason-lspconfig")
lspconfig.setup({})

for _, value in ipairs(lspconfig.get_installed_servers()) do
    vim.lsp.enable(value)
end

vim.lsp.enable({
    -- Enable extra lsps here.
})
