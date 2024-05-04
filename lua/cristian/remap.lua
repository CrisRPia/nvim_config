local map = vim.keymap.set

vim.g.mapleader = " "

map("n", "<leader>pv", "<CMD>Oil<CR>")
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

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

map({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
map("i", "<C-c>", "<Esc>")

map("n", "Q", "<nop>")
-- map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
map("n", "<leader>fn", ":Neoformat<CR>")
map("n", "<leader>fl", vim.lsp.buf.format)

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

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


-- Trouble
map("n", "<leader>tt", "<cmd>TroubleToggle<cr>",
    { silent = true, noremap = true }
)


-- tmux
function Split_tmux_vertical()
    -- REQUIRES PUEUED FOR CROSS-SHELL COMPATIBILITY
    vim.fn.system("pueued -d")
    local cmd = string.format(
        "pueue add alacritty --working-directory '%s'",
        vim.fn.expand('%:p:h')
    )
    vim.fn.system(cmd)
end

map("n", "<leader>tp", Split_tmux_vertical)

-- Copilot
vim.g.copilot_no_tab_map = true

vim.api.nvim_set_keymap("i", "<C-Q>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- Window switching
map("n", '<C-h>', '<C-w>h')
map("n", '<C-j>', '<C-w>j')
map("n", '<C-k>', '<C-w>k')
map("n", '<C-l>', '<C-w>l')
