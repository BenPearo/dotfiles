return function(use)
  use 'mbbill/undotree'
  use "nvim-lua/plenary.nvim"
  use {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      requires = { {"nvim-lua/plenary.nvim"} }
  }  
  use 'tpope/vim-surround'
  use {
    'm-demare/hlargs.nvim',
    requires = { 'nvim-treesitter/nvim-treesitter' }
  }
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'DanilaMihailov/beacon.nvim'
end
