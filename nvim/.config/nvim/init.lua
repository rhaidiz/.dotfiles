--{{{Require
require('plugins')
require('treesitter')
require('lsp_config')
require("bufferline").setup{}
require('rose-pine').setup({
	--- @usage 'auto'|'main'|'moon'|'dawn'
	variant = 'moon',
	
})
---}}}

--{{{ Settings
vim.opt.number = true
vim.g.mapleader = " "
vim.opt.backspace=indent,eol,start -- don't remember
vim.opt.wildmenu = true-- Vim command completion expanded
vim.opt.number = relativenumber -- show line numbers hybrid mode
vim.opt.showcmd = true -- show cmd in last line
vim.opt.relativenumber = true
vim.opt.foldmarker="{{{,}}}" -- set what to use as fold marker
vim.opt.foldmethod="marker" -- set fold method to marker
vim.opt.foldlevelstart=20 -- decide how fold should be when loading in buffer
vim.cmd('colorscheme rose-pine')
vim.opt.termguicolors = true
vim.opt.backspace = [[indent,eol,start]] -- to make the backspace work
vim.opt.cursorline = true -- highlight the cursor line
vim.opt.colorcolumn="80"
vim.opt.scrolloff=15 -- Lines to keep above and below curso
vim.opt.autoread=true -- re-read a file that was changed outside of vim
vim.opt.list=true  -- show invisible chars
-- Indentation
vim.opt.tabstop=4 -- number of spaces for a tab
vim.opt.linespace=2
vim.opt.shiftwidth=2 -- indentation when using << >> and ==
-- Search
vim.opt.ignorecase = true -- ignore case sensitivity when searching
vim.opt.incsearch = true -- while searching show the pattern that matches so far
vim.opt.hlsearch = true -- highlight search
vim.opt.smartcase  = true -- overwrite ignorecase if uppercase letters appear
-- Misc
vim.opt.backup = false -- disable backup
vim.opt.writebackup = false -- disable backup
vim.opt.swapfile = false  -- disable swap file
--}}}

--{{{ Mappings
vim.keymap.set('i','jk','<Esc>',{})
vim.keymap.set('i','<Esc>','<nop>',{})
vim.keymap.set('n','<Up>','<nop>',{})
vim.keymap.set('n','<Down>','<nop>',{})
vim.keymap.set('n','<Left>','<nop>',{})
vim.keymap.set('n','<Right>','<nop>',{})

-- Edit vim config
vim.keymap.set('n','<leader>ev',':vsplit $MYVIMRC<cr>',{noremap=true})
vim.keymap.set('n','<leader>sv',':source $MYVIMRC<cr>',{noremap=true})

-- Movements
vim.keymap.set('n','<C-j>','<C-W><C-J>',{noremap=true})
vim.keymap.set('n','<C-k>','<C-W><C-k>', {noremap=true})
vim.keymap.set('n','<C-l>','<C-W><C-L>', {noremap=true})
vim.keymap.set('n','<C-h>','<C-W><C-H>', {noremap=true})

vim.keymap.set('n','è',':bp!<CR><CR>', {noremap=true})
vim.keymap.set('n','+',':bn!<CR><CR>', {noremap=true})

-- Copy to clipboard
vim.keymap.set('v','<leader>y','"*y', {noremap=true})

---}}}

--{{{AutoCmd
vim.api.nvim_create_autocmd({'BufWritePre'}, {
  pattern = "*.go",
  callback = function(ev)
	vim.lsp.buf.formatting()
	OrgImports(1000)
  end
})

-- Fold git when opening Flog
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = "git",
  callback = function(ev)
	vim.opt.foldmethod="syntax"
	vim.opt.foldlevel=0
  end
})
---}}}
