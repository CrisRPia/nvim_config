require("mason").setup({})
require("mason-lspconfig").setup({
    handlers = {
        require("lsp-zero").default_setup,
    },
})

require("mason-nvim-dap").setup({})
