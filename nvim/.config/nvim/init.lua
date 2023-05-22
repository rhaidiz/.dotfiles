--{{{Require
require('plugins')
require('treesitter')
require('lsp_config')
require("bufferline").setup{}
require('rose-pine').setup({
	--- @usage 'auto'|'main'|'moon'|'dawn'
	variant = 'moon',
	--- @usage 'main'|'moon'|'dawn'
	dark_variant = 'main',
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = false,
	disable_float_background = false,
	disable_italics = false,

	--- @usage string hex value or named color from rosepinetheme.com/palette
	groups = {
		background = 'base',
		background_nc = '_experimental_nc',
		panel = 'surface',
		panel_nc = 'base',
		border = 'highlight_med',
		comment = 'muted',
		link = 'iris',
		punctuation = 'subtle',

		error = 'love',
		hint = 'iris',
		info = 'foam',
		warn = 'gold',

		headings = {
			h1 = 'iris',
			h2 = 'foam',
			h3 = 'rose',
			h4 = 'gold',
			h5 = 'pine',
			h6 = 'foam',
		}
		-- or set all headings at once
		-- headings = 'subtle'
	},

	-- Change specific vim highlight groups
	-- https://github.com/rose-pine/neovim/wiki/Recipes
	highlight_groups = {
		ColorColumn = { bg = 'overlay' },

		-- Blend colours against the "base" background
		CursorLine = { bg = 'foam', blend = 10 },
		IncSearch = {bg = 'foam', fg='base' },
		Search = {bg = 'gold', fg = 'base'}, 
		StatusLine = { fg = 'foam', bg = 'foam', blend = 10 },
	}
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
vim.opt.listchars = { tab = '| ' }
vim.opt.updatetime = 100 -- this is needed for gitgutter so that it updates the diff sign faster
-- Indentation
vim.opt.tabstop=2
vim.opt.shiftwidth=2
vim.opt.linespace=2
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
		vim.lsp.buf.format()
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
