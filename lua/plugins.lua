vim.cmd [[
call plug#begin('~/.config/nvim/plugged')
Plug 'Civitasv/cmake-tools.nvim'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'sainnhe/sonokai'
Plug 'NeogitOrg/neogit'
Plug 'ahmedkhalf/project.nvim'
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'famiu/bufdelete.nvim'
Plug 'navarasu/onedark.nvim' 
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'MunifTanjim/prettier.nvim'
Plug 'folke/trouble.nvim'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/vim-vsnip'
" follow latest release and install jsregexp.
Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'} " Replace <CurrentMajor> by the latest released major (first number of latest release)
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'hrsh7th/cmp-vsnip'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'luochen1990/rainbow'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-tree/nvim-web-devicons'
" Plug 'ryanoasis/vim-devicons' Icons without colours
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
Plug 'projekt0n/github-nvim-theme'
Plug 'folke/tokyonight.nvim'
Plug 'windwp/nvim-autopairs'
call plug#end()
]]
