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

"source /home/janosh/recentdl/rope/rope.vim

<<<<<<< HEAD
set nocompatible
filetype off

set rtp+=~/.vim/vundle.git/ 
call vundle#rc()

"Command T Esc Binding
let g:CommandTCancelMap='<Esc>'
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'msanders/snipmate.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'ervandew/supertab'
Bundle 'tpope/vim-surround'
Bundle 'fs111/pydoc.vim'
Bundle 'vim-scripts/tComment'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'rails.vim'
Bundle 'pyflakes.vim'
" Bundle 'PySmell'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'

"" Pydiction Config
" let g:pydiction_location = '/home/jonas/.vim/bundle/Pydiction/complete-dict'
""
filetype plugin indent on
=======
"set nocompatible
>>>>>>> a2bd2c941e9c5fbf1b0c6970c1ea42407a3155ea

autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" Tabs ************************************************************************
"set sta " a <Tab> in an indent inserts 'shiftwidth' spaces

<<<<<<< HEAD
function! Tabstyle_spaces()
  " Use 4 spaces
  set softtabstop=4
  set shiftwidth=4
  set tabstop=4
=======
function! Tabstyle_tabs()
  " Using 4 column tabs
  set softtabstop=4
  set shiftwidth=4
  set tabstop=4
  set noexpandtab
  autocmd User Rails set softtabstop=4
  autocmd User Rails set shiftwidth=4
  autocmd User Rails set tabstop=4
  autocmd User Rails set noexpandtab
endfunction

function! Tabstyle_spaces()
  " Use 2 spaces
  set softtabstop=2
  set shiftwidth=2
  set tabstop=2
>>>>>>> a2bd2c941e9c5fbf1b0c6970c1ea42407a3155ea
  set expandtab
endfunction

call Tabstyle_spaces()

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
<<<<<<< HEAD

=======
 
>>>>>>> a2bd2c941e9c5fbf1b0c6970c1ea42407a3155ea
nmap <F4> :call ToggleSpell()<CR>
imap <F4> <Esc>:call ToggleSpell()<CR>a
" Navigation *****************************************************************
noremap <C-h> <C-W>h
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l
noremap ,l :bprevious!<CR>
noremap ,; :bNext!<CR>
<<<<<<< HEAD
=======
map <Tab> 
>>>>>>> a2bd2c941e9c5fbf1b0c6970c1ea42407a3155ea
noremap <C-h> <C-W>h 
noremap <C-j> <C-W>j 
noremap <C-k> <C-W>k 
noremap <C-l> <C-W>l 

"Press space to alternate between Unfold and Fold
<<<<<<< HEAD
nnoremap <Space> za
map <leader>c <c-_><c-_>
map <esc><Space> gcc
inoremap <Nul> <C-x><C-o>
=======
nnoremap <space> za
>>>>>>> a2bd2c941e9c5fbf1b0c6970c1ea42407a3155ea
" Indenting *******************************************************************
set ai " Automatically set the indent of a new line (local to buffer)
set si " smartindent	(local to buffer)

<<<<<<< HEAD
=======
"bracket autocompletion
"inoremap ( ()<ESC>i
"inoremap [ []<ESC>i
"inoremap { {<CR>}<ESC>O
"autocmd Syntax html,vim inoremap < <lt>><ESC>i| inoremap > <c-r>=ClosePair('>')<CR>
"inoremap ) <c-r>=ClosePair(')')<CR>
"inoremap ] <c-r>=ClosePair(']')<CR>
"inoremap } <c-r>=CloseBracket()<CR>
"inoremap " <c-r>=QuoteDelim('"')<CR>
"inoremap ' <c-r>=QuoteDelim("'")<CR>
"
"
"function ClosePair(char)
"  if getline('.')[col('.') - 1] == a:char
"    return "\<Right>"
"  else
"    return a:char
"  endif
"endf
"
"function CloseBracket()
"  if match(getline(line('.') + 1), '\s*}') < 0
"    return "\<CR>}"
"  else
"    return "\<ESC>j0f}a"
"  endif
"endf
"
"function QuoteDelim(char)
"  let line = getline('.')
"  let col = col('.')
"  if line[col - 2] == "\\"
"    "Inserting a quoted quotation mark into the string
"    return a:char
"  elseif line[col - 1] == a:char
"    "Escaping out of the string
"    return "\<Right>"
"  else
"    "Starting a string
"    return a:char.a:char."\<ESC>i"
"  endif
"endf

>>>>>>> a2bd2c941e9c5fbf1b0c6970c1ea42407a3155ea
" Python Stuff ****************************************************************
"inoremap <Nul> <C-x><C-o>

"python << EOF
"import os
"import sys
"import vim
"for p in sys.path:
"    if os.path.isdir(p):
"        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
"EOF

"map <C-h> :py EvaluateCurrentRange()
" Scrollbars ******************************************************************
set sidescrolloff=2
set numberwidth=4


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



" Line Wrapping ***************************************************************
set nowrap
set linebreak  " Wrap at word

<<<<<<< HEAD
=======

" Mappings ********************************************************************
" Professor VIM says '87% of users prefer jj over esc', jj abrams disagrees
"imap jj <Esc>
"imap uu _
"imap hh =>
"imap aa @
cmap WQ wq
cmap qq qa
cmap W w
cmap Q q


>>>>>>> a2bd2c941e9c5fbf1b0c6970c1ea42407a3155ea
" Directories *****************************************************************
" Setup backup location and enable
"set backupdir=~/backup/vim
"set backup

" Set Swap directory
"set directory=~/backup/vim/swap

" Sets path to directory buffer was loaded from
"autocmd BufEnter * lcd %:p:h

<<<<<<< HEAD
" Insert New Line **************************************************************

" noremap <Enter> O<ESC> " awesome, inserts new line without going into insert mode
nnoremap <Enter> :set paste<CR>m`O<Esc>``:set nopaste<CR>
"set fo-=r " do not insert a comment leader after an enter, (no work, fix!!)
=======

" File Stuff ******************************************************************
filetype plugin indent on
" To show current filetype use: set filetype

"autocmd FileType html :set filetype=xhtml 


" Inser New Line **************************************************************
map <S-Enter> O<ESC> " awesome, inserts new line without going into insert mode
map <Enter> o<ESC>
set fo-=r " do not insert a comment leader after an enter, (no work, fix!!)

>>>>>>> a2bd2c941e9c5fbf1b0c6970c1ea42407a3155ea

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
<<<<<<< HEAD

=======
>>>>>>> a2bd2c941e9c5fbf1b0c6970c1ea42407a3155ea
:noremap ,i :set list!<CR> " Toggle invisible chars
:noremap ,w :set wrap!<CR>  " Toggle Text wrapping

" Mouse ***********************************************************************
set mouse=a " Enable the mouse
"behave xterm
"set selectmode=mouse


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


" Omni Completion *************************************************************
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
" May require ruby compiled in
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete 
<<<<<<< HEAD
"Supertab default completion
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
let g:SuperTabLongestEnhanced = 1
"
"
"
=======



>>>>>>> a2bd2c941e9c5fbf1b0c6970c1ea42407a3155ea
" -----------------------------------------------------------------------------  
" |                              Plug-ins                                     |
" -----------------------------------------------------------------------------  

"" NERDTree ********************************************************************
<<<<<<< HEAD
:noremap ,n :NERDTreeToggle<CR>

=======
":noremap ,n :NERDTreeToggle<CR>
>>>>>>> a2bd2c941e9c5fbf1b0c6970c1ea42407a3155ea
"
"" User instead of Netrw when doing an edit /foobar
"let NERDTreeHijackNetrw=1
"
"" Single click for everything
"let NERDTreeMouseMode=1
" Trinity ******************************************************************
" Open and close all the three plugins on the same time
<<<<<<< HEAD
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
=======
nmap <F8>   :TrinityToggleAll<CR>

" Open and close the srcexpl.vim separately
nmap <F9>   :TrinityToggleSourceExplorer<CR>

" Open and close the taglist.vim separately
nmap <F10>  :TrinityToggleTagList<CR>

" Open and close the NERD_tree.vim separately
nmap <F11>  :TrinityToggleNERDTree<CR>
nmap ,n  :TrinityToggleNERDTree<CR>
nmap <F11>  :TrinityToggleNERDTree<CR>
nmap ,n  :TrinityToggleNERDTree<CR>

>>>>>>> a2bd2c941e9c5fbf1b0c6970c1ea42407a3155ea
" SnippetsEmu *****************************************************************
"imap <unique> <C-j> <Plug>Jumper
"let g:snip_start_tag = "_\."
"let g:snip_end_tag = "\._"
"let g:snip_elem_delim = ":"
"let g:snip_set_textmate_cp = '1'  " Tab to expand snippets, not automatically.


" fuzzyfinder_textmate ********************************************************
<<<<<<< HEAD
"map ,f :FuzzyFinderFile<CR>
"map ,b :FuzzyFinderBuffer<CR>
=======
map ,f :FuzzyFinderFile<CR>
map ,b :FuzzyFinderBuffer<CR>
>>>>>>> a2bd2c941e9c5fbf1b0c6970c1ea42407a3155ea
"let g:fuzzy_ignore = '.o;.obj;.bak;.exe;.pyc;.pyo;.DS_Store;.db'

" autocomplpop ***************************************************************
" complete option
"set complete=.,w,b,u,t,k
"let g:AutoComplPop_CompleteOption = '.,w,b,u,t,k'
"set complete=.
<<<<<<< HEAD
"let g:AutoComplPop_IgnoreCaseOption = 0
"let g:AutoComplPop_BehaviorKeywordLength = 2
=======
let g:AutoComplPop_IgnoreCaseOption = 0
let g:AutoComplPop_BehaviorKeywordLength = 2
>>>>>>> a2bd2c941e9c5fbf1b0c6970c1ea42407a3155ea



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

<<<<<<< HEAD
=======


>>>>>>> a2bd2c941e9c5fbf1b0c6970c1ea42407a3155ea
" -----------------------------------------------------------------------------  
" |                               Host specific                               |
" -----------------------------------------------------------------------------  
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

<<<<<<< HEAD
=======
"if hostname() == "foo"
  " do something
"xendif
>>>>>>> a2bd2c941e9c5fbf1b0c6970c1ea42407a3155ea
