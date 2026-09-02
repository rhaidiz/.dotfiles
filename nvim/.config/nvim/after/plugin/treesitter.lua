require 'nvim-treesitter'.setup {
	-- only endure that maintained parser are installed
	ensure_installed = maintained,

	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	}
}
