vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.cursorline = false

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = { 80, 100, 120 }
vim.opt.textwidth = 80


-- Define autocommands for Markdown files
function Md()
    -- Disable spell check
    vim.opt.spell = false
    vim.opt.textwidth = 80
end

function Dmd()
    vim.defer_fn(function()
        Md()
    end, 50)
end

vim.cmd("autocmd FileType markdown lua Dmd()")

-- Configure whitespaces
vim.cmd("set listchars=space:·")
vim.cmd("set list")

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end
})
