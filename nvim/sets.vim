set rnu " Show relative line number
set clipboard=unnamedplus " nvim uses system clipboard for copy and paste
set showmatch " Show matching
set smartcase " Search is only case sensitive if cases are used
set incsearch " Goto next occurencce of search term from where cursor currently
set clipboard+=unnamedplus " Use system clipboard

" is
set tabstop=8
set softtabstop=0
set shiftwidth=4 smarttab
set expandtab
set autoindent
set cc=80
set cursorline
set mouse=a
set backspace=indent,eol,start
set splitright
set ruler

" coc.nvim reqs
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes
set fdm=syntax
set foldlevel=99

" True color cause otherwise i can't see
set termguicolors
