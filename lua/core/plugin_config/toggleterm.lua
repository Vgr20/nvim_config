require("toggleterm").setup{}



vim.keymap.set('n', '<a-i>', ':ToggleTerm<CR>', {noremap = true, silent = true})
vim.keymap.set('t', '<a-i>', '<C-\\><C-n>:ToggleTerm<CR>', {noremap = true, silent = true})
