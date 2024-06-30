-- Global editing
vim.keymap.set('i', '<C-H>', '<C-W>') 
vim.keymap.set('n', '<C-P>', '<Up>') 
vim.keymap.set('n', '<C-N>', '<Down>') 

-- Diagnostics
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Telescope
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
vim.keymap.set('n', '<leader>fc', telescope.commands, {})
vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fh', telescope.help_tags, {})
vim.keymap.set('n', '<leader>fp', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fr', telescope.lsp_references, {})
vim.keymap.set('n', '<leader>fs', telescope.lsp_document_symbols, {})
