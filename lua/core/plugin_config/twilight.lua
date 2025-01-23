local config = {
  dimming = {
    alpha = 0.0, -- amount of dimming
    color = { "Normal", "#ffffff" }, -- foreground from highlight groups or fallback color
    term_bg = "#000000", -- fallback color if guibg=NONE
    inactive = false, -- if true, other windows are fully dimmed (unless they contain the same buffer)
  },
  context = 10, -- number of lines to show around the current line
  treesitter = true, -- enable treesitter when available for the filetype
  expand = { -- nodes to always fully expand using treesitter
    "function",
    "method",
    "table",
    "if_statement",
  },
  exclude = {}, -- filetypes to exclude
}

-- set Keymap for Twilight in nvum
vim.api.nvim_set_keymap('n', '<leader>t', ':TwilightEnable<CR>', { noremap = true, silent = true })

return config


