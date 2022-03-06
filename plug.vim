if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
"Plug 'dyng/ctrlsf.vim'
Plug 'preservim/nerdtree'
Plug 'mhartington/formatter.nvim'

if has("nvim")
  Plug 'hoob3rt/lualine.nvim'
  Plug 'kristijanhusak/defx-git'
  Plug 'kristijanhusak/defx-icons'
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugs' }
  Plug 'neovim/nvim-lspconfig'
  Plug 'tami5/lspsaga.nvim', { 'branch': 'nvim6.0' }
  Plug 'folke/lsp-colors.nvim'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'folke/trouble.nvim'
  Plug 'onsails/lspkind-nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'windwp/nvim-autopairs'
  Plug 'windwp/nvim-ts-autotag'
  Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugs' }
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'airblade/vim-rooter'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Briefly highlight which text was yanked.
  Plug 'machakann/vim-highlightedyank'

  " Modify * to also work with visual selections.
  Plug 'nelstrom/vim-visual-star-search'

  " Automatically clear search highlights after you move your cursor.
  Plug 'haya14busa/is.vim'

  " Handle multi-file find and replace.
  Plug 'mhinz/vim-grepper'

  " Better display unwanted whitespace.
  Plug 'ntpeters/vim-better-whitespace'

  " Toggle comments in various ways.
  Plug 'tpope/vim-commentary'

  " Automatically set 'shiftwidth' + 'expandtab' (indention) based on file type.
  Plug 'tpope/vim-sleuth'

  " A number of useful motions for the quickfix list, pasting and more.
  Plug 'tpope/vim-unimpaired'

  " Drastically improve insert mode performance in files with folds.
  Plug 'Konfekt/FastFold'

  " Show git file changes in the gutter.
  Plug 'mhinz/vim-signify'
endif

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'

Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
" Better manage Vim sessions.
Plug 'tpope/vim-obsession'
Plug 'mattn/emmet-vim'

call plug#end()

" colorscheme molokai

let g:airline_theme='google_dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1

let g:rainbow_active = 1

let g:rainbow_load_separately = [
            \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
            \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
            \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
            \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
            \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
