require('Comment').setup({
    padding = true, -- Adds a space between comment delimiters and the code
    sticky = true, -- Keeps the cursor at its position after commenting
    mappings = {
        basic = true, -- Includes `gcc`, `gbc`, `gc` in visual mode
        extra = true, -- Adds additional mappings like `gco`, `gcO`, `gcA` (comment current line, above, or end of line)
    },
    toggler = {
        line = 'gcc',  -- Toggle comment for the current line
        block = 'gbc', -- Toggle block comment
    },
    opleader = {
        line = 'gc',  -- Comment selection in visual mode
        block = 'gb', -- Block comment selection in visual mode
    },
})

-- this is a comment
-- This is a comment

-- Keybinding for <Space>m to comment/uncomment in normal mode
vim.keymap.set('n', '<C-_>', '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', { noremap = true, silent = true })

-- Visual mode keybinding for line-wise comments
vim.keymap.set('v', '<C-_>', '<esc><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', { noremap = true, silent = true })

