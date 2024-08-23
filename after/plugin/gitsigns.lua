require("gitsigns").setup();

-- Use light-theme rosé pine colours for gitsigns for more contrast.
vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = '#56949f'})
vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = '#ea9d34'})
vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = '#b4637a'})

-- Dark variante; too little contrast
-- vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = '#9ccfd8'})
-- vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = '#f6c177'})
-- vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = '#eb6f92'})
