" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')


" ***********************
" ****** PLUGINS ********
" ***********************
" THEME STUFF

Plug 'joshdick/onedark.vim'
Plug 'mhartington/oceanic-next'
Plug 'haishanh/night-owl.vim'
Plug 'arzg/vim-colors-xcode'
Plug 'artanikin/vim-synthwave84'
Plug 'megantiu/true.vim'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'dracula/vim', { 'as': 'dracula' }

" BUGGED Plug 'sheerun/vim-polyglot'

Plug 'tpope/vim-surround'
Plug 'wincent/ferret'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'

Plug 'scrooloose/nerdtree'

Plug 'Yggdroot/indentLine'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'tpope/vim-rails'
Plug 'evanleck/vim-svelte'

Plug 'reasonml-editor/vim-reason-plus'

Plug 'jlanzarotta/bufexplorer'

Plug 'itchyny/lightline.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Plug 'prettier/vim-prettier', {
"   \ 'do': 'yarn install',
"   \ 'branch': 'release/1.x',
"   \ 'for': [
"     \ 'javascript',
"     \ 'typescript',
"     \ 'css',
"     \ 'less',
"     \ 'scss',
"     \ 'json',
"     \ 'graphql',
"     \ 'markdown',
"     \ 'php',
"     \ 'python',
"     \ 'ruby',
"     \ 'html',
"     \ 'swift' ] }

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
colorscheme night-owl

" search
set incsearch
set hlsearch

" remove warning for unsaved buffers on buffer switch
set hidden

set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on

let mapleader = ","
set rtp+=/usr/local/opt/fzf

" Cursor Settings
" highlight Cursor guifg=white guibg=steelblue
" highlight iCursor guifg=white guibg=steelblue
" set guicursor=n-v-c:v25-Cursor
" set guicursor+=n-v-c:blinkon0
" set guicursor+=i:ver100-iCursor
" set guicursor+=i:blinkwait10


" ***********************
" ******* EDITOR ********
" ***********************

" turn hybrid line numbers on
set number relativenumber
set nu rnu

" toggle hybrid line numbers
set number! relativenumber!
set nu! rnu!

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" ignore swapmessage warnings
set shortmess+=A

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
" let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.json,*.css,*.scss,*.less,*.graphql PrettierAsync
" autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript

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

" coc.vim
" default installs
let g:coc_global_extensions = [
  \   'coc-prettier', 'coc-eslint', 'coc-tsserver',
  \   'coc-json', 'coc-css'
  \ ]
nmap <silent> <leader>rf <Plug>(coc-refactor)

" coc.vim prettier act
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Nerdtreee
let NERDTreeShowHidden=1

" vinegar

" indentLine
let g:indentLine_char = '.'

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

" COC VIM
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>cf <Plug>(coc-fix-current)

" find and replace
nmap <leader>fr :%s/<c-r>=expand("<cword>")<cr>//c<left><left>

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

" NERDTree
map <leader>nt :NERDTreeToggle<CR>

" ***********************
" ******* RUNTIME *******
" ***********************
runtime macros/matchit.vim

" ***********************
" **** HELP FILES GEN ***
" ***********************

packloadall
silent! helptags ALL
