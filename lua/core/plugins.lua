local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'karb94/neoscroll.nvim'
  use "rebelot/kanagawa.nvim"
  use 'sunjon/shade.nvim'
  use 'catppuccin/nvim'
  use 'folke/twilight.nvim'
  use 'David-Kunz/gen.nvim'
  use 'AlexvZyl/nordic.nvim'
  use 'Mofiqul/vscode.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim'
  use 'navarasu/onedark.nvim'
  use "lukas-reineke/indent-blankline.nvim"
  use 'nvim-lua/plenary.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use {'hrsh7th/cmp-nvim-lsp'}
  use {
  'hrsh7th/nvim-cmp',
  requires = {
    { 'hrsh7th/cmp-nvim-lsp' },  -- LSP source for nvim-cmp
    { 'hrsh7th/cmp-buffer' },    -- Buffer completions
    { 'hrsh7th/cmp-path' },      -- Path completions
    { 'hrsh7th/cmp-cmdline' },   -- Command-line completions
    { 'L3MON4D3/LuaSnip' },      -- Snippet engine
    { 'saadparwaiz1/cmp_luasnip' } -- Snippet completions
  }
}

  use {
  'lewis6991/gitsigns.nvim',
  requires = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('gitsigns').setup()
  end
}
  use 'nvim-lualine/lualine.nvim'
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
  use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
}
  use { "braxtons12/blame_line.nvim",
    config = function()
        require("blame_line").setup()
    end
  }

  use {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
    theme = 'hyper',
    config = {
      week_header = {
       enable = false,
      },
      shortcut = {
        { desc = '󰊳 Update', group = '@property', action = 'PackerSync', key = 'u' },
        {
          icon = ' ',
          icon_hl = '@variable',
          desc = 'Find File',
          group = 'Label',
          action = 'Telescope file_browser',
          key = 'o',
        },
        {
          desc = '󰷈 New File',
          group = 'DiagnosticHint',
          action = 'enew',
          key = 'n',
        },
        {
          desc = '󰝰 Recent Files',
          group = 'Number',
          action = 'Telescope oldfiles',
          key = 'r',
        },
        {
          desc = ' Bookmarks',
          group = 'Number',
          action = 'Telescope marks',
          key = 'm',
        },
      },
      project = { 
        enable = false,
      },
    },
  }
  end,
  requires = {'nvim-tree/nvim-web-devicons'}
}
  use 'nvim-treesitter/nvim-treesitter'
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}
  use {"folke/noice.nvim", 
    requires = {{'MunifTanjim/nui.nvim' , 'rcarriga/nvim-notify'}}
    }
  use {"folke/todo-comments.nvim", 
    requires = "nvim-lua/plenary.nvim",
    opts = {},
  }
  use {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.4',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use{
    "kdheepak/lazygit.nvim",
    requires = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("telescope").load_extension("lazygit")
    end,
  }
  use {
    "williamboman/mason.nvim",
    "williamboman/mason.lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
  require("toggleterm").setup()
end}
use {
    'nvim-telescope/telescope-project.nvim',
    requires = {
        'nvim-telescope/telescope.nvim',
    },
}
  use "github/copilot.vim"
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
