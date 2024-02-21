--{{{ Mappings
vim.g.mapleader = " "
vim.keymap.set('i', 'jk', '<Esc>', {})
vim.keymap.set('i', '<Esc>', '<nop>', {})
vim.keymap.set('n', '<Up>', '<nop>', {})
vim.keymap.set('n', '<Down>', '<nop>', {})
vim.keymap.set('n', '<Left>', '<nop>', {})
vim.keymap.set('n', '<Right>', '<nop>', {})

-- Edit vim config
vim.keymap.set('n', '<leader>ev', ':vsplit $MYVIMRC<cr>', { noremap = true })
vim.keymap.set('n', '<leader>sv', ':source $MYVIMRC<cr>', { noremap = true })

-- Movements
vim.keymap.set('n', '<C-j>', '<C-W><C-J>', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-W><C-k>', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-W><C-L>', { noremap = true })
vim.keymap.set('n', '<C-h>', '<C-W><C-H>', { noremap = true })

vim.keymap.set('n', 'è', ':bp!<CR><CR>', { noremap = true })
vim.keymap.set('n', '+', ':bn!<CR><CR>', { noremap = true })

-- Copy to clipboard
vim.keymap.set('v', '<leader>y', '"*y', { noremap = true })

-- File manager
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, {noremap = true})

vim.keymap.set('n', '<leader>c', ':w<cr>')
---}}}
