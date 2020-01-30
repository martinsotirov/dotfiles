"" Plugins ========================
call plug#begin('~/.vim/plugged')

Plug 'zerowidth/vim-copy-as-rtf'
Plug 'godlygeek/tabular'

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    let g:deoplete#enable_at_startup = 1
    let g:LanguageClient_serverCommands = {
    \ 'vue': ['vls'],
    \ }

" PHP autocomplete source
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}

" JavaScript autocomplete source
Plug 'carlitux/deoplete-ternjs', { 'do': 'sudo npm install -g tern' }
    let g:deoplete#sources#ternjs#filetypes = [
        \ 'jsx',
        \ 'javascript.jsx',
        \ 'vue',
        \ 'ts'
        \ ]

" Go autocomplete source
Plug 'zchee/deoplete-go', { 'do': 'make'}

Plug 'scrooloose/nerdcommenter'
    let g:ft = ''
    function! NERDCommenter_before()
      if &ft == 'vue'
        let g:ft = 'vue'
        let stack = synstack(line('.'), col('.'))
        if len(stack) > 0
          let syn = synIDattr((stack)[0], 'name')
          if len(syn) > 0
            exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
          endif
        endif
      endif
    endfunction
    function! NERDCommenter_after()
      if g:ft == 'vue'
        setf vue
        let g:ft = ''
      endif
    endfunction
Plug 'scrooloose/nerdtree'
    map <C-n><C-n> :NERDTreeToggle<CR>
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif""""
    let g:NERDTreeIgnore=['.*.swp', '.tern-port']
    let g:NERDTreeWinSize=25
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
    let g:fzf_commits_log_options = '--graph --color=always
            \ --format="%C(yellow)%h%C(red)%d%C(reset)
            \ - %C(bold green)(%ar)%C(reset) %s %C(blue)<%an>%C(reset)"'
"Plug 'mileszs/ack.vim'
    "if executable('ag')
      "let g:ackprg = 'ag --vimgrep'
    "endif
Plug 'mhinz/vim-grepper'
    nnoremap <leader>g :GrepperRg<Space>
    nnoremap gr :Grepper -cword -noprompt<CR>
    xmap gr <plug>(GrepperOperator)
Plug 'tpope/vim-surround'
Plug 'ludovicchabant/vim-gutentags'
    set statusline+=%{gutentags#statusline()}
Plug 'majutsushi/tagbar'
    nmap <leader>te :TagbarOpenAutoClose<CR>
Plug 'SirVer/ultisnips'
    let g:UltiSnipsExpandTrigger = '<C-j>'

Plug 'honza/vim-snippets'
Plug 'tpope/vim-abolish'
Plug 'Raimondi/delimitMate'
Plug 'mattn/emmet-vim'
Plug 'dense-analysis/ale'
  let g:ale_linters = {
  \   'js': ['eslint'],
  \   'jsx': ['eslint'],
  \   'vue': ['eslint'],
  \   'php': ['php', 'phpcs'],
  \}
  " Run both javascript and vue linters for vue files.
  let g:ale_linter_aliases = {'vue': ['javascript', 'vue']}
  let g:ale_php_phpcs_use_global = 1
  let g:ale_php_phpcs_standard = 'PSR2'
  let g:ale_php_phpcs_executable = '/Users/martin/.composer/vendor/bin/phpcs'
  let g:ale_php_cs_fixer_executable = '/Users/martin/.composer/vendor/bin/php-cs-fixer'
  let g:ale_php_cs_fixer_use_global = 1
  let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \   'php': ['php_cs_fixer'],
  \   'js': ['eslint'],
  \}


" Language support
Plug 'pangloss/vim-javascript'
Plug 'Quramy/vim-js-pretty-template'
Plug 'posva/vim-vue'
" Always rehighlight Vue files when opening
autocmd FileType vue syntax sync fromstart
Plug 'fatih/vim-go'
Plug 'StanAngeloff/php.vim'
Plug 'lumiliet/vim-twig'
Plug 'mustache/vim-mustache-handlebars'
Plug 'metakirby5/codi.vim'
Plug 'mattn/webapi-vim'
Plug 'rust-lang/rust.vim'
Plug 'joonty/vdebug'
    let g:vdebug_options = {
    \   "path_maps": {},
    \   "break_on_open": 0
    \}
    let g:vdebug_options["path_maps"]['/var/www/app/']='/Users/msotirov/Sites/dapp-vagrant/app/'

Plug 'janko/vim-test'
Plug 'editorconfig/editorconfig-vim'
Plug 'leafgarland/typescript-vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'Yggdroot/indentLine'
Plug 'tveskag/nvim-blame-line'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

""" General Settings ==============
set number
set mouse=a
set relativenumber
set cursorline
set clipboard=unnamed
set hidden
set tabstop=4 shiftwidth=4 expandtab

autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
autocmd Filetype vue setlocal ts=2 sw=2 expandtab
autocmd Filetype yaml setlocal ts=2 sw=2 expandtab
autocmd Filetype json setlocal ts=2 sw=2 expandtab
autocmd Filetype cucumber setlocal ts=2 sw=2 expandtab
autocmd Filetype typescript setlocal ts=2 sw=2 expandtab
au BufNewFile,BufRead,BufReadPost *.xml.dist set syntax=XML
au BufNewFile,BufRead,BufReadPost *.html.tera set syntax=twig

set hlsearch is ignorecase scs
nmap <silent> <C-n> :noh<CR>
hi CursorLineNR cterm=bold ctermfg=100
set fillchars+=vert:│
highlight VertSplit ctermbg=NONE guibg=NONE
set fileencoding=utf8
colorscheme base16-eighties

" set the color theme via the iTerm theme
if has("nvim")
    set termguicolors
endif

""" Swap files ===================
set backupdir=~/.vim/swap
set directory=~/.vim/swap

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
inoremap jk <esc>
inoremap <esc> <nop>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" custom search command
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
nnoremap <leader>f :Find<Space>
nnoremap \ :Find<Space>

"nnoremap <leader>f :Ack!<Space>
"nnoremap <leader>F :AckFromSearch<cr>

" Tabular
nnoremap <leader>a :Tabularize /
vnoremap <leader>a :Tabularize /

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

" fzf
nnoremap <leader>o :Files<CR>
nnoremap <leader><space> :Buffers<CR>
nnoremap <leader>r :Rg<CR>
nnoremap <leader>! :Rg!<CR>
nnoremap <leader>c :Commits<CR>
nnoremap <leader>b :BCommits<CR>

" Align on paste
:nnoremap p p=`]

" snippet expansion
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
