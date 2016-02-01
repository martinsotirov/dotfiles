""" Plugins ========================
call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
    let g:ctrlp_working_path_mode = 'ca'
"Plug 'Valloric/YouCompleteMe'
Plug 'Shougo/neocomplete.vim'
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return pumvisible() ? "\<C-y>" : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    " Close popup by <Space>.
    inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

    " Enable omni completion.
    set omnifunc=syntaxcomplete#Complete
    "autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    "autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
    "autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    "autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
      let g:neocomplete#sources#omni#input_patterns = {}
    endif
    let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'

Plug 'Shougo/neosnippet.vim'
    imap <C-k> <Plug>(neosnippet_expand_or_jump)
    smap <C-k> <Plug>(neosnippet_expand_or_jump)
    xmap <C-k> <Plug>(neosnippet_expand_target)
Plug 'Shougo/neosnippet-snippets'
Plug 'shawncplus/phpcomplete.vim'
Plug 'vim-airline/vim-airline'
    set laststatus=2
    let g:airline_theme='base16'
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/syntastic'
    let g:syntastic_error_symbol = '✗'
    let g:syntastic_warning_symbol = '!'
    let g:syntastic_style_error_symbol = 'S✗'
    let g:syntastic_style_warning_symbol = 'S!'
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_aggregate_errors = 1
    let g:syntastic_php_checkers = ['php']
    let g:syntastic_javascript_checkers = ['eslint']
    let g:syntastic_javascript_eslint_exec = 'eslint_d'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-ctrlspace/vim-ctrlspace'
    " map <C-e> :CtrlSpace<CR>
Plug 'scrooloose/nerdtree'
    map <C-n><C-n> :NERDTreeToggle<CR>
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif""""
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Raimondi/delimitMate'
Plug 'tmhedberg/matchit'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
    let g:user_emmet_settings = {
      \  'php' : {
      \    'extends' : 'html',
      \    'filters' : 'c',
      \  },
      \}

" Language Specific
Plug 'StanAngeloff/php.vim'
Plug 'tpope/vim-unimpaired'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
    nmap <leader>t :TagbarOpenAutoClose<CR>

call plug#end()

""" General Settings ==============
set number
set mouse=a
set relativenumber
set cursorline
set clipboard=unnamed
set hidden
set tabstop=4 shiftwidth=4 expandtab
set hlsearch is ignorecase scs
"set tags+=tags;~
nmap <silent> <C-n> :noh<CR>
colorscheme base16-eighties
hi CursorLineNR cterm=bold ctermfg=100
"set path=$PWD/**

""" Shortcuts =====================
"nnoremap <c-d> viw
let mapleader = ","
let maplocalleader = ","
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
iabbrev @@ martin@evil.ninja
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
vnoremap " di"<esc>pa"<esc>
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
vnoremap ' di'<esc>pa'<esc>
inoremap jk <esc>
inoremap <esc> <nop>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
"iabbrev </ </<C-X><C-O>
"inoremap ' ''<Left>
"inoremap " ""<Left>

" Classic backspace
set backspace=indent,eol,start

" Line shifting with Opt+j/k
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv''

" Classic Tab indents
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Switch splits easier
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

""" Autocommands ==================
:filetype on
:autocmd FileType javascript nnoremap <buffer> <localleader>c I//jk
:autocmd FileType javascript iabbrev <buffer> iff if ()<left>
