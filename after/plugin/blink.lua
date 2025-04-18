local blink = require("blink-cmp")

local kind_icons = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

blink.setup({
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- see the "default configuration" section below for full documentation on how to define
    -- your own keymap.
    keymap = {
        preset = "default",
        ["<Tab>"] = { nil },
        ["<S-Tab>"] = { nil },
        ["<A-1>"] = {
            function(cmp)
                cmp.accept({ index = 1 })
            end,
        },
        ["<A-2>"] = {
            function(cmp)
                cmp.accept({ index = 2 })
            end,
        },
        ["<A-3>"] = {
            function(cmp)
                cmp.accept({ index = 3 })
            end,
        },
        ["<A-4>"] = {
            function(cmp)
                cmp.accept({ index = 4 })
            end,
        },
        ["<A-5>"] = {
            function(cmp)
                cmp.accept({ index = 5 })
            end,
        },
        ["<A-6>"] = {
            function(cmp)
                cmp.accept({ index = 6 })
            end,
        },
        ["<A-7>"] = {
            function(cmp)
                cmp.accept({ index = 7 })
            end,
        },
        ["<A-8>"] = {
            function(cmp)
                cmp.accept({ index = 8 })
            end,
        },
        ["<A-9>"] = {
            function(cmp)
                cmp.accept({ index = 9 })
            end,
        },
        ["<A-0>"] = {
            function(cmp)
                cmp.accept({ index = 10 })
            end,
        },
    },

    appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- will be removed in a future release
        use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = "mono",
        kind_icons = kind_icons,
    },

    -- default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
        default = { "snippets", "lsp", "path", "buffer" },
    },

    signature = {
        enabled = false,
    },

    completion = {
        accept = {
            auto_brackets = {
                enabled = true,
                semantic_token_resolution = { enabled = true },
            },
        },
        ghost_text = { enabled = true },
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 0,
            update_delay_ms = 50,
            window = {
                border = "rounded",
            },
            treesitter_highlighting = true,
        },
        menu = {
            draw = {
                columns = {
                    { "item_idx" },
                    { "kind_icon" },
                    { "label", "label_description", gap = 1 },
                },
                components = {
                    item_idx = {
                        text = function(ctx)
                            return ctx.idx == 10 and "0"
                                or ctx.idx >= 10 and " "
                                or tostring(ctx.idx)
                        end,
                        highlight = "BlinkCmpItemIdx", -- optional, only if you want to change its color
                    },
                },
            },
        },
        list = {
            selection = {
                preselect = true,
            },
        },
    },
    fuzzy = {
        use_frecency = true,
        implementation = "rust",

        prebuilt_binaries = {
            download = true,
        },
    },
    snippets = {
        preset = "luasnip",
    },
})
