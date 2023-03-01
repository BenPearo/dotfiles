return function(use)
  use 'mbbill/undotree'
  use 'theprimeagen/harpoon'
  use 'tpope/vim-surround'
  use {
    'm-demare/hlargs.nvim',
    requires = { 'nvim-treesitter/nvim-treesitter' }
  }
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'DanilaMihailov/beacon.nvim'
end
