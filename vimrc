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

" Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'tpope/vim-surround'
Plugin 'benekastah/neomake'
Plugin 'msanders/snipmate.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jakar/vim-json'
" Plugin 'othree/yajs.vim'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
" Plugin 'vim-scripts/YankRing.vim'
Plugin 'tpope/vim-commentary'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-scripts/bufexplorer.zip'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'sickill/vim-pasta'
" Plugin 'jiangmiao/auto-pairs'
Plugin 'Shougo/deoplete.nvim'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'gregsexton/MatchTag'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'isRuslan/vim-es6'
Plugin 'leafgarland/typescript-vim'
Plugin 'flowtype/vim-flow'
Plugin 'steelsojka/deoplete-flow'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tomtom/quickfixsigns_vim'
Plugin 'terryma/vim-smooth-scroll'

" colorschemes
Plugin 'mhartington/oceanic-next'
" Plugin 'joshdick/onedark.vim'
" Plugin 'w0ng/vim-hybrid'
" Plugin 'colepeters/spacemacs-theme.vim'
" Plugin 'rakr/vim-one'

" Markdown settings

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

" DEV ICONS
" DEOPLETE
let g:deoplete#sources#flow#flow_bin = 'flow' 

" FLOW stuff
let g:neomake_javascript_enabled_makers = ['flow']
let g:neomake_jsx_enabled_makers = ['flow']

" Exit Terminal with ESC
:tnoremap <Esc> <C-\><C-n>

" jsx for js files
let g:jsx_ext_required = 0

" neocomplete on start
let g:deoplete#enable_at_startup = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" deoplete tab-complete
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" ,<Tab> for regular tab
inoremap <Leader><Tab> <Space><Space>
" tern
" autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

" SMMOTH SCROLL
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let mapleader=","

 " For Neovim 0.1.3 and 0.1.4
 let $NVIM_TUI_ENABLE_TRUE_COLOR=1

 " Or if you have Neovim >= 0.1.5
 if (has("termguicolors"))
   set termguicolors
 endif

 " Theme
 syntax enable
 colorscheme OceanicNext
 let g:onedark_termcolors=256
 set background=dark

" FONT STUFF
set encoding=utf8
set number
set rnu
" set guifont=Knack\ Nerd\ Font:h11
" set guifont=Fira\ Mono\ Font:h11

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
set hidden
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='oceanicnext'
" let g:airline_theme='base16_solarized'
cnoreabbrev <expr> x getcmdtype() == ":" && getcmdline() == 'x' ? 'Sayonara' : 'x'
nmap <leader>t :term<cr>
nmap <leader>, :bnext<CR>
nmap <leader>. :bprevious<CR>
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
set guifont=Knack\ Nerd\ Font:h16

" don't hide quotes in json files
let g:vim_json_syntax_conceal = 0

" NERDTREE / NERDTREE TABS
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__', 'node_modules']
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

" Find todo and fixme stuff + copen
" ST ShowTodo
nmap <silent> <leader>st :grep -r --exclude-dir=node_modules TODO .<CR>:copen<CR>

" save file with ctrl-s
inoremap <C-s> <esc>:w<CR>
nmap <C-s> :w<CR>

nmap <silent> <leader>yr :YRShow<CR>

map <leader>nt :NERDTreeFind<CR>
map <leader>c   :close<CR>

map <leader>fc :NERDTreeFind<CR>

" Multicursor
let g:multi_cursor_next_key='<leader>mc'

" CTRLP CUSTOM IGNORES
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = '\v[\/]\.(DS_Storegit|hg|svn|optimized|compiled|node_modules)$'
let g:ctrlp_show_hidden = 1

let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'

" FZF
" let g:fzf_layout = { 'down': '~25%' }
" nmap <silent> <leader>p :FZF<cr>

" let $FZF_DEFAULT_COMMAND= 'ag -g ""'

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

set wildignore+=**/node_modules   " ignores node_modules
set wildignore+=**/spec/reports   " ignores spec/reports
set wildignore+=**/tmp/cache      " ignores tmp/cache

" NEOVIM PYTHON FIX
let g:ycm_path_to_python_interpreter = '/usr/bin/python2.7'

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


" MOVING LINES LAZY
" Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" Insert mode
" inoremap <C-j> <ESC>:m .+1<CR>==gi
" inoremap <C-k> <ESC>:m .-2<CR>==gi

" Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" NEOMAKE
let g:neomake_open_list=1
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_logfile = '/usr/local/var/log/neomake.log'
autocmd! BufWritePost * Neomake

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" CUSTOM FUNCTIONS HELPER
" function! HasPaste()
"     if &paste
"         return 'PASTE MODE  '
"     endif
"     return ''
" endfunction

if has("autocmd")
   au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


func! CurrentFileDir(cmd)
    return a:cmd . " " . expand("%:p:h") . "/"
endfunc

