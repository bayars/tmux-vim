if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set tabstop=2       " The width of a TAB is set to 4.
set shiftwidth=2    " Indents will have a width of 4
set softtabstop=2   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces
set backspace=indent,eol,start
" set relativenumber
set number
set mouse=n
set ttymouse=xterm2

let mapleader = ","

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

set term=xterm
set termguicolors

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" Ale Settings
let g:ale_completion_enabled = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_python_ruff_executable = 'ruff'
let g:ale_python_ruff_options = ''
let g:ale_linters = {
\   'python': ['ruff'],
\}
let g:ale_yaml_yamllint_options='-d "{extends: relaxed, rules: {line-length: disable}}"'

" poetry settings
let g:ale_fix_on_save = 1
let g:ale_python_auto_poetry = 1
let g:ale_python_autoflake_auto_poetry = 1
let g:ale_python_autoimport_auto_poetry = 1
let g:ale_python_autopep8_auto_poetry = 1
" let g:ale_python_black_auto_poetry = 1
let g:ale_python_flake8_auto_poetry = 1
let g:ale_python_flakehell_auto_poetry = 1
let g:ale_python_isort_auto_poetry = 1
" let g:ale_python_mypy_auto_poetry = 1
let g:ale_python_pycodestyle_auto_poetry = 1
let g:ale_python_pyflakes_auto_poetry = 1
" let g:ale_python_pylint_auto_poetry = 1
let g:ale_python_ruff_auto_poetry = 1
let g:ale_python_ruff_executable = 'poetry run ruff'
let g:ale_python_ruff_format_auto_poetry = 1


" Ale eslint
let g:ale_fixers = {}
let g:ale_fixers.javascript = ['eslint']
let g:ale_fix_on_save = 1

" Ansible Settings
let g:ansible_extra_keywords_highlight = 1
let g:ansible_name_highlight = 'd'
let g:ansible_attribute_highlight = "ob"
let g:ansible_normal_keywords_highlight = 'Constant'
let g:ansible_loop_keywords_highlight = 'Constant'


" let g:jedi#force_py_version = 3
let g:jedi#completions_enabled = 1
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#show_call_signatures = "1"
imap <C-Space> <Plug>(jedi#completions)


nmap <leader>t :FZF<CR>

inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<Up>"

" set nocompatible
" filetype plugin indent on
" syntax on


" let g:jedi#force_py_version = '3.10'
" let g:jedi#force_py_env = '/usr/bin/python3'
" au BufNewFile, BufRead *.py



let NERDTreeShowHidden=1
call plug#begin()
Plug 'preservim/nerdtree'
Plug 'vim-ruby/vim-ruby'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'plasticboy/vim-markdown'
Plug 'pearofducks/ansible-vim'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-eunuch'
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'
" Plug 'preservim/vim-markdown'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jiangmiao/auto-pairs'
Plug 'towolf/vim-helm'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'diepm/vim-rest-console'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
Plug 'dense-analysis/ale'
Plug 'wsdjeg/FlyGrep.vim'
Plug 'davidhalter/jedi-vim'
call plug#end()
