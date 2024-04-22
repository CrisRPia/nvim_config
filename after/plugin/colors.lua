function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

    -- use background from terminal
    -- vim.api.nvim_set_hl(0, 'FloatBorder', {bg='none', fg='none'})
    -- vim.api.nvim_set_hl(0, 'NormalFloat', {bg='none'})
    -- vim.api.nvim_set_hl(0, 'TelescopeNormal', {bg='none'})
    -- vim.api.nvim_set_hl(0, 'TelescopeBorder', {bg='none'})
    -- vim.api.nvim_set_hl(0, 'StatusLine', {bg='none'})
    -- vim.api.nvim_set_hl(0, 'StatusLineNC', {bg='none'})
    -- vim.api.nvim_set_hl(0, 'TabLineFill', {bg='none'})
end
vim.cmd([[
augroup ColorMyPencils
    autocmd!
    autocmd ColorScheme * call v:lua.ColorMyPencils()
augroup END
]])
ColorMyPencils()

