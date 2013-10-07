""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" general
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
" Be iMproved
"

set nocompatible

"
" filetype off -- required for vundle to function properly
"

filetype off

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
" configure vundle paths
"

" do only when `vim_starting`:
" mitigates weird reloading errors (i.e. unable to find color schemes)
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/vundle/
  call vundle#rc()
endif

" let Vundle manage Vundle (required)
Bundle 'gmarik/vundle'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" syntax highlighting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" enable/disable syntax highlighting
syntax enable

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" common bundles
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" My Bundles here:
"
" original repos on github
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

" Programming
Bundle "jQuery"
Bundle "gh:vim-ruby/vim-ruby"
Bundle "rails.vim"
Bundle "jnwhiteh/vim-golang"
Bundle "tpope/vim-dispatch"
Bundle "airblade/vim-gitgutter"
Bundle "editorconfig-vim"
Bundle "epmatsw/ag.vim"
Bundle "pangloss/vim-javascript"
Bundle "kchmck/vim-coffee-script"
Bundle "mmalecki/vim-node.js"
Bundle "JavaScript-Indent"
Bundle "jelera/vim-javascript-syntax"
Bundle "tpope/vim-eunuch"
Bundle "skammer/vim-css-color"
Bundle "groenewege/vim-less"
Bundle "terryma/vim-expand-region"
Bundle "Tagbar"
Bundle "michaeljsmith/vim-indent-object"
Bundle "mru.vim"
Bundle "YankRing.vim"

" Syntax highlight
Bundle "Markdown"

" Git integration
Bundle "git.zip"
Bundle "fugitive.vim"
Bundle 'mattn/gist-vim'

" (HT|X)ml tool
Bundle "ragtag.vim"

" Utility
Bundle "repeat.vim"
Bundle "surround.vim"
Bundle 'matchit.zip'
Bundle "SuperTab"
Bundle "file-line"
Bundle "godlygeek/tabular"
Bundle "kien/ctrlp.vim"

" server (nginx)
Bundle "nginx.vim"

" FuzzyFinder
Bundle "L9"
Bundle "FuzzyFinder"

" tComment
Bundle "tComment"
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

" Navigation
Bundle "http://github.com/gmarik/vim-visual-star-search.git"

filetype plugin indent on     " required!

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set hlsearch
set incsearch

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" files, backups and undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 
" Turn backup off, since most stuff is in source control
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" mouse
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 
set mouse=a
set ttym=xterm2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" keyboard
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 
" <Ctrl-C> -- copy selected to system clipboard (see: " http://vim.wikia.com/wiki/Quick_yank_and_paste)
vmap <C-C> "*y

" <Ctrl-A> -- visually select all and copy to system clipboard
map <C-A> ggvG$"*y<C-o><C-o>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" formatting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 
" do not wrap
set nowrap

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" color in terminal
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" when not running in GUI mode
if !has('gui_running')
  set t_Co=256
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" color scheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim colorscheme pack
Bundle 'flazz/vim-colorschemes'

" configure color scheme
let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=dark
colorscheme solarized

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
" gui font (i.e. MacVIM)
"

" should match the setting in your terminal for consistency
if has("gui_running")
  set guifont=Anonymous\ Pro\ for\ Powerline:h18
endif
 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" gui (general)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 
" when running in GUI mode
if has("gui_running")
  set guioptions-=T
  set guioptions+=e
  set guitablabel=%M\ %t
endif
 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" encodings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

 " Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" file types
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use Unix as the standard file type
set ffs=unix,dos,mac

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" testing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" <leader>t runs tests (make test)
map <leader>t :make test<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" editing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" <leader>pp toggles paste mode
map <leader>pp :setlocal paste!<cr>

" <leader>ss toggles spell checking
map <leader>ss :setlocal spell!<cr>

" <leader>hh turns off search highlight
map <leader>hh :noh<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Maximum number of tabs to display
set tabpagemax=50

" Useful mappings for managing tabs (Vim 7 specific mappings)
if version >= 700
  nnoremap <C-t> :tabnew<cr>
  nnoremap <C-l> :tabnext<cr>
  nnoremap <C-h> :tabprevious<cr>
endif

" opens a new tab edit the file whose name is under or after the cursor
:map gt :tabedit <cfile><CR>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" Remember info about open buffers on close
set viminfo^=%

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" fugitive.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Github domains configuration
let g:fugitive_github_domains = ['http://github.webapps.rr.com']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" open all the things
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
" open url under cursor
map gu :!open <cfile><cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" git
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" [goto] Git Conflict
nmap gc /^<<<<<<< HEAD$<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" nerdtree.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'scrooloose/nerdtree'

let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
let NERDTreeWinSize=26

" <leader>f invokes NERDTreeFind
nmap <leader>f :NERDTreeFind<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" timeout
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set ttimeoutlen=50

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
" Reload vimrc whenever a vim config file is modified
"

augroup reload_vimrc
  autocmd!
  autocmd bufwritepost $MYVIMRC source $MYVIMRC
  autocmd bufwritepost ~/.vim/* source $MYVIMRC
augroup END

"
" key bindings
"

" $MYVIMRC reload
nmap <Leader>rc :source $MYVIMRC<CR>

" $MYVIMRC open buffer for editing in new tab/buffer
nmap <Leader>rt :tabnew $MYVIMRC<CR>

" $MYVIMRC open buffer for editing in current tab/buffer
nmap <Leader>re :e $MYVIMRC<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" statusline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Bundle 'bling/vim-airline'

set laststatus=2

let g:airline_powerline_fonts = 1


set wildmenu " show command complition menu
set wildmode=list:longest,full
set scrolloff=3 " begin scrolling N lines earlier

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File types settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set number

"sane editing (tabs)
set tabstop=2
set shiftwidth=2
set softtabstop=2

" convert all typed tabs to spaces
set expandtab

" CSS (tab width 2 chr)
autocmd FileType css set et
autocmd FileType css set sw=2
autocmd FileType css set ts=2
autocmd FileType css set sts=2

" JavaScript (tab width 2 chr)
autocmd FileType javascript set et
autocmd FileType javascript set sw=2
autocmd FileType javascript set ts=2
autocmd FileType javascript set sts=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" sublime (multiple selections) mode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
" install 'vim-multiple-cursors' plugin
"

" https://github.com/terryma/vim-multiple-cursors
Bundle "terryma/vim-multiple-cursors"
