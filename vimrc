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
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'mustache/vim-mode'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-rails'
NeoBundle 'guns/xterm-color-table.vim'
NeoBundle 'godlygeek/csapprox'
NeoBundle 'thinca/vim-visualstar'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tmhedberg/matchit'
NeoBundle 'godlygeek/tabular'
NeoBundle 'tomtom/tcomment_vim'
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundle 'benmills/vimux'
NeoBundle 'rking/ag.vim'
NeoBundle 'craigemery/vim-autotag'
NeoBundle 'mattn/gist-vim', {'depends': 'mattn/webapi-vim'}
NeoBundle 'stephpy/vim-yaml'
NeoBundle 'lunaru/vim-less'

filetype indent plugin on

NeoBundleCheck

let mapleader=","

set backupdir=$HOME/.vimbackup,$HOME/tmp,.,/tmp
set directory=$HOME/.vimbackup,$HOME/tmp,.,/tmp

set background=dark
" set background=light
" let g:solarized_termcolors=256
colorscheme distinguished
" colorscheme solarized

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set number
set incsearch
set hlsearch
set ignorecase smartcase
set clipboard=unnamed
set nobackup

" Tags
set tags+=.tags

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
set rtp+=$HOME/.config/powerline/vim

" NERDTree
nnoremap <leader>r :NERDTreeFind<cr>
nnoremap <F2> :NERDTreeToggle<cr>

" Neocomplcache
let g:neocomplcache_enable_at_startup = 1

" Neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

let g:rails_no_abbreviations = 1

" Enable snipMate compatibility feature.
" let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory = $HOME . '/.vim/snippets'

" enable ruby & rails snippet only rails file
function! s:RailsSnippet()
  if exists("b:rails_root") && (&filetype == "ruby")
    NeoSnippetSource ~/.vim/bundle/neosnippet-snippets/neosnippets/rails.snip
  endif
endfunction

autocmd BufEnter * call s:RailsSnippet()

" Easymotion
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

" Unite
nnoremap <C-P> :<C-u>Unite file_rec/async:! -start-insert -buffer-name=files<CR>
nnoremap <space>/ :<C-u>Unite grep:.<cr>
nnoremap <space>t :<C-u>Unite -no-empty -quick-match -immediately tab:no-current<cr>
nnoremap <space>y :<C-u>Unite history/yank<cr>
nnoremap <space>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>

let g:unite_source_file_rec_max_cache_files = 0
let g:unite_source_history_yank_enable = 1

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_selecta'])
call unite#custom#source('file_rec,file_rec/async,file_mru,buffer', 'max_candidates', 0)

" Use ag for search
if executable('ag')
  " Grep command
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column --skip-vcs-ignores'
  let g:unite_source_grep_recursive_opt = ''

  " Recursive command
  let g:unite_source_rec_async_command = 'ag --follow --nocolor --nogroup --hidden --skip-vcs-ignores -g ""'
endif

" Mustache | Handlebars
let g:mustache_abbreviations = 1

" XML
autocmd FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" Trailing whitespaces
autocmd FileType javascript,vim,ruby autocmd BufWritePre <buffer> :%s/\s\+$//e

" Autoload vimrc
autocmd BufWritePost .vimrc source %

" Folding
autocmd Syntax javascript setlocal foldmethod=syntax
autocmd Syntax javascript normal zR

" Tabular
map <leader>t: :Tabularize /:\s\+\zs/l1c0<CR>
map <leader>t= :Tabularize /=<CR>

" Vimux
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vz :call VimuxZoomRunner()<CR>

" Gist
let g:gist_clip_command = 'xclip -selection clipboard'
let g:gist_post_private = 1
