set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'Valloric/YouCompleteMe'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set history=500
set hlsearch
set incsearch
set autoindent
set showmode
set autoread
set encoding=utf-8

let mapleader = ","
" Fast saving
nmap <leader>w :w!<cr>

set showmatch 

"set foldcolumn=1

set ffs=unix,dos,mac
syntax enable

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4












