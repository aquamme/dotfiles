call plug#begin('~/.vim/plugs')

Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'w0rp/ale'
Plug 'mbbill/undotree'
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}

call plug#end()


set nocompatible " disable vi backwards compat
set t_Co=256 " tell vim to assume 256 color support
set cursorcolumn " highlight the current column
set cursorline " highlight the current line
set hlsearch " highlight search matches
set wildmenu " highlight search matches
set wildmode=list:full,full
set wildignore+=*/tmp/*,*.swp,*/vendor/*,*/bower_components/*,*/node_modules/*,*/dist/*
set ttyfast " enables faster redrawing
set ruler " ensure the ruler is on
set laststatus=2
set number " show line numbers
set directory=$HOME/.vim/swapfiles// " store all swapfiles in a single directory
set autoindent " indent to match previous line
set autowrite       " Automatically save before commands like :next and :make
set lazyredraw
set showmatch
set shiftwidth=2 " 2 xpace indentation
set backspace=indent,eol,start " more intuitive backspace behavior
set expandtab " autoindent with spaces
set clipboard=unnamedplus " synchronize the default register with the system clipboard
set incsearch " highlight search matches as you type the search term
set ignorecase " case insensitive search...
set smartcase " ...unless the search contains capital letters


"""""""" Keybinds """"""""

" Use <C-L> to clear the highlighting of :set hlsearch.
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" move by visual lines with j/k
nnoremap j gj
nnoremap k gk
nnoremap Y y$

cnoremap <C-a> <Home>
cnoremap <C-x><C-a> <C-A>
cnoremap <C-k> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>
cnoremap <A-Left> <S-Left>
cnoremap <A-Right> <S-Right>

nmap <C-j> <Plug>(dirvish_up)
nmap <C-p> :FZF<CR>

""" Leader """"
let mapleader = " "
nnoremap <Leader><Leader> :Commands<CR>
nnoremap <Leader>fs :w<CR>
nnoremap <Leader>fed :edit $MYVIMRC<CR>
nnoremap <Leader>feR :source $MYVIMRC<CR>

""" Local leader """"

let maplocalleader = ","
autocmd Filetype php nnoremap <LocalLeader>m :call phpactor#ContextMenu()<CR>

"""""""""""""""""""""""""""""
"" Unused/duplicated keys """
"""""""""""""""""""""""""""""

nnoremap - :echom "- is unbound "<CR>
nnoremap <C-@> :echom "C-@ is unbound"<CR>
nnoremap <C-g> :echom "C-g is unbound"<CR>
nnoremap <C-h> :echom "C-h is unbound"<CR>
nnoremap <C-k> :echom "C-k is unbound"<CR>
nnoremap <C-m> :echom "C-m is unbound"<CR>
nnoremap <C-n> :echom "C-n is unbound"<CR>
nnoremap <C-q> :echom "C-q is unbound"<CR>
nnoremap <C-s> :echom "C-s is unbound"<CR>
nnoremap s :echom "s is unbound"<CR>
nnoremap S :echom "S is unbound"<CR>
nnoremap K :echom "K is unbound"<CR>

"""""""""""""""""""""""""""""""

colorscheme molokai
syntax on

" Highlight status line for currently active view
hi StatusLine term=bold,reverse cterm=bold ctermbg=101 ctermfg=16 gui=bold guibg=#808070 guifg=#000000
hi StatusLineNC term=reverse cterm=NONE ctermbg=59 ctermfg=16 gui=italic guibg=#404c4c guifg=#000000

augroup dirvish_config
    autocmd!
    autocmd FileType dirvish silent! unmap <buffer> <C-p>
augroup end

" Disable netrw and map its commands to Dirvish commands
let g:loaded_netrwPlugin = 1
command! -nargs=? -complete=dir Explore Dirvish <args>
command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>


" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

let g:ale_sign_column_always = 1

" CTRL-A CTRL-Q to select all and build quickfix list

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
