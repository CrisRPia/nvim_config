vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.md", "*.markdown"};
    callback = function() require("otter").activate() end
})
