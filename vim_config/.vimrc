syntax on
filetype plugin indent on
set tabstop=3
set nocp                    " 'compatible' is not set
filetype plugin on          " plugins are enabled

""""""""""""" Vundle configurations

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"""" ALL PLUGINS COME HERE

" Use CtrP to search stuff
Plugin 'kien/ctrlp.vim'

" Use Nerdtree
Plugin 'scrooloose/nerdtree'

" Use surround
Plugin 'tpope/vim-surround'

" Use Nerdcommenter
Plugin 'scrooloose/nerdcommenter'

" Use delimitmate
Plugin 'raimondi/delimitmate'

" Use Polyglot
Plugin 'sheerun/vim-polyglot'







" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line



""""""""""""" My configurations

" Use
set number
set autoread
set incsearch
set ignorecase
set hlsearch
set smartcase

" Turn back-up off (those annoyng swap files..)
set nobackup
set nowb
set noswapfile

" Tab and break configuratins
set expandtab
set shiftwidth=2
set tabstop=2

" Line break at 100 characters
set lbr
set tw=100

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Do not copy line numbers
set mouse=a

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
		\ if line("'\"") > 0 && line("'\"") <= line("$") |
		\   exe "normal! g`\"" |
		\ endif

" Always show the status line
" set laststatus=2

" Remap VIM 0 to first non-blank character
map 0 ^

" Map tabnew to Ctrl-n
map <C-n> :tabnew <CR>

" Into the wild
set wildmenu

" Open NerdTree with ,s
let mapleader=","
nnoremap <Leader>s :NERDTreeToggle<Enter>


nnoremap <silent> <Leader>v :NERDTreeFind<CR>

" Switch between panes with C-j, C-k, and so on
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Open new panes below and at the right
set splitbelow
set splitright

" Automatic delete with NerdTree
let NERDTreeAutoDeleteBuffer = 1

" Automatically open NerdTree on new buffer
"autocmd BufWinEnter * NERDTreeMirror


" Close NERDTree if it is the last open buffer
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

" work tab as emacs?

map <Tab> i<Tab><Esc>^

" Creates a calculator for insert mode, by Control - c
imap <silent> <C-C> <C-R>=string(eval(input("Calculemos: ")))<CR>

"Locate and return character "above" current cursor position...
function! LookUpwards()
   "Locate current column and preceding line from which to copy...
   let column_num      = virtcol('.')
   let target_pattern  = '\%' . column_num . 'v.'
   let target_line_num = search(target_pattern . '*\S', 'bnW')

   "If target line found, return vertically copied character...
   if !target_line_num
      return ""
   else
      return matchstr(getline(target_line_num), target_pattern)
   endif
endfunction

"Reimplement CTRL-Y within insert mode...
imap <silent>  <C-Y>  <C-R><C-R>=LookUpwards()<CR>


" Take out trilling whitespaces
autocmd BufWritePre * :%s/\s\+$//e

command! ClearWhitespace call s:ClearWhitespace()
function! s:ClearWhitespace()
  let l:backup = @/
  let l:line = line('.')
  let l:column = col('.')
  silent! %s/\s\+$//e
  let @/=l:backup
  call cursor(l:line, l:column)
endfunction

function! s:ClearWhitespaceIfExpected()
  if &ft =~? 'markdown'
    return
  endif

  call s:ClearWhitespace()
endfunction

" check one time after 4s of inactivity in normal mode
"set autoread
"au CursorHold * checktime

if has('clipboard')     " If the feature is available
  set clipboard=unnamed " copy to the system clipboard

  if has('unnamedplus')
    set clipboard+=unnamedplus
  endif
endif

" Paging keys
inoremap <PageDown> <Nop>
inoremap <PageUp> <Nop>

nnoremap Q :quit<CR>
nnoremap X :x<CR>

" Easier save mapping
nnoremap W :write<CR>

" Remove the last search thus clearing the highlight
" This clears the search register denoted by @/
nnoremap <silent> <leader>4 :let @/=""<CR>

" Seta linebreak
"
set wrap
set linebreak


filetype plugin on
au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
au FileType c setl ofu=ccomplete#CompleteCpp
