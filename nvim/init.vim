filetype off
filetype plugin indent on
call plug#begin('~/.vim/plugged')
Plug 'wakatime/vim-wakatime'
Plug 'pseewald/vim-anyfold'
Plug 'qpkorr/vim-bufkill'
Plug 'Yggdroot/indentLine'
Plug 'chun-yang/auto-pairs'
Plug 'joom/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim',  {'branch': 'master', 'do': 'yarn install'}
Plug 'jakeroggenbuck/journal.vim'
Plug 'ap/vim-css-color'
Plug 'mattn/emmet-vim'
Plug 'yuttie/comfortable-motion.vim'
call plug#end()

syntax on
set t_Co=256
set mouse=a
set nocursorline
set noshowmatch 
set nocompatible
set textwidth=80
set modelines=0
set number relativenumber
set visualbell
set encoding=utf-8
set smartcase
set wrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
set smartindent
set nohlsearch
set hidden
set noerrorbells
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

" show indented tab lines
set list listchars=tab:»-,trail:·,extends:»,precedes:«
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set wildmenu
set formatoptions=tqlnrc
set comments=b:>
set autochdir
" autocomplete height
set pumheight=20
" new windows bottom half
set splitbelow

" cursor settings
" different cursor for modes
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[6 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[4 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif
" making switching cursors faster
set ttimeout
set ttimeoutlen=0
set ttyfast
" Fixes common backspace problems
set backspace=indent,eol,start
" bracket color
highlight CursorColumn cterm=NONE ctermbg=237 guibg=#3a3a3a 
highlight CursorLine term=underline cterm=underline ctermbg=NONE gui=underline guibg=NONE

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
" remove auto commenting next lines
au BufEnter * set fo-=c fo-=r fo-=o
" change space between windows
highlight VertSplit cterm=NONE

" PlugIn setups

" nerd
let NERDTreeHighlightCursorline=0

" airline
let g:airline#extensions#tabline#enabled = 1

" coc
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" sass support 
autocmd FileType scss setl iskeyword+=@-@
" format on save
augroup auto_commands
    autocmd BufWrite *.html call CocAction('format')
    autocmd BufWrite *.js call CocAction('format')
    autocmd BufWrite *.ts call CocAction('format')
    autocmd BufWrite *.css call CocAction('format')
    autocmd BufWrite *.sass call CocAction('format')
augroup END

" folding 
 autocmd Filetype * AnyFoldActivate
 set foldlevel=0
 set foldlevel=99

" Keymappings
nnoremap <F5> :NERDTreeToggle<CR>
nnoremap <F6> :sp<CR>:terminal<CR>
nnoremap <Tab> :bn<CR> 
nnoremap <S-Tab> :bp<CR> 
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" get rid of suspend mode
nnoremap <c-z> <nop>
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
