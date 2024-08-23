local lsp_zero = require("lsp-zero")


require('luasnip.loaders.from_vscode').lazy_load()
require("neodev").setup({})

vim.diagnostic.config({
    virtual_text = true,
    severity_sort = true,
    float = {
        style = 'minimal',
        border = 'rounded',
        source = true,
        -- header = '',
        -- prefix = '',
    },
})

lsp_zero.on_attach(function(_ --[[ client ]], bufnr)
    -- see :help lsp_zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

lsp_zero.extend_lspconfig({
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    lsp_attach = function(_, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
    end,
    float_border = 'rounded',
    sign_text = true,
})

lsp_zero.configure("jdtls", {
    -- FIXME: This is a workaround to prevent lsp_zero from using
    -- jdtls, since I wanna config it myself. This is the reason of the
    -- annoying 2-line popup on startup.
    cmd = { "" }
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
        -- ["<C-E>"] = cmp.mapping.complete(),
        ['<Tab>'] = nil,
        ['<S-Tab>'] = nil,
    }),
    sources = {
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'luasnip' },
        { name = 'buffer' },
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
            local menu_length = 0

            if vim_item.menu then
                menu_length = #vim_item.menu
            end

            if #vim_item.abbr + menu_length < 120 then
                return vim_item
            end

            if #vim_item.abbr > 40 then
                vim_item.abbr = string.sub(vim_item.abbr, 1, 40) .. '...'
            end
            if menu_length > 80 then
                vim_item.menu = string.sub(vim_item.menu, 1, 80) .. '...'
            end
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
            auto_open = true,
        }
    },
})

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        {
            name = 'cmdline',
            option = {
                ignore_cmds = { 'Man', '!' }
            }
        }
    }),
    ---@diagnostic disable-next-line: missing-fields
    matching = {
        disallow_symbol_nonprefix_matching = false,
    }
})

lsp_zero.set_sign_icons({
    error = ' ',
    warn = ' ',
    hint = '󰋖 ',
    info = ' '
})

local lspconfig = require("lspconfig")

lspconfig.powershell_es.setup({
    bundle_path = '~/Desktop/PowerShellEditorServices',
    settings = {
        powershell = {
            codeFormatting = {
                Preset = 'OTBS'
            }
        }
    },
})

lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            hint = {
                enable = true,
            }
        }
    }
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

vim.diagnostic.config({
    virtual_text = true
})
