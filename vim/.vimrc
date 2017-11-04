" Enable filetype plugins and indent.
filetype plugin on
filetype indent on

" Always show current position.
set ruler

" Set standard encoding to UTF8 and file type to unix.
set encoding=utf8
set ffs=unix,dos,mac

" Search settings.
set smartcase
set hlsearch
set incsearch

" Enable syntax highlighting.
syntax enable

" Use 4 spaces instead of tabs.
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Always show line numbers and highlight cursor line.
set number
set relativenumber
set cursorline

" Visual autocomplete for command menu.
set wildmenu

" Redraw only when necessary to boost performance.
set lazyredraw

" Highlight matching parentheses and brackets.
set showmatch

" Enable folding and use space to fold and unfold.
set foldenable
set foldmethod=indent
set foldlevelstart=3
set foldnestmax=3
noremap <space> za

" Show invisible characters.
set list
set listchars=eol:¶,tab:→\ ,trail:␣,precedes:«,extends:»,space:·

" Enable english spell checking.
set spell
set spelllang=en

