set nocompatible

" List of vim-plug pluggin"
call plug#begin('~/.vim/plugged')

" favorite colorscheme
Plug 'morhetz/gruvbox'

" Syntax highlight
Plug 'sheerun/vim-polyglot'

" favorite status bar
Plug 'itchyny/lightline.vim'

" vim nerd tree
Plug 'scrooloose/nerdtree'

" emmet 
"Plug 'mattn/emmet-vim'

" intellisense engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

" Spaces & Tabs
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent      " copy indent from the previous line

" Colors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"syntax enable                " enable syntax processing
set background=dark
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

" copy and paste
set clipboard=unnamedplus

" Cursor line
set cursorline

" relative line number
set number relativenumber

" vim lightline status bar
set laststatus=2
let g:lightline = { 'colorscheme': 'seoul256' }
set noshowmode

" Vim nerd tree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeIgnore = ['^node_modules$']

" Emmet redefine trigger keys
"let g:user_emmet_leader_key=','

" Indent line
"let g:indentLine_color_term = 68
"let g:indentLine_leadingSpaceEnabled = 1
"let g:indentLine_char = '┆'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_fileTypeExclude = ['markdown']

" ES lint
" Fix files with prettier, and then ESLint.
"let g:ale_fixers = ['prettier', 'eslint']
"let g:ale_fix_on_save=1

" Goyo
let g:goyo_width=100
map <C-k>z = :Goyo<CR>

" vim devicons
let g:webdevicons_enable = 1
let g:webdevicons_enable_ctrlp = 1

" ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Set gui font for icons
set guifont=DroidSansMono\ Nerd\ Font\ 11

" CTRL+S Save
imap <C-s> <ESC>:w<CR>

"""""" COC VIM ############
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
