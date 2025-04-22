vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set("n", "gd", function()
            vim.lsp.buf.definition()
        end, opts)
        vim.keymap.set("n", "gl", function()
            vim.diagnostic.open_float()
        end, opts)
    end,
})

local severity = vim.diagnostic.severity

vim.diagnostic.config({
    virtual_lines = { current_line = true },
    underline = true,
    severity_sort = true,
    update_in_insert = false,
    float = {
        style = "minimal",
        border = "rounded",
        source = true,
    },
    virtual_text = {
        severity = { "ERROR" },
    },
    signs = {
        linehl = {
            [severity.ERROR] = "BufferVisibleERROR",
            [severity.WARN] = "BufferVisibleWARN",
            [severity.HINT] = "BufferVisibleHINT",
            [severity.INFO] = "BufferVisibleINFO",
        },
        numhl = {
            [severity.ERROR] = "DiagnosticSignERROR",
            [severity.WARN] = "DiagnosticSignWARN",
            [severity.HINT] = "DiagnosticSignHINT",
            [severity.INFO] = "DiagnosticSignINFO",
        },
        text = {
            [severity.ERROR] = "",
            [severity.WARN] = "",
            [severity.HINT] = "",
            [severity.INFO] = "",
        },
    },
})
