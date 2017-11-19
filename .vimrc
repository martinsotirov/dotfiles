"" Plugins ========================
call plug#begin('~/.vim/plugged')

Plug 'godlygeek/tabular'
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
    let g:neocomplete#fallback_mappings = ["\<C-x>\<C-o>", "\<C-x>\<C-n>"]

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
Plug 'chriskempson/base16-vim'
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
    "let g:syntastic_go_checkers = ['gometalinter']
    let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
    let syntastic_mode_map = { 'passive_filetypes': ['html'] }
    let g:syntastic_cpp_compiler = 'clang++'
    let g:syntastic_cpp_compiler_options = ' -std=c++14 -stdlib=libc++'

function! SyntasticESlintChecker()
    let l:npm_bin = ''
    let l:eslint= 'eslint'

    if executable('npm')
        let l:npm_bin = split(system('npm bin'), '\n')[0]
    endif

    if strlen(l:npm_bin) && executable(l:npm_bin . '/eslint')
        let l:eslint = l:npm_bin . '/eslint'
    endif

    let b:syntastic_javascript_eslint_exec = l:eslint
endfunction

autocmd FileType javascript :call SyntasticESlintChecker()

Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
    map <C-n><C-n> :NERDTreeToggle<CR>
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif""""
    let g:NERDTreeIgnore=['node_modules']
    let g:NERDTreeWinSize=23
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
"Plug 'ludovicchabant/vim-gutentags'
    "let g:gutentags_tagfile='.git/tags'
Plug 'majutsushi/tagbar'
    nmap <leader>te :TagbarOpenAutoClose<CR>
Plug 'joonty/vdebug'
    let g:vdebug_options = {
    \   "path_maps": {},
    \   "break_on_open": 0
    \}
    "let g:vdebug_options["break_on_open"] = 0
    "let g:vdebug_options["path_maps"]['/var/www/server/']='/Users/msotirov/Sites/inventory/server/'
    "let g:vdebug_options["path_maps"]['/var/www/html']='/Users/msotirov/Sites/dbue/wordpress/'
    let g:vdebug_options["path_maps"]['/var/www/wordpress/']='/Users/msotirov/Sites/rne/wordpress/'
    "let g:vdebug_keymap = {
    "\   'run'            : "<Leader>r",
    "\   'close'          : "<Leader>c",
    "\   'set_breakpoint' : "<Leader>b"
    "\}

    "let g:vdebug_keymap = {
    "\    "run" : "<F5>",
    "\    "run_to_cursor" : "<F9>",
    "\    "step_over" : "<F2>",
    "\    "step_into" : "<F3>",
    "\    "step_out" : "<F4>",
    "\    "close" : "<F6>",
    "\    "detach" : "<F7>",
    "\    "set_breakpoint" : "<F10>",
    "\    "get_context" : "<F11>",
    "\    "eval_under_cursor" : "<F12>",
    "\    "eval_visual" : "<Leader>e",
    "\}

Plug 'rking/ag.vim'
Plug 'Chun-Yang/vim-action-ag'
Plug 'junegunn/fzf'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
    let g:rg_command = '
      \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
      \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
      \ -g "!{.git,node_modules,vendor}/*" '

    command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

Plug 'mustache/vim-mustache-handlebars'
Plug 'Slava/vim-spacebars'
Plug 'posva/vim-vue'
Plug 'fatih/vim-go'
Plug 'lumiliet/vim-twig'
Plug 'tpope/vim-surround'
Plug 'Quramy/vim-js-pretty-template'
Plug 'pangloss/vim-javascript'

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
nmap <silent> <C-n> :noh<CR>
colorscheme base16-eighties
hi CursorLineNR cterm=bold ctermfg=100
set fillchars+=vert:│
highlight VertSplit ctermbg=NONE guibg=NONE

""" Swap files ===================
set backupdir=./.backup,.,/tmp
set directory=.,./.backup,/tmp

""" Drupal Support ================
if has("autocmd")
    " Uncomment the following to have Vim jump to the last position when
    " reopening a file
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

    " Set Drupal files as php
    augroup module
        autocmd BufRead,BufNewFile *.module set filetype=php
        autocmd BufRead,BufNewFile *.php set filetype=php
        autocmd BufRead,BufNewFile *.install set filetype=php
        autocmd BufRead,BufNewFile *.test set filetype=php
        autocmd BufRead,BufNewFile *.inc set filetype=php
        autocmd BufRead,BufNewFile *.profile set filetype=php
        autocmd BufRead,BufNewFile *.theme set filetype=php
    augroup END
    " Source vimrc file after saving it
    " autocmd bufwritepost .vimrc source $MYVIMRC
endif

""" Shortcuts =====================
let mapleader = ","
let maplocalleader = ","
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
iabbrev @@ martin@evil.ninja
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
"vnoremap " di"<esc>pa"<esc>
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
"vnoremap ' di'<esc>pa'<esc>
inoremap jk <esc>
inoremap <esc> <nop>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Tabular
nnoremap <leader>a :Tabularize /
vnoremap <leader>a :Tabularize /

" Classic backspace
set backspace=indent,eol,start

" fzf
nnoremap <leader>o :Files<CR>
nnoremap <leader><space> :Buffers<CR>

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

" nerdcommenter - vue compat
" doesn't really work
"fu! NERDCommenter_before()
  "if &ft == 'vue'
    "let g:ft = 'vue'
    "let stack = synstack(line('.'), col('.'))
    "if len(stack) > 0
      "let syn = synIDattr((stack)[0], 'name')
      "if len(syn) > 0
        "let syn = tolower(syn)
        "exe 'setf '.syn
      "endif
    "endif
  "endif
"endfu
"fu! NERDCommenter_after()
  "if g:ft == 'vue'
    "setf vue
    "g:ft
  "endif
"endfu
