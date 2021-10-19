local function conf(name)
  return require(string.format('modules.config.%s', name))
end

return {
  { 'wbthomason/packer.nvim' },
  { -- Colorschemes
    'folke/tokyonight.nvim',
    'LunarVim/Colorschemes',
    config = conf 'colors',
  },
  { -- Start screen
    'glepnir/dashboard-nvim',
    config = conf 'dashboard-nvim',
  },
  { -- Treesiter
    'nvim-treesitter/nvim-treesitter',
    config = conf 'nvim-treesitter',
    requires = {
      'p00f/nvim-ts-rainbow',
      'windwp/nvim-ts-autotag',
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
  },
  { -- Finder
    'nvim-telescope/telescope.nvim',
    config = conf 'telescope',
    requires = { 'nvim-lua/plenary.nvim' },
  },
  { -- File tree
    'kyazdani42/nvim-tree.lua',
    config = conf 'nvim-tree',
  },
  { -- Icons
    'kyazdani42/nvim-web-devicons',
    config = conf 'nvim-web-devicons',
  },
  { -- Lsp
    'neovim/nvim-lspconfig',
    config = conf 'nvim-lspconfig',
    requires = {
      { 'williamboman/nvim-lsp-installer' },
      { 'ray-x/lsp_signature.nvim' },
      { 'jose-elias-alvarez/nvim-lsp-ts-utils' },
    },
  },
  { -- Autocompletion plugin
    'hrsh7th/nvim-cmp',
    config = conf 'nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-vsnip',
      { 'L3MON4D3/LuaSnip', requires = { 'rafamadriz/friendly-snippets' } },
    },
  },
  { -- Git related
    {
      'lewis6991/gitsigns.nvim',
      config = 'gitsigns',
      requires = { 'nvim-lua/plenary.nvim' },
    },
    { -- Like magit
      'TimUntersberger/neogit',
      conf = 'neogit',
      requires = { 'sindrets/diffview.nvim', 'nvim-lua/plenary.nvim' },
    },
  },
  { -- Comments
    { 'tpope/vim-commentary' },
    { 'tpope/vim-surround', requires = { 'tpope/vim-repeat' } },
  },
  { -- Autopairs
    'windwp/nvim-autopairs',
    config = conf 'nvim-autopairs',
  },
  { -- Indent guides
    'lukas-reineke/indent-blankline.nvim',
    config = conf 'indent-blankline',
  },
  { -- Bufferline
    'akinsho/nvim-bufferline.lua',
    config = conf 'nvim-bufferline',
  },
  { -- Statusline
    'glepnir/galaxyline.nvim',
    config = conf 'galaxyline',
  },
  { -- Colorizer
    'norcalli/nvim-colorizer.lua',
    config = conf 'nvim-colorizer',
  },
}
