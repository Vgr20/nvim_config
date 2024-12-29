require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
  },
  sections = {
    lualine_c = {
      {
        'filename',
        path = 0,
      }
    }
  }
}
