set nocompatible " Vi is old
set t_Co=256 " 256 terminal colors
set cursorcolumn " Highlights current cursor column
set cursorline " Highlights current cursor row
set hlsearch " Highlight search term
set wildmenu " filename tab completion in cmd mode
set wildmode=list:longest,full
set ttyfast
set ruler
set laststatus=2 " Display current line and column in status line
set relativenumber " Display relative line number 
set directory=$HOME/.vim/swapfiles// " swapfile location

" Move between wrapped lines with j and k
nnoremap j gj
nnoremap k gk

""" Syntax related """
colorscheme molokai
syntax on
nnoremap <F4> :execute "set syntax=html" <CR>
nnoremap <F5> :execute "set syntax=javascript" <CR>
nnoremap <F6> :execute "set syntax=ruby" <CR>

" Toggle relative line numbers
nnoremap <F12> :execute "set relativenumber!" <CR>

" Highlight status line for currently active view
hi StatusLine term=bold,reverse cterm=bold ctermbg=101 ctermfg=16 gui=bold guibg=#808070 guifg=#000000
hi StatusLineNC term=reverse cterm=NONE ctermbg=59 ctermfg=16 gui=italic guibg=#404c4c guifg=#000000

""" Plugins """
execute pathogen#infect()
set wildignore+=*/tmp/*,*.swp,*/vendor/*,*/bower_components/*,*/node_modules/*,*/dist/*

" jshint validation
nnoremap <silent><F1> :JSHint<CR>
inoremap <silent><F1> <C-O>:JSHint<CR>
vnoremap <silent><F1> :JSHint<CR>

" show next jshint error
nnoremap <silent><F2> :lnext<CR>
inoremap <silent><F2> <C-O>:lnext<CR>
vnoremap <silent><F2> :lnext<CR>

" show previous jshint error
nnoremap <silent><F3> :lprevious<CR>
inoremap <silent><F3> <C-O>:lprevious<CR>
vnoremap <silent><F3> :lprevious<CR>

let jshint2_save = 1
let jshint2_height = 3

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_ruby_exec = 'ruby'
