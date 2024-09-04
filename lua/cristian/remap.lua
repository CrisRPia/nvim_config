local map = vim.keymap.set

vim.g.mapleader = " "

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- greatest remap ever
map("x", "<leader>pk", [["_dP]])

-- next greatest remap ever : asbjornHaland
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

-- Paste from clipboard
map("n", "<leader>P", [["+p]], { desc = "Paste from clipboard" })
map("v", "<leader>P", [["+p]], { desc = "Paste from clipboard" })

map({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
map("i", "<C-c>", "<Esc>")

map("n", "Q", "<nop>")
map("n", "<C-f>", "<cmd>silent !tmux new tmux-sessionizer<CR>")
map("n", "<leader>fn", function ()
    local filetype = vim.bo.filetype
    if filetype == "cs" then
        vim.cmd([[Neoformat csharpier]])
    elseif filetype == "python" then
        vim.cmd([[Neoformat black]])
    elseif filetype == "sql" or filetype == "mysql" or filetype == "plsql" then
        vim.cmd([[ Neoformat sleek ]])
    else
        vim.cmd([[Neoformat]])
    end
end)
map("n", "<leader>fl", vim.lsp.buf.format)

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map("n", "<leader>ih", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
    print("Inlay hint set to " .. tostring(vim.lsp.inlay_hint.is_enabled({})))
end)

-- Debugger remaps
-- local function is_dap_running()
--     local session = require('dap').session()
--     return session ~= nil
-- end
--
--
-- map("n", "<F6>", function()
--     if vim.bo.filetype == "cs" and not is_dap_running() then
--         Find_dlls(Launch_dapui)
--     else
--         require('dap').continue()
--     end
-- end)
-- map("n", "<F7>", ":lua require'dap'.step_over()<CR>")
-- map("n", "<F8>", ":lua require'dap'.step_into()<CR>")
-- map("n", "<F9>", ":lua require'dap'.step_out()<CR>")
-- map("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
-- map("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
-- map("n", "<leader>blp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
-- map("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")

-- Kitty
map("n", "<leader>s.", function()
    local parent_dir = vim.fn.expand("%:p:h")
    local command = "kitty --working-directory " .. parent_dir .. " &"
    print("Executing: " .. command)
    vim.fn.system(command)
end)

map("n", "<leader>sr", function()
    local root_dir = vim.loop.cwd()
    local command = "kitty --working-directory " .. root_dir .. " &"
    print("Executing: " .. command)
    vim.fn.system(command)
end)

-- Trouble
-- map("n", "<leader>tt", "<cmd>TroubleToggle<cr>",
--     { silent = true, noremap = true }
-- )

-- Copilot
vim.g.copilot_no_tab_map = true

vim.api.nvim_set_keymap("i", "<C-Q>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- Window switching
map("n", '<C-h>', '<C-w>h')
map("n", '<C-j>', '<C-w>j')
map("n", '<C-k>', '<C-w>k')
map("n", '<C-l>', '<C-w>l')

-- Tabs

map("n", "tt", function () vim.cmd([[ tabnew ]]) end)
map("n", "tT", function () vim.cmd([[ tabclose ]]) end)
