require('gitsigns').setup {
  signs = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },  -- Symbol for deleted lines
    topdelete    = { text = '‾' },  -- Symbol for top-deleted lines
    changedelete = { text = '~' },  -- Symbol for changed and deleted lines
    untracked    = { text = '.' },
  },
  signcolumn = true,  -- Show Git signs in the sign column
  numhl      = false, -- Disable number column highlighting
  linehl     = false, -- Disable line highlighting
  word_diff  = false, -- Disable word diff highlighting
  current_line_blame = false, -- Explicitly disable blame
}

