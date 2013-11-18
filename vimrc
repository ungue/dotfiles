syntax on

set nocompatible
set laststatus=2
set encoding=utf-8
set t_Co=256
set runtimepath+=~/.vim/bundle/neobundle.vim/

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'Lokaltog/vim-distinguished'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'mustache/vim-mode'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'guns/xterm-color-table.vim'
NeoBundle 'godlygeek/csapprox'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'thinca/vim-visualstar'
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}

filetype indent plugin on

NeoBundleCheck

let mapleader=","

set backupdir=$HOME/.vimbackup,$HOME/tmp,.,/tmp
set directory=$HOME/.vimbackup,$HOME/tmp,.,/tmp

"let g:solarized_termcolors=256
colorscheme distinguished
"colorscheme solarized
"set background=dark
set background=light

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set number

" F7 and F8 for tab movement
nnoremap <F7> :tabp<CR>
nnoremap <F8> :tabn<CR>

" NERDTree
nnoremap <leader>r :NERDTreeFind<cr>
nnoremap <F2> :NERDTreeToggle<cr>

" Indent Guides
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
"let g:indent_guides_guide_size = 1

" Unite
nnoremap <C-P> :<C-u>Unite file_mru file_rec/async:! -start-insert -buffer-name=files<CR>
nnoremap <leader>/ :Unite grep:.<cr>

" Mustache | Handlebars
let g:mustache_abbreviations = 1

" XML
autocmd FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null 
