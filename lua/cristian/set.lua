local opt = vim.opt

opt.nu = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = { os.getenv("HOME") .. "/.vim/undodi" }
opt.undofile = true

opt.hlsearch = true
opt.incsearch = true
opt.cursorline = false

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

opt.colorcolumn = { 80, 100, 120 }

opt.laststatus = 3

opt.splitright = true

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
