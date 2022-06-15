set nocompatible

" List of vim-plug pluggin"
call plug#begin('~/.vim/plugged')

" favorite colorscheme
Plug 'huyhoang8398/vim-monokai'
"Plug 'NightCS/night.nvim', { 'as': 'night' }

" favorite status bar
Plug 'itchyny/lightline.vim'
"Plug 'nvim-lualine/lualine.nvim'
Plug 'tpope/vim-fugitive'

" vim nerd tree
Plug 'scrooloose/nerdtree'

" indent line 
Plug 'Yggdroot/indentLine'

" nerdtree git pluggin 
Plug 'Xuyuanp/nerdtree-git-plugin'

" fuzzy find files
Plug 'ctrlpvim/ctrlp.vim' 

" COC nvim
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Word wrap
set wrap linebreak

" Spaces & Tabs
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent      " copy indent from the previous line

" Colors
set termguicolors
syntax on
colorscheme monokai

" highlight search and replace
set icm=nosplit

" copy and paste
set clipboard=unnamedplus

" Cursor line
set cursorline

" relative line number
set number relativenumber

" vim lightline status bar
set laststatus=2
let g:lightline = {
     \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

set noshowmode

" Vim nerd tree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeIgnore = ['^node_modules$']

" IndentLine {{
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"let g:indentLine_setColors = 0
let g:indentLine_fileTypeExclude = ['markdown']
" }}

" ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" CTRL+S Save
imap <C-s> <ESC>:w<CR>

" tmux scrolling
set mouse=a
