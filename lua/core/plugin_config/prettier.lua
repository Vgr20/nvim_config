local prettier = require("prettier")

prettier.setup({
  bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "vue",
    "python",
    "java",
    "yaml",
  },
})


-- Set up a function to format and notify
_G.format_and_notify = function()
  vim.cmd("Prettier") -- Run the Prettier command
  vim.schedule(function()
    vim.notify("Code formatted successfully!", vim.log.levels.INFO)
  end)
end

-- Bind the custom function to a key
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua _G.format_and_notify()<CR>', { noremap = true, silent = true })

