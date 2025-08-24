" ------------------------------
" Bootstrap vim-plug if not installed
" ------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ------------------------------
" General Settings
" ------------------------------
set nocompatible
syntax on
filetype plugin indent on

set number                      " Show line numbers
set relativenumber              " Show relative numbers
set cursorline                  " Highlight current line

set tabstop=2                   " Tabs are 4 spaces
set shiftwidth=2
set softtabstop=2
set expandtab                   " Convert tabs to spaces

set ignorecase                  " Case-insensitive search
set smartcase                   " Unless uppercase present
set incsearch                   " Highlight as you type
set hlsearch                    " Highlight matches

set clipboard=unnamedplus        " Use system clipboard
set mouse=a                      " Mouse enabled everywhere
set ttymouse=sgr                 " Better mouse support

set splitbelow splitright         " New splits open more naturally
set complete+=.,w,b,u,t
set wildmenu                      " Tab completion for commands
set wildmode=longest:full,full

set updatetime=300               " Faster CursorHold (ALE, gitgutter updates)
set lazyredraw                   " Don’t redraw mid-macro

set undofile                     " Persistent undo
set swapfile                      " Keep swap files (optional)
set backspace=indent,eol,start    " Smarter backspace

" Faster escape (jk to leave insert mode)
inoremap jk <Esc>

" Leader key
let mapleader = ","
" let mapleader=" "

" ------------------------------
" Plugin Management
" ------------------------------
call plug#begin('~/.vim/plugged')

" File navigation
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

" Search / Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Editing enhancements
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-repeat'          " Repeat surround/comment actions with .

" Linting / Formatting (modern replacement for syntastic)
Plug 'dense-analysis/ale'

" Languages / Syntax
Plug 'vim-ruby/vim-ruby'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'towolf/vim-helm'
Plug 'pearofducks/ansible-vim'
Plug 'plasticboy/vim-markdown'

" Utilities
Plug 'tpope/vim-eunuch'          " :Rename, :Delete, etc.
Plug 'diepm/vim-rest-console'    " Test REST APIs from Vim

call plug#end()

" ------------------------------
" Plugin Configurations
" ------------------------------

" NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1

" FZF shortcuts
" nnoremap <C-p> :Files<CR>
nmap <leader>t :Files<CR>
nnoremap <leader>r :Rg<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>h :History<CR>

" Git fugitive
nnoremap <leader>g :Git<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gl :Git log --oneline --graph --decorate<CR>

" ALE (linting & fixing)
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
let g:ale_linters = {
\   'python': ['flake8', 'mypy'],
\   'go': ['gopls'],
\   'javascript': ['eslint'],
\   'sh': ['shellcheck'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black'],
\   'go': ['gofmt'],
\   'javascript': ['prettier'],
\}
nnoremap <leader>af :ALEFix<CR>
nnoremap <leader>an :ALENext<CR>
nnoremap <leader>ap :ALEPrevious<CR>

" Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0

" Ansible
let g:ansible_extra_keywords_highlight = 1
let g:ansible_name_highlight = 'd'
let g:ansible_attribute_highlight = "ob"
let g:ansible_normal_keywords_highlight = 'Constant'
let g:ansible_loop_keywords_highlight = 'Constant'

" Go
let g:go_def_mapping_enabled = 0 " Don't override gd
autocmd FileType go nmap <leader>r :GoRun<CR>
autocmd FileType go nmap <leader>t :GoTest<CR>

" REST Console
nnoremap <leader>rr :call VrcQuery()<CR>

" ------------------------------
" QoL Shortcuts
" ------------------------------
nnoremap <leader>w :w<CR>            " Save
nnoremap <leader>q :q<CR>            " Quit
nnoremap <leader>x :x<CR>            " Save & quit
nnoremap <leader>sv :source $MYVIMRC<CR> " Reload config
nnoremap <leader>ev :vsplit $MYVIMRC<CR> " Edit config

" Move between splits easier
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
