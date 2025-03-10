if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set backspace=indent,eol,start
set number
set relativenumber
set mouse=n
set ttymouse=xterm2
set background=dark
set term=xterm
set termguicolors

let NERDTreeShowHidden=1
let mapleader = ","

" LaTeX file reading
filetype plugin on
set shellslash
filetype indent on
let g:tex_flavor='latex'

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

nmap <leader>t :FZF<CR>
nmap <leader>g :FlyGrep<CR>

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<Up>"

call plug#begin()
function! EnableCodingMode()
  Plug 'vim-ruby/vim-ruby'
  Plug 'octol/vim-cpp-enhanced-highlight'
  " Plug 'plasticboy/vim-markdown'
  " Plug 'preservim/vim-markdown'
  Plug 'pearofducks/ansible-vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'diepm/vim-rest-console'
  Plug 'psf/black', { 'branch': 'stable' }
  Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
  Plug 'dense-analysis/ale'
  Plug 'davidhalter/jedi-vim'
  Plug 'towolf/vim-helm'
  PlugInstall | source $MYVIMRC
endfunction
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'wsdjeg/FlyGrep.vim'
Plug 'tpope/vim-eunuch'
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

function! EnableCodingMode()
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
  " let g:jedi#use_tabs_not_buffers = 1
  let g:jedi#show_call_signatures = "1"
  imap <C-Space> <Plug>(jedi#completions)
endfunction

command! CodingMode call EnableCodingMode()
