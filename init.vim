call plug#begin()
Plug 'hashivim/vim-terraform'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'rust-lang/rust.vim'
Plug 'ckarnell/Antonys-macro-repeater'
Plug 'machakann/vim-textobj-functioncall' 
Plug 'jiangmiao/auto-pairs'
Plug 'michaeljsmith/vim-indent-object'
Plug 'terryma/vim-multiple-cursors'
Plug 'voldikss/vim-floaterm'
Plug 'kdheepak/lazygit.nvim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-endwise'
Plug 'AndrewRadev/sideways.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'rhysd/devdocs.vim'
Plug 'preservim/tagbar'
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
filetype plugin indent on
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
set linebreak
syntax enable
set wrap
set encoding=utf-8
set fileencoding=utf-8

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
set foldmethod=syntax
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

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" Map jj to ESC
imap jj <ESC>

" nnoremap <C-p> :Files<CR>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <leader>ff <C-p> :Files<CR>
nnoremap <leader>fg <cmd>lua require("telescope.builtin").live_grep()<cr>
nnoremap <leader>fe <cmd>lua require("telescope").extensions.live_grep_raw.live_grep_raw()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
" nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

nnoremap <silent> <leader>tt :TestNearest<CR>
nnoremap <silent> <leader>TT :TestFile<CR>
nnoremap <silent> <leader>a :TestSuite<CR>
nnoremap <silent> <leader>l :TestLast<CR>
nnoremap <silent> <leader>g :TestVisit<CR>

" NERDTree mappings
"nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-\> :NERDTree<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
" autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
"     \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" let g:mix_format_on_save = 0
let test#strategy = 'neovim'

" Mapping jump to declaration and reference for coc-elixir
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

" Color Scheme
syntax on
set t_Co=256
set cursorline
" colorscheme onehalfdark
" colorscheme nightfox
" colorscheme shades_of_purple
colorscheme spaceduck

" let g:shades_of_purple_airline = 1
" let g:airline_theme='shades_of_purple'
let g:airline_theme='spaceduck'

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
" :tnoremap jj <C-\><C-n>

" Tagbar mapping
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'p:protocols',
        \ 'm:modules',
        \ 'e:exceptions',
        \ 'y:types',
        \ 'd:delegates',
        \ 'f:functions',
        \ 'c:callbacks',
        \ 'a:macros',
        \ 't:tests',
        \ 'i:implementations',
        \ 'o:operators',
        \ 'r:records'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 'p' : 'protocol',
        \ 'm' : 'module'
    \ },
    \ 'scope2kind' : {
        \ 'protocol' : 'p',
        \ 'module' : 'm'
    \ },
    \ 'sort' : 0
\ }

" DevDocs quick search
nmap K <Plug>(devdocs-under-cursor)

" Sideways mappings
nmap <;  :SidewaysLeft<cr>
nmap >;  :SidewaysRight<cr>
omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI
nmap <leader>si <Plug>SidewaysArgumentInsertBefore
nmap <leader>sa <Plug>SidewaysArgumentAppendAfter
nmap <leader>sI <Plug>SidewaysArgumentInsertFirst
nmap <leader>sA <Plug>SidewaysArgumentAppendLast

" Lazygit.vim mappings
nnoremap <silent> <leader>gg :FloatermNew --height=0.9 --width=0.9 lazygit<CR>

" Float term mappings
nnoremap   <silent>   <F7>    :FloatermNew<CR>
" let g:floaterm_keymap_prev   = '<F8>'
" let g:floaterm_keymap_next   = '<F9>'
" let g:floaterm_keymap_toggle = '<F12>'

" Multi-cursor mappings
let g:multi_cursor_use_default_mapping=0

let g:multi_cursor_start_word_key      = '<C-m>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-m>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" Edit vimrc configuration file
nnoremap <Leader>ve :e $MYVIMRC<CR>
" Reload vimrc configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>
" Install Vim plugins
nnoremap <Leader>ii :PlugInstall<CR>
