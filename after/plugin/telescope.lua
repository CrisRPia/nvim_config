local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pt', builtin.lsp_workspace_symbols)
vim.keymap.set('n', '<leader>pf', builtin.find_files)
vim.keymap.set('n', '<leader>vrr', builtin.lsp_references)
vim.keymap.set('n', '<leader>gf', builtin.git_files)
vim.keymap.set('n', '<leader>ps', builtin.live_grep)
