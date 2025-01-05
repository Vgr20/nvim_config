require('gen').setup({
  display_mode = 'split',
  show_prompt = true,
  show_model = true,
})

vim.keymap.set({ 'n', 'v' }, '<leader>a', ':Gen Ask<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>s', ':Gen Summarize<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>c', ':Gen Chat<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>w', ':Gen Enhance_Wording<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>g', ':Gen Enhance_Grammar_Spelling<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>r', ':Gen Review_Code<CR>')
