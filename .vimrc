set t_Co=256
nnoremap <F9> :!clear && %:p<CR>
inoremap <F9> <C-o>:update<Bar>execute '!clear && %:p'<CR>
colorscheme delek

:let maplocalleader = "\\"


" moving between tabs
nnoremap <C-l> <esc>:tabnext<CR>
nnoremap <C-h> <esc>:tabprevious<CR>

" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" clear search highlights
noremap <silent><localleader>/ :nohls<CR>

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
set foldmethod=indent
set foldlevel=99
set statusline=%F%m%r%h%w\ [%{&ff}]\ [%Y]\ (%03l,%04v)[%p%%]\ %L\ LINES

syntax on         " turn syntax highlighting on by default
filetype on       " detect type of file
filetype indent on " load indent file for specific file type
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" set omnifunc=syntaxcomplete#Complete

set colorcolumn=79
hi ColorColumn ctermbg=237
set paste                      " so that pasted text won't get reformatted
au InsertLeave * set nopaste   " disable paste mode when leaving insert mode
set backspace=indent,eol,start " make backspace key work the way it should

" JSON syntax with javascript
autocmd BufNewFile,BufRead *.json set ft=javascript

" :help taglist
" Taglist plugin: no console window resize
let Tlist_Inc_Winwidth = 0
" taglist window gets the focus automatically
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
nnoremap <silent> <F8> :TlistToggle<CR>

set t_RV=               " http://bugs.debian.org/608242, http://groups.google.com/group/vim_dev/browse_thread/thread/9770ea844cec3282

function! ScanMsverEntries()
python <<EOF
import vim, re
class MsverScanner(object):
        _RE_MSVER = re.compile(r"""(^import.*ms\.version.*$|^ms\.version.*$)""",
                               re.VERBOSE)

        def get_lines(self, buf):
                return (line for line in buf if self._RE_MSVER.match(line))

scanner = MsverScanner()
i = 0
for line in scanner.get_lines(vim.current.buffer[:]):
        vim.command("python " + line)
        i += 1

print "executed %d msversion cmds" % i
EOF
endfunction
nnoremap <F10> :call ScanMsverEntries()<CR>
