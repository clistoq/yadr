set encoding=utf8
set nocompatible              " be iMproved, required
syntax on                     " enable backlighting languages syntax
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
Plugin 'lotabout/skim.vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'vim-syntastic/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'godlygeek/tabular'
Plugin 'johngrib/vim-game-code-break'
Plugin 'ryanoasis/vim-devicons'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'pedrohdz/vim-yaml-folds'
Plugin 'tmhedberg/SimpylFold'
Plugin 'leafgarland/typescript-vim'
Plugin 'morhetz/gruvbox'
Plugin 'martinda/jenkinsfile-vim-syntax'
Plugin 'ekalinin/dockerfile.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/vim-slumlord'
Plugin 'aklt/plantuml-syntax'
Plugin 'glench/vim-jinja2-syntax'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"--------------------------------------------------------------------------------
" configure editor with tabs and nice stuff...
"--------------------------------------------------------------------------------
set expandtab
set tabstop=2                   " use 2 spaces to represent tab
set softtabstop=2
set shiftwidth=2                " number of spaces to use for auto indent
set autoindent                  " copy indent from current line when starting a new line
set smartindent
set undofile                    " Save undo's after file closes
set undodir=$HOME/.vim/undo     " where to save undo histories
set undolevels=1000             " How many undos
set undoreload=10000            " number of lines to save for undo
set showcmd                     " show (partial) command in status line
set showmode
set backspace=indent,eol,start  " make backspaces more powerfull
set colorcolumn=81
set number
set wrap
set linebreak
set nolist

"--------------------------------------------------------------------------------
" Buffer shortcuts configuration
"--------------------------------------------------------------------------------
set switchbuf=usetab,newtab
nnoremap <PageUp>   :tabn<CR>
nnoremap <PageDown> :tabp<CR>
nnoremap <C-N>      :tabnew<CR> 

" FZF configuration
nnoremap <silent> <leader>f :FZF<cr>
nnoremap <silent> <leader>F :FZF ~<cr>

" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction

set list listchars=trail:.,extends:>
autocmd FileWritePre * call TrimWhiteSpace()
autocmd FileAppendPre * call TrimWhiteSpace()
autocmd FilterWritePre * call TrimWhiteSpace()
autocmd BufWritePre * call TrimWhiteSpace()

match ErrorMsg '\%>80v.\+'

" configure expanding of tabs for various file types
au FileType python setlocal sw=2 sts=2 ts=2 expandtab
au FileType yaml setlocal sw=2 sts=2 ts=2 expandtab
au BufRead,BufNewFile *.yaml set expandtab
au BufRead,BufNewFile *.yml set expandtab
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab
au BufRead,BufNewFile Dockerfile* set noexpandtab
au BufRead * normal zR    " Unfold everything on file open
augroup filetype
    au! BufRead,BufNewFile *.ll     set filetype=llvm
augroup END

let NERDTreeShowHidden=1
autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
set hlsearch

" Theme configuration
colorscheme atom-dark-256
set background=dark

"let g:EclimCompletionMethod = 'omnifunc'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']

set wrapmargin=0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

