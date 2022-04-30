call plug#begin()
Plug 'vim-test/vim-test'
Plug 'sotte/presenting.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'honza/vim-snippets'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'azabiong/vim-highlighter'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'jeetsukumaran/vim-buffergator'
Plug 'airblade/vim-gitgutter'
Plug 'elixir-editors/vim-elixir'
Plug 'tpope/vim-fugitive'
Plug 'slashmili/alchemist.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-mix-format'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-live-grep-raw.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'EdenEast/nightfox.nvim'
Plug 'Rigellute/shades-of-purple.vim'
Plug 'jpalardy/vim-slime'
Plug 'nicwest/vim-http'
call plug#end()

" Indention Options
set autoindent
filetype plugin on
filetype indent off
set smartindent
set expandtab
set shiftround
set shiftwidth=2
set smarttab
set tabstop=2

" Search Options
set hlsearch
set ignorecase
set incsearch
set smartcase

" Text Rendering Options
set display+=lastline
set encoding=utf-8
set linebreak
syntax enable
set wrap

" User Interface Options
set laststatus=2
set ruler
set wildmenu
set tabpagemax=50
set background=dark
set cursorline
set number
set relativenumber
set nornu
set noerrorbells
set visualbell
set mouse=a
set title
set clipboard=unnamed,unnamedplus

" Code Folding Options
set foldmethod=indent
set foldnestmax=3
set nofoldenable

" Miscellaneous Options
set autoread
set backspace=indent,eol,start
set confirm
set hidden
set history=1000
set nomodeline
set spell

" Relative number
set number relativenumber
set nu rnu

if (has("termguicolors"))
 set termguicolors
endif

" Map jj to ESC
imap jj <ESC>

" nnoremap <C-p> :Files<CR>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <leader>ff <C-p> :Files<CR>
nnoremap <leader>fg <cmd>lua require("telescope").extensions.live_grep_raw.live_grep_raw()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

nnoremap <silent> <leader>tt :TestNearest<CR>
nnoremap <silent> <leader>TT :TestFile<CR>
nnoremap <silent> <leader>a :TestSuite<CR>
nnoremap <silent> <leader>l :TestLast<CR>
nnoremap <silent> <leader>g :TestVisit<CR>

"nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

nnoremap <leader>n :NERDTreeFind<CR>

let g:mix_format_on_save = 1
let test#strategy = "neovim"

" Mapping jump to declaration and reference for coc-elixir
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

" Color Scheme
syntax on
set t_Co=256
set cursorline
" colorscheme onehalfdark
" colorscheme nightfox
colorscheme shades_of_purple

let g:shades_of_purple_airline = 1
let g:airline_theme='shades_of_purple'

" lightline
let g:lightline = {
      \ 'colorscheme': 'shades_of_purple',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" Fugitive
" autocmd User fugitive command! -bar -buffer -nargs=* Gst :Git status <args>

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let HiSet   = 'f<CR>'       " normal, visual
let HiErase = 'f<BS>'       " normal, visual
let HiClear = 'f<C-L>'      " normal
let HiFind  = 'f<Tab>'      " normal, visual

nmap <Leader><Leader> <Plug>BookmarkToggle
nmap <Leader>i <Plug>BookmarkAnnotate
nmap <Leader>s <Plug>BookmarkShowAll
nmap <Leader>] <Plug>BookmarkNext
nmap <Leader>[ <Plug>BookmarkPrev
nmap <Leader>c <Plug>BookmarkClear
nmap <Leader>x <Plug>BookmarkClearAll
nmap <Leader>kk <Plug>BookmarkMoveUp
nmap <Leader>jj <Plug>BookmarkMoveDown
nmap <Leader>g <Plug>BookmarkMoveToLine

let g:NERDTreeWinSize=30

" Slime config
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_default_config = {"socket_name": "default", "target_pane": ":0.1"}

" Enable exit from terminal mode
:tnoremap jj <C-\><C-n>
