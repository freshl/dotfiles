" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')


" ***********************
" ****** PLUGINS ********
" ***********************
" THEME STUFF
Plug 'tpope/vim-surround'
Plug 'joshdick/onedark.vim'
Plug 'mhartington/oceanic-next'

" BUGGED Plug 'sheerun/vim-polyglot'

Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'

" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

Plug 'jlanzarotta/bufexplorer'

Plug 'itchyny/lightline.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'php',
    \ 'python',
    \ 'ruby',
    \ 'html',
    \ 'swift' ] }

" Plug 'lifepillar/vim-mucomplete'

Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'HerringtonDarkholme/yats.vim'

call plug#end()

" ***********************
" **** BASE SETTINGS ****
" ***********************
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme OceanicNext

" search
set incsearch
set hlsearch

set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on

let mapleader = ","
set rtp+=/usr/local/opt/fzf

" ***********************
" ******* EDITOR ********
" ***********************

" turn hybrid line numbers on
:set number relativenumber
:set nu rnu

" toggle hybrid line numbers
:set number! relativenumber!
:set nu! rnu!

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set completeopt=menu,menuone,preview,noselect,noinsert

" ***********************
" *** PLUGIN SETTINGS ***
" ***********************

" Tab stuff
:set tabstop=2
:set shiftwidth=2
:set expandtab

" Lightline
set laststatus=2

" prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.json,*.css,*.scss,*.less,*.graphql PrettierAsync
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript

" MUComplete
set completeopt+=menuone
set shortmess+=c
let g:mucomplete#enable_auto_at_startup = 1

" vim jsx-pretty
let g:vim_jsx_pretty_colorful_config = 1 " default 0

" lightline config
let g:lightline = {
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'readonly', 'filename', 'modified' ] ],
  \   'right': [ [ 'lineinfo'],
  \             [ 'percent' ], 
  \             [ 'fileformat', 'filetype' ],
  \             [ 'gitbranch' ]
  \             ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head'
  \ },
  \ }

" ***********************
" *** USER BINDINGS *****
" ***********************

" save file with ctrl-s
nmap <c-s> :w<cr>
imap <c-s> <esc>:w<cr>a

" window switching
nmap <silent> <leader>lw :wincmd h<CR>
nmap <silent> <leader>rw :wincmd l<CR>
nmap <silent> <leader>bw :wincmd j<CR>
nmap <silent> <leader>tw :wincmd k<CR>

" easy close
map <leader>c   :close<CR>

" MOVING LINES LAZY
" Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" remove visual search with esc
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" ***********************
" *** PLUGIN BINDINGS ***
" ***********************

" FZF
nmap <leader>p :FZF<CR>

" BUFExplorer
map <leader>o :BufExplorer<cr>

" Fugitive
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gp :Gpush<cr>

" ***********************
" ******* RUNTIME *******
" ***********************
runtime macros/matchit.vim

" ***********************
" **** HELP FILES GEN ***
" ***********************

packloadall
silent! helptags ALL
