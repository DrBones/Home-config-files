" -----------------------------------------------------------------------------  
" |                            VIM Settings                                   |
" |                   (see gvimrc for gui vim settings)                       |
" |                                                                           |
" | Some highlights:                                                          |
" |   jj = <esc>  Very useful for keeping your hands on the home row          |
" |   ,n = toggle NERDTree off and on                                         |
" |                                                                           |
" |   ,f = fuzzy find all files                                               |
" |   ,b = fuzzy find in all buffers                                          |
" |                                                                           |
" |   hh = inserts '=>'                                                       |
" |   aa = inserts '@'                                                        |
" |                                                                           |
" |   ,h = new horizontal window                                              |
" |   ,v = new vertical window                                                |
" |                                                                           |
" |   ,i = toggle invisibles                                                  |
" |   ,w = toggle wrapping
" |                                                                           |
" |   enter and shift-enter = adds a new line after/before the current line   |
" |                                                                           |
" |   :call Tabstyle_tabs = set tab to real tabs                              |
" |   :call Tabstyle_spaces = set tab to 2 spaces                             |
" |                                                                           |
" | Put machine/user specific settings in ~/.vimrc.local                      |
" -----------------------------------------------------------------------------  


set nocompatible
filetype off

set rtp+=~/.vim/vundle.git/ 
call vundle#rc()

"Command T Esc Binding
let g:CommandTCancelMap='<Esc>'
let g:CommandTMaxHeight=10
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'msanders/snipmate.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'sontek/rope-vim'
Bundle 'ervandew/supertab'
Bundle 'rygwdn/rope-omni'
Bundle 'tpope/vim-surround'
Bundle 'fs111/pydoc.vim'
Bundle 'vim-scripts/tComment'
Bundle 'scrooloose/nerdtree'
"Bundle 'fholgado/minibufexpl.vim'
" vim-scripts repos
"Bundle 'pylint.vim'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'buftabs'
Bundle 'rails.vim'
Bundle 'taglist.vim'
Bundle 'pyflakes.vim'
" Bundle 'PySmell'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on
"set nocompatible

autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" Number of spaces to use for an indent.
" This will affect Ctrl-T and 'autoindent'.
" Python: 4 spaces
" C: 8 spaces (pre-existing files) or 4 spaces (new files)
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead *.c,*.h set shiftwidth=8
au BufNewFile *.c,*.h set shiftwidth=4

" Number of spaces that a pre-existing tab is equal to.
" For the amount of space used for a new tab use shiftwidth.
" Python: 4
" C: 4
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

" Replace tabs with the equivalent number of spaces.
" Also have an autocmd for Makefiles since they require hard tabs.
" Python: yes
" C: no
" Makefile: no
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.c,*.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab


" Wrap text after a certain number of characters
" Python: 120
" C: 120
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h set textwidth=120

" Turn off settings in 'formatoptions' relating to comment formatting.
" - c : do not automatically insert the comment leader when wrapping based on
"    'textwidth'
" - o : do not insert the comment leader when using 'o' or 'O' from command mode
" - r : do not insert the comment leader when hitting <Enter> in insert mode
" Python: not needed
" C: prevents insertion of '*' at the beginning of every line in a comment
au BufRead,BufNewFile *.c,*.h set formatoptions-=c formatoptions-=o formatoptions-=r

" Use UNIX (\n) line endings.
" Only used for new files so as to not force existing files to change their
" line endings.
" Python: yes
" C: yes
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" The following section contains suggested settings.  While in no way required
" to meet coding standards, they are helpful.

" Set the default file encoding to UTF-8: 
set encoding=utf-8

" Puts a marker at the beginning of the file to differentiate between UTF and
" UCS encoding (WARNING: can trick shells into thinking a text file is actually
" a binary file when executing the text file): ``set bomb``

" Keep indentation level from previous line: 
set autoindent

" Disable read-only protection
" set modifiable

" Persistent undo
set undodir=/tmp/
set undofile

"---------------------------------------------------------------------
" Python IDE related staff
"---------------------------------------------------------------------

" highlight variable under cursor (not smart)
" Python: yes
" C: yes

"au BufRead,BufNewFile *.py,*.pyw,*.c  autocmd CursorMoved * silent! exe printf('match IncSearch /\<%s\>/', expand('<cword>'))

" Folding based on indentation:
set foldmethod=indent
" Display column on the left of size =1 to indictae folds on the left
set foldcolumn=1

"---------------------------------------------------------------------
" File formats support 
"---------------------------------------------------------------------

" Json
au! BufRead,BufNewFile *.json setfiletype json

" Show full tags when doing search completion
set showfulltag

" Speed up macros
set lazyredraw

" Include $HOME in cdpath
let &cdpath=','.expand("$HOME")

" Disable backup files
" set noswapfile
" set nobackup

" Set mouse mod
set mouse=a
set mousemodel=popup

" Try to show at least three lines and two columns of context when
" scrolling
set scrolloff=3
set sidescroll=3
set sidescrolloff=3

" Allow edit buffers to be hidden
set hidden
" 1 height windows
set winminheight=1

" Wrap on these
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h set whichwrap+=<,>,[,]

" Use the cool tab complete menu
set wildmenu
set wildignore=*.o,*~

" If possible, try to use a narrow number column.
setlocal numberwidth=4

set fillchars=fold:-

" Spellchecking, toggle using F4*********************************************

function! ToggleSpell()
    if !exists("b:spell")
        setlocal spell spelllang=en_us
        let b:spell = 1
    else
        setlocal nospell
        unlet b:spell
    endif
endfunction
" Rope AutoComplete
let ropevim_vim_completion = 1
let ropevim_extended_complete = 1
let g:ropevim_autoimport_modules = ["os.*","traceback","django.*","lxml.etree","lxml.*","scipy"]
" imap <c-space> <C-R>=RopeCodeAssistInsertMode()<CR>

nmap <F4> :call ToggleSpell()<CR>
imap <F4> <Esc>:call ToggleSpell()<CR>a
" Navigation use Ctrl - hjkl  key to switch split windows*****************
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>
noremap <silent> <S-h> :bprevious!<CR>
noremap <silent> <S-l> :bNext!<CR>
:ca WQ wq
:ca W w
:ca X x
:ca Q q
"Press space to alternate between Unfold and Fold
nnoremap <Space> za
map <leader>c <c-_><c-_>
map <esc><Space> gcc
inoremap <Nul> <C-x><C-o>
" Indenting *******************************************************************
set ai " Automatically set the indent of a new line (local to buffer)
set si " smartindent	(local to buffer)

" Python Stuff ****************************************************************

"python << EOF
"import os
"import sys
"import vim
"for p in sys.path:
"    if os.path.isdir(p):
"        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
"EOF

"map <C-h> :py EvaluateCurrentRange()
"Set minimal width of Number Column to the left
set numberwidth=1


" Windows *********************************************************************
set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright

"Vertical split then hop to new buffer
:noremap ,v :vsp^M^W^W<cr>
:noremap ,h :split^M^W^W<cr>


" Cursor highlights ***********************************************************
"set cursorline
"set cursorcolumn


" Searching *******************************************************************
set hlsearch  " highlight search
set incsearch  " incremental search, search as you type
set ignorecase " Ignore case when searching 
set smartcase " Ignore case when searching lowercase, needs ignorecase set


" Colors **********************************************************************
"set t_Co=256 " 256 colors
"set background=dark 
syntax on " syntax highlighting
" For full syntax highlighting:
" python_highlight_all displays bad whitespaces
" Use the below highlight group when displaying bad whitespace is desired
" highlight BadWhitespace ctermbg=red guisp=red gui=undercurl guifg=NONE guibg=NONE

" Display tabs at the beginning of a line in Python mode as bad.
" au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
let python_highlight_all=1
" Select colormap: 'soft', 'softlight', 'standard' or 'allblue'
"let xterm16_colormap    = 'soft'

" Select brightness: 'low', 'med', 'high', 'default' or custom levels.
"let xterm16_brightness  = 'default'

"colo xterm16

colorscheme ir_black


" Status Line *****************************************************************
"set showcmd
"set ruler " Show ruler
"set ch=2 " Make command line two lines high
if has("statusline")
 set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
endif

"Always display Cursor position in lower right
set ruler

" Line Wrapping ***************************************************************
set nowrap
set linebreak  " Wrap at word

" Directories *****************************************************************
" Setup backup location and enable
"set backupdir=~/backup/vim
"set backup

" Set Swap directory
"set directory=~/backup/vim/swap

" Sets path to directory buffer was loaded from
"autocmd BufEnter * lcd %:p:h

" Insert New Line **************************************************************

nnoremap <Enter> :set paste<CR>m`O<Esc>``:set nopaste<CR>
"set fo-=r " do not insert a comment leader after an enter, (no work, fix!!)

" Sessions ********************************************************************
" Sets what is saved when you save a session
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize


" Misc ************************************************************************
set backspace=indent,eol,start
set number " Show line numbers
set matchpairs+=<:>
set vb t_vb= " Turn off bell, this could be more annoying, but I'm not sure how


" Invisible characters  and Wrapping *******************************************
set listchars=trail:.,tab:>-,eol:$
set nolist
:noremap ,i :set list!<CR> " Toggle invisible chars
:noremap ,w :set wrap!<CR>  " Toggle Text wrapping

" Cursor Movement *************************************************************
" Make cursor move by visual lines instead of file lines (when wrapping)
map <up> gk
map k gk
imap <up> <C-o>gk
map <down> gj
map j gj
imap <down> <C-o>gj
map E ge

" Ruby stuff ******************************************************************
"compiler ruby         " Enable compiler support for ruby
"map <F5> :!ruby %<CR>

"---------------------------------------------------------------------
" completion
"---------------------------------------------------------------------

"by tags
set dictionary=/usr/share/dict/words
let g:showfuncctagsbin = "/usr/bin/ctags"

" by pydict
let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict' 

" Omni Completion *************************************************************
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=RopeCompleteFunc
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" May require ruby compiled in

autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete 

"Supertab default completion
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
let g:SuperTabLongestEnhanced = 1

" --------- Ctags
nnoremap <silent> <F9> :TlistToggle<CR>
" show list on the rightmost side of the window
let Tlist_Use_Right_Window = 1
" remove empty lines
let Tlist_Compact_Format = 1
" show Tlist menu in gVim
let Tlist_Show_Menu = 1 

""" --------- Pylint
"autocmd FileType python compiler pylint
"" Don't show quickfix window. Manually can be opened by :cope
"let g:pylint_cwindow = 0
"" Don't show style errors
"let g:pylint_conventions = 1
"" Check file 'on fly'
"let g:pylint_onfly = 1

" -----------------------------------------------------------------------------  
" |                              Plug-ins                                     |
" -----------------------------------------------------------------------------  

"" NERDTree ********************************************************************
noremap <silent> <F7> :NERDTreeToggle<CR>
noremap <silent> <leader>n :NERDTreeToggle<CR>
"" User instead of Netrw when doing an edit /foobar
let NERDTreeHijackNetrw=1
let NERDTreeWinPos='right'
"
"" Single click for everything
"let NERDTreeMouseMode=1
" Trinity ******************************************************************
" Open and close all the three plugins on the same time
"nmap <F8>   :TrinityToggleAll<CR>
"
"" Open and close the srcexpl.vim separately
"nmap <F9>   :TrinityToggleSourceExplorer<CR>
"
"" Open and close the taglist.vim separately
"nmap <F10>  :TrinityToggleTagList<CR>
"
"" Open and close the NERD_tree.vim separately
"nmap <F11>  :TrinityToggleNERDTree<CR>
"
" SnippetsEmu *****************************************************************
"imap <unique> <C-j> <Plug>Jumper
"let g:snip_start_tag = "_\."
"let g:snip_end_tag = "\._"
"let g:snip_elem_delim = ":"
"let g:snip_set_textmate_cp = '1'  " Tab to expand snippets, not automatically.


" fuzzyfinder_textmate ********************************************************
map ,f :FuzzyFinderFile<CR>
map ,b :FuzzyFinderBuffer<CR>
"let g:fuzzy_ignore = '.o;.obj;.bak;.exe;.pyc;.pyo;.DS_Store;.db'

" autocomplpop ***************************************************************
" complete option
"set complete=.,w,b,u,t,k
"let g:AutoComplPop_CompleteOption = '.,w,b,u,t,k'
"set complete=.
"let g:AutoComplPop_IgnoreCaseOption = 0
"let g:AutoComplPop_BehaviorKeywordLength = 2

" -----------------------------------------------------------------------------  
" |                             OS Specific                                   |
" |                      (GUI stuff goes in gvimrc)                           |
" -----------------------------------------------------------------------------  

" Mac *************************************************************************
"if has("mac") 
  "" 
"endif
 
" Windows *********************************************************************
"if has("gui_win32")
  "" 
"endif


" -----------------------------------------------------------------------------  
" |                               Startup                                     |
" -----------------------------------------------------------------------------  
" Open NERDTree on start
"autocmd VimEnter * exe 'NERDTree' | wincmd l 

" -----------------------------------------------------------------------------  
" |                               Host specific                               |
" -----------------------------------------------------------------------------  
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
