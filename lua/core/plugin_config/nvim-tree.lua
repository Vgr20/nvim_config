vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

-- keybindings
-- toggle the file tree
vim.keymap.set('n', '<leader>n', function()
  require('nvim-tree.api').tree.toggle()
end)
-- focus on the file tree
vim.keymap.set('n', '<c-n>', function()
  require('nvim-tree.api').tree.focus()
end)

