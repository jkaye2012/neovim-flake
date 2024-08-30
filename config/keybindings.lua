local wk = require("which-key")

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
wk.add({
  { "<leader>f", group = "find" },
  { "<leader>fb", telescope.buffers, desc = "buffers" },
  { "<leader>ff", telescope.find_files, desc = "files" },
  { "<leader>fg", telescope.live_grep, desc = "grep" },
  { "<leader>fh", telescope.help_tags, desc = "help" },
  { "<leader>fr", telescope.lsp_references, desc = "references" },
  { "<leader>fs", telescope.lsp_document_symbols, desc = "symbol" },
})
