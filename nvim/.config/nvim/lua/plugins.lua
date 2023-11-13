-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- telescope
  use {
	'nvim-telescope/telescope.nvim', tag = '0.1.4',
	requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- bufferline
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
  -- Git
  use {'tpope/vim-fugitive' }
  use {'rbong/vim-flog'}
  use {'airblade/vim-gitgutter'}
  -- colorscheme
  use({ 'rose-pine/neovim', as = 'rose-pine' })
  -- treesitter
  use {
	'nvim-treesitter/nvim-treesitter',
	run = function()
	  local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
	  ts_update()
	end,
  }
  -- better quickfix
  use {'kevinhwang91/nvim-bqf', ft = 'qf'}

  -- autocompletion
  use {'neovim/nvim-lspconfig'}
  use {'hrsh7th/nvim-cmp'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/cmp-vsnip'}
  use {'hrsh7th/vim-vsnip'}

end)

