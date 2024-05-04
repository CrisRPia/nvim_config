local lsp_zero = require("lsp-zero")

require('luasnip.loaders.from_vscode').lazy_load()
require("neodev").setup({})

vim.diagnostic.config({
    virtual_text = true,
    severity_sort = true,
    float = {
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        -- header = '',
        -- prefix = '',
    },
})

lsp_zero.on_attach(function(_ --[[ client ]], bufnr)
    -- see :help lsp_zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

lsp_zero.configure("jdtls", {
    -- FIXME: This is a workaround to prevent lsp_zero from using
    -- jdtls, since I wanna config it myself.
    cmd = ""
})


require('mason').setup({})
require('mason-lspconfig').setup({
    handlers = {
        lsp_zero.default_setup,
    }
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('user_lsp_attach', { clear = true }),
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
        ---@diagnostic disable-next-line: missing-parameter
        vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set('n', '<leader>dn', function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set('n', '<leader>dp', function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
    end,
})

cmp.setup({
    preselect = 'item',
    experimental = {
        ghost_text = true,
    },
    window = {
        documentation = {
            border = cmp.config.window.bordered().border,
        },
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<Enter>'] = cmp.mapping.confirm({ select = true }),
        ["<C-E>"] = cmp.mapping.complete(),
        ['<Tab>'] = nil,
        ['<S-Tab>'] = nil,
    }),
    sources = {
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'luasnip' },
        { name = 'buffer',  keyword_length = 5 },
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})

-- VSCode theme
-- gray
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg = 'NONE', strikethrough = true, fg = '#808080' })
-- blue
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg = 'NONE', fg = '#569CD6' })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link = 'CmpIntemAbbrMatch' })
-- light blue
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg = 'NONE', fg = '#9CDCFE' })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link = 'CmpItemKindVariable' })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { link = 'CmpItemKindVariable' })
-- pink
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg = 'NONE', fg = '#C586C0' })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link = 'CmpItemKindFunction' })
-- front
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg = 'NONE', fg = '#D4D4D4' })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link = 'CmpItemKindKeyword' })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link = 'CmpItemKindKeyword' })

local cmp_kinds = {
    Text = '  ',
    Method = '  ',
    Function = '  ',
    Constructor = '  ',
    Field = '  ',
    Variable = '  ',
    Class = '  ',
    Interface = '  ',
    Module = '  ',
    Property = '  ',
    Unit = '  ',
    Value = '  ',
    Enum = '  ',
    Keyword = '  ',
    Snippet = '  ',
    Color = '  ',
    File = '  ',
    Reference = '  ',
    Folder = '  ',
    EnumMember = '  ',
    Constant = '  ',
    Struct = '  ',
    Event = '  ',
    Operator = '  ',
    TypeParameter = '  ',
}

cmp.setup({
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(_, vim_item)
            vim_item.kind = cmp_kinds[vim_item.kind] .. vim_item.kind
            return vim_item
        end,
        expandable_indicator = true,
    },
    view = {
        entries = {
            name = "custom",
            selection_order = "near_cursor",
        },
        docs = {
            auto_open = true
        }
    }
})

lsp_zero.set_sign_icons({
    error = ' ',
    warn = ' ',
    hint = '󰋖 ',
    info = ' '
})

lsp_zero.setup()

local lspconfig = require("lspconfig")
lspconfig.powershell_es.setup {
    bundle_path = '~/Desktop/PowerShellEditorServices',
    settings = { powershell = { codeFormatting = { Preset = 'OTBS' } } },
}

vim.diagnostic.config({
    virtual_text = true
})
