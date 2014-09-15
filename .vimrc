set t_Co=256
nnoremap <F9> :!clear && %:p<CR>
inoremap <F9> <C-o>:update<Bar>execute '!clear && %:p'<CR>
colorscheme delek

:let maplocalleader = "z"


" moving between tabs
noremap <localleader>l <esc>:tabnext<CR>
noremap <localleader>h <esc>:tabprevious<CR>

" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" clear search highlights
noremap <silent><localleader>/ :nohls<CR>

"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l


set number
set list
set nocompatible  " use vim defaults
set scrolloff=3   " keep 3 lines when scrolling
set showcmd       " display incomplete commands
set nobackup      " do not keep a backup file
set ruler         " show the current row and column
set textwidth=79  " lines longer than 79 columns will be broken
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4     " a hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line
set hlsearch      " highlight searches
set incsearch     " do incremental searching
set showmatch     " jump to matches when entering regexp
set ignorecase    " ignore case when searching
set smartcase     " no ignorecase if Uppercase char present

syntax on         " turn syntax highlighting on by default
filetype on       " detect type of file
filetype indent on " load indent file for specific file type

set colorcolumn=79
"hi ColorColumn ctermbg=blue ctermfg=blue guibg=#592929
set paste                      " so that pasted text won't get reformatted
au InsertLeave * set nopaste   " disable paste mode when leaving insert mode
set backspace=indent,eol,start " make backspace key work the way it should


set t_RV=               " http://bugs.debian.org/608242, http://groups.google.com/group/vim_dev/browse_thread/thread/9770ea844cec3282

" let g:solarized_termcolors=256
" execute pathogen#infect()
" experimental
"set foldmethod=indent
"set foldlevel=99
