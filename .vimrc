" List of vim-plug pluggin"
call plug#begin('~/.vim/plugged')

" favorite colorscheme
Plug 'morhetz/gruvbox'

" favorite status bar
Plug 'itchyny/lightline.vim'

" vim nerd tree
Plug 'scrooloose/nerdtree'

call plug#end()

" relative number
set number relativenumber

" size of a hard tabstop
set tabstop=2

" always uses spaces instead of tab characters
set expandtab

" size of an "indent"
set shiftwidth=2

set cursorline
set showcmd

" my colorscheme 
syntax on
set background=dark
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

" config vim lighline status bar 
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

" config vim nerdtree
" toggle nerd tree
map <C-n> :NERDTreeToggle<CR> 
