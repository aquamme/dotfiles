set nocompatible
set t_Co=256
set cursorcolumn
set cursorline
set hlsearch
set wildmenu
set wildmode=list:longest,full
set ttyfast
set ruler
set laststatus=2
set nu
set directory=$HOME/.vim/swapfiles//


set autoindent
set backspace=indent,eol,start

set expandtab

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif



nnoremap j gj
nnoremap k gk

colorscheme molokai
syntax on

" Highlight status line for currently active view
hi StatusLine term=bold,reverse cterm=bold ctermbg=101 ctermfg=16 gui=bold guibg=#808070 guifg=#000000
hi StatusLineNC term=reverse cterm=NONE ctermbg=59 ctermfg=16 gui=italic guibg=#404c4c guifg=#000000

execute pathogen#infect()
set wildignore+=*/tmp/*,*.swp,*/vendor/*,*/bower_components/*,*/node_modules/*,*/dist/*

let g:neomake_javascript_enabled_makers = ['eslint']
autocmd! BufWritePost * Neomake

let g:ctrlp_user_command = {
	\ 'types': {
		\ 1: ['.git', 'cd %s && git ls-files -co --exclude-standard']
		\ },
	\ 'fallback': 'find %s -type f'
	\ }
