local dap, dapui = require("dap"), require("dapui")

require("dapui").setup()
require("nvim-dap-virtual-text").setup({})

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end

-- dap.listeners.after.event_terminated["dapui_config"] = function ()
--     dapui.close()
-- end
-- dap.listeners.after.event_exited["dapui_config"] = function ()
--     dapui.close()
-- end

vim.keymap.set("n", "<S-F6>", ":lua require'dapui'.close()<CR>")

vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")

dap.adapters.coreclr = {
    type = "executable",
    command = "/usr/local/bin/netcoredbg/netcoredbg",
    args = { "--interpreter=vscode" },
}

--     local cmd = string.format("alacritty --working-directory '%s' &", vim.fn.expand('%:p:h'))dap

-- All this crap is so that the debugger works properly for c#

local function capture_selected_path(prompt_bufnr, on_selected)
    local entry = require("telescope.actions.state").get_selected_entry()
    if not entry then
        return
    end

    local path = entry.path
    require("telescope.actions").close(prompt_bufnr)
    on_selected(path)
end

local opts = {
    prompt_title = "Path to dll: ",
    default_text = ".dll",
    file_pattern = ".dll$",
    find_command = { "rg", "--files", "--hidden", "--no-ignore" },
    attach_mappings = function(_, map)
        map("i", "<CR>", function(prompt_bufnr)
            capture_selected_path(prompt_bufnr, Launch_dapui)
        end)
        map("n", "<CR>", function(prompt_bufnr)
            capture_selected_path(prompt_bufnr, Launch_dapui)
        end)
        return true
    end,
}

function Find_dlls(on_selected)
    require("telescope.builtin").find_files(opts)
    vim.api.nvim_feedkeys(
        vim.api.nvim_replace_termcodes("<C-o>I", true, true, true),
        "n",
        false
    )
end

function Launch_dapui(selected_path)
    dap.configurations.cs = {
        {
            type = "coreclr",
            name = "launch - netcoredbg",
            request = "launch",
            program = selected_path,
        },
    }
    require("dap").continue()
end
