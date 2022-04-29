call plug#begin('~/.vim/plugged')

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Theme
Plug 'gruvbox-community/gruvbox'

" Bufferline
Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
" Plug 'ryanoasis/vim-devicons' Icons without colours
Plug 'akinsho/bufferline.nvim'



" Git
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'https://tpope.io/vim/fugitive.git'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'


" Completition
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'onsails/lspkind-nvim'

Plug 'scrooloose/nerdtree'


call plug#end()



" Settings {{{
" set spell " enable spell checker. To obtain suggestion press z= on the word
" :setlocal spell spelllang=en " set spell checker  for eng. Use ]s and [s to 
" move to the next and previous misspelled word
set scrolloff=10 " Lines to keep above and below curso
set backspace=indent,eol,start " don't remember
set wildmenu " Vim command completion expanded
set laststatus=2 " always show status bar
set incsearch " while searching show the pattern that matches so far
set number relativenumber " show line numbers hybrid mode
set cursorline " highlight the cursor line
set showcmd " show cmd in last line
set hlsearch " highlight search
set colorcolumn=80 " set column to 80 chars
set mouse=a " enable mouse support in case I'm lazy
set autoindent " auto indent based on current line
" set expandtab " spaces for tabs
set tabstop=4 " number of spaces for a tab
set linespace=2
set shiftwidth=2 " indentation when using << >> and ==
set wrap " wrap lines
set ffs=unix,dos,mac " EOL formart to try when editing\reading file in buffer
set termguicolors " for 24bit color support
syntax enable " enable syntax
colorscheme gruvbox
"set guifont=Hack\ Nerd\ Font:h13 " font
"set guifont=Monokai:h13 " font
set guifont=Monospace\ 10
set listchars=tab:\|\ ",extends:>,precedes:< " to use with set list to show special characters
set list " show invisible chars
set autoread " re-read a file that was changed outside of vim
set nobackup " disable backup
set nowritebackup " disable backup
set noswapfile " disable swap file
let mapleader = " " " leader - to be used with command for all vim
let maplocalleader = "." " localleader - to be used for command specific to the buffer
autocmd! GUIEnter * set vb t_vb= " Remove annoying bell sound from MacVim
set shell=fish " set prefered shell for :terminal
set foldmarker={{{,}}} " set what to use as fold marker
set foldmethod=marker " set fold method to marker
set foldlevelstart=20 " decide how fold should be when loading in buffer
set hidden " do not unload buffer when abandoned. Useful for switching buf without persisting it and keep its history of undos
set ignorecase " ignore case sensitivity when searching
set smartcase " overwrite ignorecase if uppercase letters appear
set fillchars+=vert:\  " get rid of split separator, dont' line it
" no line numbers in terminal buffers
"autocmd TerminalOpen * if &buftype == 'terminal' | setlocal nonumber | setlocal norelativenumber | endif

" Mapping {{{
" switch panels
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>
" behave like esc
inoremap jk <esc>
" disable esc
inoremap <Esc> <nop>
nnoremap <Up> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
nnoremap <Down> <nop>

" Move around buffers
nnoremap ' :bp!<CR><CR>
nnoremap ì :bn!<CR><CR>
" Move around tabs
nnoremap è :tabp<CR><CR>
nnoremap + :tabn<CR><CR>

" open config
nnoremap <leader>ev :vsplit $MYVIMRC<cr> 
" reload vimrc
nnoremap <leader>sv :source $MYVIMRC<cr> 
" Telescope
" }}}}
"
" Trick for avoiding toggle paste mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

set termguicolors

set updatetime=10

autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
autocmd BufWritePre *.go lua goimports(1000)
nnoremap <silent> <C-k><C-B> :NERDTreeToggle<CR>
