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
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'mustache/vim-mode'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'guns/xterm-color-table.vim'
NeoBundle 'godlygeek/csapprox'
NeoBundle 'thinca/vim-visualstar'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tmhedberg/matchit'
NeoBundle 'msanders/snipmate.vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'tomtom/tcomment_vim'
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
set incsearch
set hlsearch
set ignorecase smartcase
set clipboard=unnamed

" Disable search highlight when CR
nnoremap <CR> :noh<CR><CR>

" F7 and F8 for tab movement
nnoremap <F7> :tabp<CR>
nnoremap <F8> :tabn<CR>

" Map Ctrl-hjkl for easier pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Powerline
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim

" NERDTree
nnoremap <leader>r :NERDTreeFind<cr>
nnoremap <F2> :NERDTreeToggle<cr>

" Easymotion
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

" Unite
nnoremap <C-P> :<C-u>Unite file_mru file_rec/async:! -start-insert -buffer-name=files<CR>
nnoremap <leader>/ :Unite grep:.<cr>

" Mustache | Handlebars
let g:mustache_abbreviations = 1

" XML
autocmd FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" Trailing whitespaces
autocmd FileType javascript,vim,ruby autocmd BufWritePre <buffer> :%s/\s\+$//e
