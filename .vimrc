""" Plugins ========================
call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline'
    set laststatus=2
    let g:airline_theme='base16'
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'scrooloose/nerdtree'
    map <C-h> :NERDTreeToggle<CR>
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif""""

call plug#end()

""" General Settings ==============
set number
set cursorline
set hidden
set tabstop=4 shiftwidth=4 expandtab
set hlsearch is ignorecase scs
nmap <silent> <C-n> :noh<CR>
colorscheme base16-eighties

""" Shortcuts =====================
nnoremap <c-d> viw
let mapleader = ","
let maplocalleader = ","
nnoremap <leader><leader> I"<esc>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
iabbrev @@ martin@evil.ninja
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
vnoremap " di"<esc>pa"<esc>
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
vnoremap ' di'<esc>pa'<esc>
inoremap jk <esc>
inoremap <esc> <nop>
inoremap ' ''<Left>
inoremap " ""<Left>
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv''
map <C-e> :CtrlSpace<CR>

""" Autocommands ==================

:filetype on
:autocmd FileType javascript nnoremap <buffer> <localleader>c I//jk
:autocmd FileType javascript iabbrev <buffer> iff if ()<left>
