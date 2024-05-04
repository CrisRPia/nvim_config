require("luasnip.session.snippet_collection").clear_snippets()
require("luasnip.loaders.from_vscode").lazy_load()
-- prefix
local ls = require("luasnip")
local snippet = ls.snippet
local snippet_node = ls.snippet_node
local indent_snippet_node = ls.indent_snippet_node
local text_node = ls.text_node
local insert_node = ls.insert_node
local function_node = ls.function_node
local choice_node = ls.choice_node
local dynamic_node = ls.dynamic_node
local restore_node = ls.restore_node
local events = require("luasnip.util.events")
local absolute_indexer = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local lambda = extras.lambda
local rep = extras.rep
local partial = extras.partial
local match = extras.match
local nonempty = extras.nonempty
local dynamic_lambda = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local eonditions = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse_snippet = require("luasnip.util.parser").parse_snippet
local multi_snippet = ls.multi_snippet
local new_key = require("luasnip.nodes.key_indexer").new_key

-- bindings
vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { silent = true })
-- snippets
ls.add_snippets("all", {
    snippet(
        "{", {
            -- TODO: Get indentation string dynamically
            text_node({ "{", "    " }),
            insert_node(0),
            text_node({ "", "}" }),
        }
    ),
})
