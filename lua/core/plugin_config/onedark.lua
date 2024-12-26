-- Lua
vim.o.termguicolors = true
vim.cmd [[ colorscheme onedark ]]

require('onedark').setup {
    style = 'warmer'
}
require('onedark').load()
