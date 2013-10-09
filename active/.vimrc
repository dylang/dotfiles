set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

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
Bundle 'epmatsw/ag.vim'

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
Bundle "SuperTab"
Bundle "file-line"
Bundle "Align"
Bundle 'godlygeek/tabular'

" FuzzyFinder
Bundle "L9"
Bundle "FuzzyFinder"

" tComment
Bundle "tComment"
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

" Command-T
Bundle "git://git.wincent.com/command-t.git"
let g:CommandTMatchWindowAtTop=1 " show window at top

" Navigation
Bundle "http://github.com/gmarik/vim-visual-star-search.git"

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

""""""""""""""""""""""""""""""
"" files, backups and undo
""""""""""""""""""""""""""""""
 
" Turn backup off, since most stuff is in source control
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""
"" mouse
""""""""""""""""""""""""""""""
 
set mouse=a
set ttym=xterm2

""""""""""""""""""""""""""""""
"" keyboard
""""""""""""""""""""""""""""""
 
" <Ctrl-C> -- copy selected to system clipboard (see: " http://vim.wikia.com/wiki/Quick_yank_and_paste)
vmap <C-C> "*y

" <Ctrl-A> -- visually select all and copy to system clipboard
map <C-A> ggvG$"*y<C-o><C-o>

" ,cp copies path to clipboard
nmap <leader>cp :let @" = expand("%:p")<cr><cr>

""""""""""""""""""""""""""""""
"" formatting
""""""""""""""""""""""""""""""
 
" do not wrap
set nowrap

""""""""""""""""""""""""""""""
"" syntax highlighting
""""""""""""""""""""""""""""""

" enable/disable syntax highlighting
syntax enable

""""""""""""""""""""""""""""""
"" color in terminal
""""""""""""""""""""""""""""""

" when not running in GUI mode
if !has('gui_running')
  set t_Co=256
endif

""""""""""""""""""""""""""""""
"" color scheme
""""""""""""""""""""""""""""""

" download color scheme
Bundle "altercation/vim-colors-solarized"

" configure color scheme
colorscheme solarized
let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=dark

""""""""""""""""""""""""""""""
"" fonts
""""""""""""""""""""""""""""""

" when running in GUI mode
if has("gui_running")
  set guifont=Anonymous\ Pro\ for\ Powerline:h18
endif
 
""""""""""""""""""""""""""""""
"" gui (general)
""""""""""""""""""""""""""""""
 
" when running in GUI mode
if has("gui_running")
  set guioptions-=T
  set guioptions+=e
  set guitablabel=%M\ %t
endif
 
""""""""""""""""""""""""""""""
"" encodings
""""""""""""""""""""""""""""""

 " Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
 
""""""""""""""""""""""""""""""
"" file types
""""""""""""""""""""""""""""""

" Use Unix as the standard file type
set ffs=unix,dos,mac

""""""""""""""""""""""""""""""
"" testing
""""""""""""""""""""""""""""""

" <leader>t runs tests (make test)
map <leader>t :make test<cr>

""""""""""""""""""""""""""""""
"" editing
""""""""""""""""""""""""""""""

" <leader>pp toggles paste mode
map <leader>pp :setlocal paste!<cr>

" <leader>ss toggles spell checking
map <leader>ss :setlocal spell!<cr>

" <leader>hh turns off search highlight
map <leader>hh :noh<cr>

""""""""""""""""""""""""""""""
"" splits / windows
""""""""""""""""""""""""""""""

" instead of ctrl-w then one of {j,k,h,l}, just ctrl-{j,k,h,l}:
" http://robots.thoughtbot.com/post/48275867281/vim-splits-move-faster-and-more-naturally

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

""""""""""""""""""""""""""""""
"" tabs
""""""""""""""""""""""""""""""

" Maximum number of tabs to display
set tabpagemax=50

" Useful mappings for managing tabs (Vim 7 specific mappings)
if version >= 700
  nnoremap <CS-Right> :tabnext<cr>
  nnoremap <CS-Left>  :tabprevious<cr>
  nnoremap <C-n>      :tabnew<cr>
  nnoremap <C-t>      :tabclose<cr>
  nnoremap <C-m>      :tabmove<cr>
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

""""""""""""""""""""""""""""""
"" fugitive.vim
""""""""""""""""""""""""""""""

" Github domains configuration
let g:fugitive_github_domains = ['http://github.webapps.rr.com']

""""""""""""""""""""""""""""""
"" open all the things
""""""""""""""""""""""""""""""
" 
" open url under cursor
map gu :!open <cfile><cr>

""""""""""""""""""""""""""""""
"" git
""""""""""""""""""""""""""""""

" [goto] Git Conflict
nmap gc /^<<<<<<< HEAD$<cr>

""""""""""""""""""""""""""""""
"" nerdtree.vim
""""""""""""""""""""""""""""""
Bundle 'scrooloose/nerdtree'

let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
let NERDTreeWinSize=26

" <leader>f invokes NERDTreeFind
nmap <leader>f :NERDTreeFind<cr>

""""""""""""""""""""""""""""""
"" statusline
""""""""""""""""""""""""""""""

set ttimeoutlen = 50

""""""""""""""""""""""""""""""
"" statusline
""""""""""""""""""""""""""""""
Bundle 'bling/vim-airline'

set laststatus=2

let g:airline_powerline_fonts = 1

