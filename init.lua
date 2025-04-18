-- FIXME: This is a hotfix, setting it to 1 triggers a "press enter to continue"
-- prompt on opening nvim.
vim.cmd([[ set cmdheight=2 ]])

-- lazy installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("cristian")

-- FIXME: END OF HOTFIX
vim.cmd([[ set cmdheight=1 ]])
