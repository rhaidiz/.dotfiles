local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fl', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

require('telescope').load_extension('fzf')
require('telescope').setup({
    pickers = {
      find_files = {
        find_command = {"rg", "--files", "--hidden", "--ignore", "-u", "--glob=!**/.git/*", "--glob=!**/node_modules/*", "--glob=!**/.next/*"},    
      },
      live_grep = {
         additional_args = function(opts)
              return {"--hidden"}
          end
      }
    }
})
