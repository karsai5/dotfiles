"Linus' Vim Config
filetype off
set nocompatible
syntax on
set nu
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set relativenumber
set undofile

set t_Co=256

"Set F Keyboard shortcuts
"Folding
inoremap <F5> <C-O>za
nnoremap <F5> za
onoremap <F5> <C-C>za
vnoremap <F5> zf
"fuzzy search
let g:ctrlp_map = '<F8>'
"NerdTree
noremap <F9> :NERDTreeToggle<cr>
"Zen mode
noremap <leader>z :Goyo<cr>
let g:goyo_linenr = 1
let g:goyo_width = 85
"Toggle paste mode
set pastetoggle=<F2>
"refresh source
noremap <leader>r :source ~/.vimrc<cr>
"csscomb
noremap <leader>s :CSScomb<cr>

"Enable vim taglist
filetype plugin on

"Set backup directory
set backupdir=./.backup,.,/tmp
set directory=.,./.backup,/tmp

"fix up some of the search stuff in vim
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" Install all plugins
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/scrooloose/syntastic.git'
Plug 'SirVer/ultisnips'
Plug 'csscomb/vim-csscomb'
Plug 'gmarik/Vundle.vim'
Plug 'honza/vim-snippets'
Plug 'https://github.com/Lokaltog/vim-easymotion.git'
Plug 'https://github.com/Shougo/neocomplete.vim.git'
Plug 'https://github.com/SirVer/ultisnips.git' " snippet plugin for creating snippets
Plug 'https://github.com/bling/vim-airline.git'
Plug 'https://github.com/junegunn/seoul256.vim.git'
Plug 'https://github.com/kien/ctrlp.vim.git'
Plug 'https://github.com/lervag/vim-latex.git' " simple latex plugin
Plug 'https://github.com/nathanaelkane/vim-indent-guides.git'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/tpope/vim-sensible.git'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/vim-scripts/YankRing.vim'
Plug 'https://github.com/vim-scripts/taglist.vim.git'
Plug 'junegunn/goyo.vim'
Plug 'mattn/emmet-vim'
Plug 'vim-scripts/closetag.vim'
Plug 'yonchu/accelerated-smooth-scroll'
Plug 'airblade/vim-gitgutter'
Plug 'Chiel92/vim-autoformat'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Valloric/MatchTagAlways'
Plug 'tpope/vim-commentary' " Better commenting

" LANGUAGE SPECIFIC PLUGINS
Plug 'git://github.com/digitaltoad/vim-jade.git'
Plug 'git://github.com/wavded/vim-stylus.git'
Plug 'https://github.com/jelera/vim-javascript-syntax.git' " javascript highlighting
Plug 'https://github.com/moll/vim-node.git' " helps wim node files
Plug 'https://github.com/nono/vim-handlebars.git' " handelbars syntax hilighting
Plug 'tpope/vim-haml'
call plug#end()

filetype plugin indent on     " required
" To ignore plugin indent changes, instead use:
" "filetype plugin on


" Neocomplete enable on startup
let g:neocomplete#enable_at_startup = 1

" UltimateSnips settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" UltiSnipsEdit split window
let g:UltiSnipsEditSplit="vertical"



" Syntactical arguments
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_auto_loc_list=1  
nnoremap <silent> <f6> :SyntasticCheck<CR>
let g:syntastic_scss_scss_lint_args="-x PropertySortOrder"
let g:syntastic_python_checkers = ['python', 'pep8']
let g:syntastic_html_checkers = ['w3']
let g:syntastic_javascript_checkers = ['jshint']
" Disable by default
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

"set ctrlp shortcut
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_cmd = 'CtrlP'

"spelling
map <F4> :setlocal spell! spelllang=en_au<CR>

" Autoformat
map <f3> :Autoformat<CR>

"Long line handling
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

" Mouse things
set mouse=a
map <xCSI>[62~ <MouseDown>

"remove keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

"Save on lost focus
au FocusLost * :wa

" Autoread checks if the file has been modified elsewhere, reloads if yes.          
set autoread                                                                        
augroup checktime " Hack to make autoread work in terminal.           
 au!                                                                               
 if !has("gui_running")                                                            
   " silent! necessary otherwise throws errors when using cmd line window.         
   autocmd BufEnter        * silent! checktime                                     
   autocmd CursorHold      * silent! checktime                                     
   autocmd CursorHoldI     * silent! checktime                                     
   " These two _may_ slow things down. Remove if they do.                          
   autocmd CursorMoved     * silent! checktime                                     
   autocmd CursorMovedI    * silent! checktime                                     
 endif                                                                             
augroup END

" set colorscheme
let g:airline_theme = 'wombat'
let g:airline_powerline_fonts = 1
let g:seoul256_background = 235
colorscheme seoul256
" fix colored background in tmux 
set t_ut=

"Automatically load folds on open and save on close

"auto update Last Modified Date:

"Jquery syntax
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

"Tlist
noremap <F7> :Tlist<cr>
" Put taglist on RHS
let Tlist_Use_Right_Window   = 1
