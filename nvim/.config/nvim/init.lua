--{{{Require
require('lazy_plugins')
require('mapping')
---}}}

--{{{ Settings
vim.opt.number = true
vim.opt.backspace = indent, eol, start -- don't remember
vim.opt.wildmenu = true                -- Vim command completion expanded
vim.opt.number = relativenumber        -- show line numbers hybrid mode
vim.opt.showcmd = true                 -- show cmd in last line
vim.opt.relativenumber = true
vim.opt.foldmarker = "{{{,}}}"         -- set what to use as fold marker
vim.opt.foldmethod = "marker"          -- set fold method to marker
vim.opt.foldlevelstart = 20            -- decide how fold should be when loading in buffer
vim.cmd('colorscheme rose-pine')
vim.opt.termguicolors = true
vim.opt.backspace     = [[indent,eol,start]] -- to make the backspace work
vim.opt.cursorline    = true                 -- highlight the cursor line
vim.opt.colorcolumn   = "80"
vim.opt.scrolloff     = 15                   -- Lines to keep above and below curso
vim.opt.autoread      = true                 -- re-read a file that was changed outside of vim
-- vim.opt.list          = true                 -- show invisible chars. Disable this to use ibl
-- vim.opt.listchars     = { tab = '| ' } 	 -- disable this to use ibl
vim.opt.updatetime    = 100                  -- this is needed for gitgutter so that it updates the diff sign faster
-- Indentation
vim.opt.tabstop       = 4
vim.opt.shiftwidth    = 2
vim.opt.linespace     = 2
-- Search
vim.opt.ignorecase    = true  -- ignore case sensitivity when searching
vim.opt.incsearch     = true  -- while searching show the pattern that matches so far
vim.opt.hlsearch      = true  -- highlight search
vim.opt.smartcase     = true  -- overwrite ignorecase if uppercase letters appear
-- Misc
vim.opt.backup        = false -- disable backup
vim.opt.writebackup   = false -- disable backup
vim.opt.swapfile      = false -- disable swap file
--}}}


--{{{AutoCmd
vim.api.nvim_create_autocmd({'BufWritePre'}, {
	pattern = "*.go",
	callback = function(ev)
		vim.lsp.buf.format()
		OrgImports(1000)
	end
})

-- Fold git when opening Flog
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = "git",
	callback = function(ev)
		vim.opt.foldmethod = "syntax"
		vim.opt.foldlevel = 0
	end
})
---}}}
