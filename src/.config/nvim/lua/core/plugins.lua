local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]
vim.cmd [[autocmd BufWritePost plugins.lua PackerCompile]]

local packer = require('packer')
local packer_compiled = fn.stdpath('data')..'/site/plugin/packer_compiled.vim'

return packer.startup(function()

  packer.init({ compile_path = packer_compiled })
  packer.reset()

  use {'wbthomason/packer.nvim', opt = true}
  -- use {'nvim-lua/popup.nvim'}
  -- use {'nvim-lua/plenary.nvim'}
  -- use {'nvim-lua/popup.nvim', opt = true},
  -- use {'nvim-lua/plenary.nvim', opt = true},

  -- Auto-pairs
  use {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = [[require('nvim-autopairs').setup()]]
  }

  -- Bufferline
  use {
    'akinsho/nvim-bufferline.lua',
    event = 'BufRead',
    config = [[require'bufferline'.setup{options = {always_show_bufferline = false}}]]
  }

  -- Colorizer
  use {
    'norcalli/nvim-colorizer.lua',
    event = 'BufRead',
    config = [[require('plugin.colorizer')]]
  }

  -- Colorscheme
  use {'ChristianChiarulli/nvcode-color-schemes.vim'}
  use {'glepnir/zephyr-nvim'}

  -- Cursor
  use {'itchyny/vim-cursorword',          event = {'BufReadPre','BufNewFile'}}

  -- Emmet
  use {
    'mattn/emmet-vim',
    event = 'InsertEnter',
    ft = {'html','css','javascript','javascriptreact','vue','typescript','typescriptreact'}
  }

  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    event = 'BufRead',
    after = 'telescope.nvim',
    config = [[require('plugin.gitsigns')]]
  }

  -- Icons
  use {'kyazdani42/nvim-web-devicons',    config = [[require'nvim-web-devicons'.setup{}]]}

  -- Indent Guides
  use {'glepnir/indent-guides.nvim',      event = {'BufReadPre','BufNewFile'}}

  -- Lsp
  use {
    'neovim/nvim-lspconfig',
    event = 'BufReadPre',
    config = [[require('plugin.lsp')]]
  }
  use {
    'hrsh7th/nvim-compe',
    event = 'InsertEnter'
  }
  use {'glepnir/lspsaga.nvim',            event = {'BufReadPre','BufNewFile'}}
  use {'wbthomason/lsp-status.nvim',      event = {'BufReadPre','BufNewFile'}}

  -- Prettier
  use {
    'prettier/vim-prettier',
    run = 'yarn install',
    ft = { 'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html' }
  }

  -- Profiling
  use {'tweekmonster/startuptime.vim'}


  -- Statusline
  use {'glepnir/galaxyline.nvim',       config = [[require('plugin.galaxyline')]]}

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    -- event = 'BufEnter',
    cmd = "Telescope",
    -- config = [[require('plugin.telescope')]],
    config = function() require('plugin.telescope') end,
    requires = {
    {'nvim-lua/popup.nvim', opt = true},
    {'nvim-lua/plenary.nvim',opt = true},
    {'nvim-telescope/telescope-fzy-native.nvim', opt = true}
    }
  }

  -- Tpope
  use {'tpope/vim-commentary',            event = {'BufReadPre','BufNewFile'}}
  use {'tpope/vim-surround',              event = {'BufReadPre','BufNewFile'}}
  use {'tpope/vim-eunuch',                event = {'BufReadPre','BufNewFile'}}

  -- Tree
  use {'kyazdani42/nvim-tree.lua',        config = [[require('plugin.nvim_tree')]]}

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufRead',
    after = 'telescope.nvim',
    config = [[require'nvim-treesitter.configs'.setup { highlight = { enable = true }, ensure_installed = 'all' }]]
  }

end)
