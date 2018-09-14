call plug#begin('~/.vim/plugs')

Plug 'neomake/neomake'
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
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

function! IFRE ()
  echom "It's free real estate"
endfunction

nnoremap - :call IFRE()<CR>
nnoremap <C-@> :call IFRE()<CR>
nnoremap <C-g> :call IFRE()<CR>
nnoremap <C-h> :call IFRE()<CR>
nnoremap <C-k> :call IFRE()<CR>
nnoremap <C-m> :call IFRE()<CR>
nnoremap <C-n> :call IFRE()<CR>
nnoremap <C-q> :call IFRE()<CR>
nnoremap <C-s> :call IFRE()<CR>
nnoremap K :call IFRE()<CR>
nnoremap s :call IFRE()<CR>
nnoremap S :call IFRE()<CR>
nnoremap x :call IFRE()<CR>

"""""""""""""""""""""""""""""""

colorscheme molokai
syntax on

" Highlight status line for currently active view
hi StatusLine term=bold,reverse cterm=bold ctermbg=101 ctermfg=16 gui=bold guibg=#808070 guifg=#000000
hi StatusLineNC term=reverse cterm=NONE ctermbg=59 ctermfg=16 gui=italic guibg=#404c4c guifg=#000000

let g:neomake_javascript_enabled_makers = ['eslint']
autocmd! BufWritePost * Neomake

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
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
