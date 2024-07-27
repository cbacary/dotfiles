call plug#begin("~/.config/nvim/plugged")

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Syntax highlight
Plug 'nvim-treesitter/playground'
"Plug 'wookayin/semshi', { 'do': ':UpdateRemotePlugins', 'tag': '*'}
Plug 'scrooloose/nerdtree' " File manager
Plug 'nvim-lualine/lualine.nvim' " Status line thing
Plug 'nvim-tree/nvim-web-devicons' " Needed for barbar
Plug 'romgrk/barbar.nvim' " tab stuf
Plug 'lewis6991/gitsigns.nvim' " git integration
Plug 'ryanoasis/vim-devicons'

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Formatting stuff
Plug 'Raimondi/delimitMate' " auto bracket stuff
Plug 'preservim/nerdcommenter' " Mutliline comment

Plug 'sbdchd/neoformat' " Do the format 
Plug 'lukas-reineke/indent-blankline.nvim', { 'tag': 'v2.20.8' } " Add a vertical line on indents

" Because folding SUCKS!
Plug 'kevinhwang91/nvim-ufo'
Plug 'kevinhwang91/promise-async'
Plug 'luukvbaal/statuscol.nvim'

" Provided clipboard support for copy / pasting from clipboard
Plug 'matveyt/neoclip'

" Autocompletion stuff
Plug 'neoclide/coc.nvim', {'branch': 'release'} 

" JS Syntax highlighting
"Plug 'pangloss/vim-javascript'
"Plug 'HerringtonDarkholme/yats.vim'

" Theme
Plug 'Mofiqul/vscode.nvim'

" Session Manager
Plug 'rmagatti/auto-session'

call plug#end()
