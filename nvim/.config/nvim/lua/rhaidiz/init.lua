require("rhaidiz.telescope")
require("rhaidiz.lsp_config")
require("rhaidiz._cmp")
require("bufferline").setup{}

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

