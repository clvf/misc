set nocompatible " use vim defaults

execute pathogen#infect()
execute pathogen#helptags()

""""""""""""""""
" SETTINGS
""""""""""""""""
syntax on         " turn syntax highlighting on by default
filetype on       " detect type of file
filetype plugin indent on " load indent file for specific file type

" COLOR
let g:solarized_termcolors=256
colorscheme solarized
if has('gui_running')
    set background=light
else
    set background=dark
endif
set colorcolumn=79
" hi ColorColumn ctermbg=4


nnoremap <F9> :!clear; %:p<CR>
inoremap <F9> <C-o>:update<Bar>execute '!clear; %:p'<CR>
nnoremap <F10> :!clear; %:p 2>&1<BAR>less<CR>
nnoremap <F12> :!clear; go run %<CR>

:let maplocalleader = "\\"

" moving between tabs
nnoremap <C-l> <esc>:tabnext<CR>
nnoremap <C-h> <esc>:tabprevious<CR>

" File explorer
"let g:netrw_liststyle=3
"let g:netrw_keepdir=0
"nnoremap <C-e> <esc>:Texplore<CR>

" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" clear search highlights
noremap <silent><localleader>/ :nohls<CR>

set autoindent    " align the new line indent with the previous line
set backspace=indent,eol,start whichwrap+=<,>,[,] " make backspace work the way it should
set confirm       " raise a dialogue asking if you wish to save changed files
set expandtab     " insert spaces when hitting TABs
set foldlevel=99
set foldmethod=indent
set formatoptions=tcrql1  " see :help fo-table
set hlsearch      " highlight searches
set ignorecase    " ignore case when searching
set incsearch     " do incremental searching
set laststatus=2  " display the statusline permanently
set list
set nobackup      " do not keep a backup file
set nostartofline " stop certain movements from always going to the first char of line
set number
set scrolloff=3   " keep 3 lines when scrolling
set shiftround    " round indent to multiple of 'shiftwidth'
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set showcmd       " display incomplete commands
set showmatch     " jump to matches when entering regexp
set smartcase     " no ignorecase if Uppercase char present
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set tabpagemax=100
set tabstop=4     " a hard TAB displays as 4 columns
set textwidth=79  " lines longer than 79 columns will be broken
set wildmenu      " better command-line completion
set wildmode=longest,list,full " complete to longest then list then full

" JSON syntax with javascript
autocmd BufNewFile,BufRead *.json set ft=javascript

"""""""""""""""
" PLUGINS
"""""""""""""""

" YouCompleteMe
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_autoclose_preview_window_after_insertion = 1

" File explorer
let g:netrw_liststyle=3
let g:netrw_keepdir=0
nnoremap <C-e> <esc>:Texplore<CR>

" Tagbar
nnoremap <silent> <F8> :TagbarToggle<CR>

" Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0


" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" Yapf python code reformatting
" map <C-Y> :call yapf#YAPF()<CR>
" imap <C-Y> <C-O>:call yapf#YAPF()<CR>

""""""""""""""""""
" FUNCTIONS
""""""""""""""""""

function! Pymport()
python <<EOF
import os
import re
import sys
import vim

class Scanner(object):
        _RE_VER = re.compile(r'(^import.*$)')

        def get_lines(self, buf):
                return (line for line in buf if self._RE_VER.match(line))

scanner = Scanner()
i = 0
for line in scanner.get_lines(vim.current.buffer[:]):
        vim.command("python " + line)
        i += 1

print "executed %d version cmds" % i
EOF
endfunction


nnoremap <F11> :call Pymport()<CR>
