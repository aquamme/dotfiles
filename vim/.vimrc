call plug#begin('~/.vim/plugs')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'neomake/neomake'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-vinegar'
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}

call plug#end()



" disable vi backwards compat
set nocompatible

" tell vim to assume 256 color support
set t_Co=256

" highlight the current column
set cursorcolumn

" highlight the current line
set cursorline

" highlight search matches
set hlsearch

set wildmenu
set wildmode=list:full,full
set wildignore+=*/tmp/*,*.swp,*/vendor/*,*/bower_components/*,*/node_modules/*,*/dist/*

" enables faster redrawing
set ttyfast

" ensure the ruler is on
set ruler
set laststatus=2

" show line numbers
set nu

" store all swapfiles in a single directory
set directory=$HOME/.vim/swapfiles//

" indent to match previous line
set autoindent

" 2 xpace indentation
set shiftwidth=2

" more intuitive backspace behavior
set backspace=indent,eol,start

" autoindent with spaces
set expandtab

" synchronize the default register with the system clipboard
set clipboard=unnamedplus

" highlight search matches as you type the search term
set incsearch

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif


" move by visual lines with j/k
nnoremap j gj
nnoremap k gk

" some spacemacs inspired keybinds
let mapleader = " "
nnoremap <Leader>fs :w<CR>
nnoremap <Leader>fed :edit $MYVIMRC<CR>
nnoremap <Leader>feR :source $MYVIMRC<CR>

let maplocalleader = ","

colorscheme molokai
syntax on

" Highlight status line for currently active view
hi StatusLine term=bold,reverse cterm=bold ctermbg=101 ctermfg=16 gui=bold guibg=#808070 guifg=#000000
hi StatusLineNC term=reverse cterm=NONE ctermbg=59 ctermfg=16 gui=italic guibg=#404c4c guifg=#000000

let g:neomake_javascript_enabled_makers = ['eslint']
autocmd! BufWritePost * Neomake

if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg -uu %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif


let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1 " Case insensitive search, unless a capital letter is used
map <Leader>s <Plug>(easymotion-s)

autocmd Filetype php nnoremap <LocalLeader>m :call phpactor#ContextMenu()<CR>

