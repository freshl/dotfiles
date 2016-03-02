set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/syntastic'
Plugin 'msanders/snipmate.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'tpope/vim-commentary'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-scripts/bufexplorer.zip'
Plugin 'ternjs/tern_for_vim'

" Use custom vim-hybrid fork
Plugin 'freshl/vim-hybrid'
Plugin 'chriskempson/base16-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax on
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" CUSTOM STUFF

let mapleader=","

" colorscheme hybrid
colorscheme hybrid
set background=dark
set encoding=utf8
let base16colorspace=256  " Access colors present in 256 colorspace"
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors"
set number
set rnu
set guifont=Hack:h13

" INDENTION WIDTH SPACES AND STUFF
set expandtab
set shiftwidth=2
set softtabstop=2
set smarttab
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set showmatch
set encoding=utf8

" Multiple Select Fix
set selection=inclusive
let g:multi_cursor_next_key="\<C-s>"

" AIRLINE STUFF
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
if isdirectory(expand("~/.vim/bundle/vim-airline-themes/"))
    if !exists('g:airline_theme')
        let g:airline_theme = 'powerlineish'
    endif
    " if !exists('g:airline_powerline_fonts')
    "     " Use the default set of separators with a few customizations
    "     let g:airline_left_sep='›'  " Slightly fancier than '>'
    "     let g:airline_right_sep='‹' " Slightly fancier than '<'
    " endif
endif
let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep= ''
let g:airline_left_sep = ''

" don't hide quotes in json files
let g:vim_json_syntax_conceal = 0

" NERDTREE / NERDTREE TABS
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35

" SEARCH STUFF
set incsearch
set hlsearch
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" STATUSLINE
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" MAPS
nnoremap <C-t>    <Esc>:tabnew<CR>
nnoremap <C-w>    <Esc>:tabclose<CR>

vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

nmap <silent> <leader>lw :wincmd h<CR>
nmap <silent> <leader>rw :wincmd l<CR>
nmap <silent> <leader>bw :wincmd j<CR>
nmap <silent> <leader>tw :wincmd k<CR>

let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'

map <leader>nt :NERDTreeToggle<CR>
map <leader>c   :close<CR>

" Multicursor
let g:multi_cursor_next_key='<leader>mc'

" CTRLP CUSTOM IGNORES
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" REMOVE SCROLLBARS
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" TAB LINE STUFF

" BUFF EXPLORER
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>

" CUSTOM FUNCTIONS HELPER
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

if has("autocmd")
   au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


func! CurrentFileDir(cmd)
    return a:cmd . " " . expand("%:p:h") . "/"
endfunc
