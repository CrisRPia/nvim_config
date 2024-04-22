vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>")
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>pk", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", ":Neoformat<CR>")
vim.keymap.set("n", "<leader>lf", "<cmd>LspZeroFormat<CR>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Debugger remaps
local function is_dap_running()
    local session = require('dap').session()
    return session ~= nil
end

vim.keymap.set("n", "<F6>", function()
    if vim.bo.filetype == "cs" and not is_dap_running() then
        Find_dlls(Launch_dapui)
    else
        require('dap').continue()
    end
end)
vim.keymap.set("n", "<F7>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F8>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F9>", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")


-- Trouble
vim.keymap.set("n", "<leader>tt", "<cmd>TroubleToggle<cr>",
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

vim.keymap.set("n", "<leader>tp", Split_tmux_vertical)

-- Copilot
vim.g.copilot_no_tab_map = true

vim.api.nvim_set_keymap("i", "<C-Q>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
