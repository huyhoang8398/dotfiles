" List of vim-plug pluggin"
call plug#begin('~/.vim/plugged')

" favorite colorscheme
Plug 'morhetz/gruvbox'

" favorite status bar
Plug 'itchyny/lightline.vim'

" vim nerd tree
Plug 'scrooloose/nerdtree'

" emmet 
Plug 'mattn/emmet-vim'

" intellisense engine
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

" indent line 
Plug 'Yggdroot/indentLine'

" eslint 
"Plug 'dense-analysis/ale'

" goyo - focus mode 
Plug 'junegunn/goyo.vim'

" nerdtree syntax highlighting
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" vim devicons 
Plug 'ryanoasis/vim-devicons'

" nerdtree git pluggin 
Plug 'Xuyuanp/nerdtree-git-plugin'

" fuzzy find files
Plug 'ctrlpvim/ctrlp.vim' 

call plug#end()

" Spaces & Tabs {{{
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent      " copy indent from the previous line
" }}} Spaces & Tabs

" Colors {{{
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
syntax enable                " enable syntax processing
set background=dark
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
" }}} Colors

" copy and paste {{{
set clipboard=unnamedplus
" }}} copy and paste

" Cursor line {{{
set cursorline
" }}}

" relative line number {{{ 
set number relativenumber
" }}} relative line number

" vim lightline status bar {{{
set laststatus=2
let g:lightline = { 'colorscheme': 'seoul256' }
" vim lightline status bar }}}

" Vim nerd tree {{{
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeIgnore = ['^node_modules$']
" }}} vim nerd

" Emmet redefine trigger keys {{{ 
let g:user_emmet_leader_key=','
" }}} Emmet redefine trigger keys 

" Indent line {{{ 
"let g:indentLine_color_term = 68
"let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_char = '┆'
"let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_fileTypeExclude = ['json', 'markdown']
" }}}

" ES lint {{{
" Fix files with prettier, and then ESLint.
let g:ale_fixers = ['prettier', 'eslint']
let g:ale_fix_on_save=1
" }}} ES lint 

" Goyo {{{ 
let g:goyo_width=100
map <C-k>z = :Goyo<CR>
" }}} Goyo

" vim devicons {{{
" ctrlp glyphs
let g:webdevicons_enable = 1
let g:webdevicons_enable_ctrlp = 1
" }}} vim devicons

" ctrlp {{{
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" }}} ctrlp
