syntax on

if has('vim_starting')	
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'scrooloose/syntastic'
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}

filetype indent plugin on

NeoBundleCheck

let mapleader=","

set backupdir=$HOME/.vimbackup,$HOME/tmp,.,/tmp
set directory=$HOME/.vimbackup,$HOME/tmp,.,/tmp

let g:solarized_termcolors=256
colorscheme solarized
set background=dark

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" NERDTree
nnoremap <leader>r :NERDTreeFind<cr>

" Indent Guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_guide_size = 1


