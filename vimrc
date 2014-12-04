execute pathogen#infect()

syntax enable
set encoding=utf-8

" {{{ Tab stop configurations
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
" }}}

" {{{ UI Configurations
set number
set showcmd
set cursorline
set laststatus=2
set backspace=2 " make backspace work like most other apps
set t_Co=256

set guioptions-=r
set guifont=Inconsolata\ for\ Powerline:h14

filetype indent on

set wildmenu
set lazyredraw
set showmatch
" }}}

" {{{ Searching configurations
set incsearch
set hlsearch
" }}}

" {{{ Folding configurations
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=marker
" }}}

" {{{ Language specific configurations
" {{{ Python
au FileType py set autoindent
augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
augroup END
" }}}
" }}}

" {{{ Shortcut mappings
noremap <C-j> <C-w><C-j>
noremap <C-l> <C-w><C-l>
noremap <C-k> <C-w><C-k>
noremap <C-h> <C-w><C-h>
noremap <C-t> :TagbarToggle<CR>
" }}}

" {{{ Python mode configurations
let g:pymode_rope=0

let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

let g:pymode_lint = 0
let g:pymode_lint_checker = "pyflakes,pep8"

let g:pymode_lint_write = 1

let g:pymode_virtualenv = 1

let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

let g:pymode_folding = 0

let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=5

nmap <Leader>R :PymodeRun<cr>
" }}}

" {{{ Syntastic configurations
let g:syntastic_python_checkers = ['pyflakes', 'pep8']
let g:syntastic_javascript_checkers = ['jslint', 'jshint']
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['scala', 'rst'] } " Turning off scala checking
" }}}

" {{{ Django settings
" Surround plugin configurations
let b:surround_{char2nr("v")} = "{{ \r }}"
let b:surround_{char2nr("{")} = "{{ \r }}"
let b:surround_{char2nr("%")} = "{% \r %}"
let b:surround_{char2nr("b")} = "{% block \1block name: \1 %}\r{% endblock \1\1 %}"
let b:surround_{char2nr("i")} = "{% if \1condition: \1 %}\r{% endif %}"
let b:surround_{char2nr("w")} = "{% with \1with: \1 %}\r{% endwith %}"
let b:surround_{char2nr("f")} = "{% for \1for loop: \1 %}\r{% endfor %}"
let b:surround_{char2nr("c")} = "{% comment %}\r{% endcomment %}"
" }}}

" {{{ Vertical line indentation
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'

let delimitMate_expand_cr = 1
" }}}

" {{{ Eclim mappings
nnoremap <silent> <buffer> <leader>i :JavaImport<cr>
nnoremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<cr>
nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>
nnoremap <silent> <buffer> <leader>ji :JavaImportOrganize<cr>
nnoremap <silent> <buffer> <leader>jf :JavaFormat<cr>
" }}}

" {{{ SnipMate configurations
let g:snips_author = "anticlockwise5"
let g:snips_email = "anticlockwise5@gmail.com"
let g:snips_github="https://github.com/anticlockwise"
let g:SuperTabDefaultCompletionType = "context"
" }}}

" {{{ EasyMotion configuration
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0
" }}}

set background=dark
colorscheme solarized
