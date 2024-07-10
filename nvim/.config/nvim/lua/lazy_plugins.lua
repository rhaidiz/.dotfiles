-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({

  -- telescope
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		dependencies =  { 'nvim-lua/plenary.nvim' }
	},
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  { 'nvim-tree/nvim-web-devicons' },
  -- colorscheme
  { 'rose-pine/neovim', name = 'rose-pine' },
  -- Git
  { 'tpope/vim-fugitive' },
  { 'rbong/vim-flog' },
  { 'airblade/vim-gitgutter' },
	-- treesitter
  { 'nvim-treesitter/nvim-treesitter', build = ":TSUpdate"},
  -- autocompletion
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-vsnip' },
  { 'hrsh7th/vim-vsnip' },
  -- blackline
  { "lukas-reineke/indent-blankline.nvim" },
  -- auto dark mode
  { "f-person/auto-dark-mode.nvim" }
})
