set nocompatible
filetype off

" set the runtime path to include Vundle
" ~/.vim/bundle/Vundle.vim
set rtp+=/home/suleyk/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'ycm-core/YouCompleteMe'
call vundle#end()
filetype plugin indent on

set number relativenumber
syntax on

let mapleader = " "
call plug#begin('~/.vim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'PotatoesMaster/i3-vim-syntax'
call plug#end()

set laststatus=2
set noshowmode

" Key mappings
silent! map <F2> :NERDTreeToggle<CR>
