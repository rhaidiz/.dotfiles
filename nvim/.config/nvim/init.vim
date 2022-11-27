call plug#begin('~/.config/nvim/plugged')

" Telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim' " required for telescope
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' } " fzf for telescope. It requires gcc, clang and make

" Theme
Plug 'themercorp/themer.lua'

" Bufferline
Plug 'akinsho/bufferline.nvim'
Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)

" Git
Plug 'https://github.com/airblade/vim-gitgutter.git' " shows line modification sign
Plug 'https://tpope.io/vim/fugitive.git' " git plugin that does stuff
Plug 'rbong/vim-flog' " git branch viewer

" Completition
Plug 'neovim/nvim-lspconfig' " common configuration for nvim build LSP
Plug 'hrsh7th/nvim-cmp' " completition engine
Plug 'hrsh7th/cmp-nvim-lsp' " source from where to get completition info, LSP in this case

" For when doing autocomplete when pressing enter.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" File tree plugin
Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'

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
colorscheme themer_dracula
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
nnoremap <leader>j :cnext<CR>
nnoremap <leader>k :cprev<CR>
" behave like esc
inoremap jk <esc>
" disable esc
inoremap <Esc> <nop>
nnoremap <Up> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
nnoremap <Down> <nop>

" Move around buffers
nnoremap è :bp!<CR><CR>
nnoremap + :bn!<CR><CR>
vnoremap <leader>y "*y
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" open config
nnoremap <leader>ev :vsplit $MYVIMRC<cr> 
" reload vimrc
nnoremap <leader>sv :source $MYVIMRC<cr> 
" Add code action mapping. Code action are warning and suggestion shown during
" coding
nnoremap <silent> ca <cmd>lua vim.lsp.buf.code_action()<CR>
" Telescope
" }}}}
"
" Trick for avoiding toggle paste mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

set termguicolors

set updatetime=10

" format on save
autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
" organize import at save
autocmd BufWritePre *.go lua OrgImports(1000)

" Fold git when opening Flog
autocmd FileType git call FoldSyntax()
function FoldSyntax()
  setlocal foldmethod=syntax
  set foldlevel=0
endfunction

nnoremap <leader>v :NvimTreeToggle<CR>
