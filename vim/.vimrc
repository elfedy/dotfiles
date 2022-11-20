set encoding=utf-8

" This must be first, because it changes other options as a side effect.
set nocompatible

execute pathogen#infect()
" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Set autoread
set autoread

" Switch syntax highlighting on
syntax on

" Automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Allow hidden buffers, don't limit to 1 file per window/split
set hidden

" Save last 100 commands
set history=100

" Leader key to space
let mapleader = "\<Space>"

" Leader commands
nmap <leader>vr :sp $MYVIMRC<cr>
nmap <leader>so :source $MYVIMRC<cr>
nmap <leader>C :CtrlPClearCache<cr>
nmap <leader>d :cd %:h<cr>
nmap <leader>l :set list!<CR>

" Set tab configuration
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Use 4 spaces for c and elm files
autocmd Filetype c setlocal ts=4 sw=4 sts=4
autocmd Filetype elm setlocal ts=4 sw=4 sts=4

" Use tabs for Makefile and Go
autocmd Filetype make setlocal noexpandtab 
autocmd Filetype go setlocal noexpandtab 

"Use c syntax for Objective C files
autocmd Filetype m setlocal syntax=c
autocmd Filetype m setlocal ts=4 sw=4 sts=4
autocmd Filetype mm setlocal syntax=c
autocmd Filetype mm setlocal ts=4 sw=4 sts=4

" Save temporary files in another file
set backupdir=$TMPDIR//
set directory=$TMPDIR//

" Make airline appear automatically
set laststatus=2

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" " Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Search down into subfolders
" Provides tab completion for all file related tasks
set path+=**

" Display al matching files when we tab complete
set wildmenu

" Disable errorbell
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Use silver searcher instead of grep
if executable('ag')
  " Note we extract the column as well as the file and line number
  set grepprg=ag\ --nogroup\ --nocolor\ --column
  set grepformat=%f:%l:%c%m
end

" No limit for ctrlp
let g:ctrlp_max_files = 0

" Key mapping
nmap j gj
nmap k gk

imap <C-s> <Esc>:w<CR>
nmap <leader>f :CtrlP<CR>

" Do not scan all included files when autocompleting (which is slow)
set complete-=i

