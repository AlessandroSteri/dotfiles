"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sections:
"    => go to Section
"    -> Vundle, Plugins
"    -> General
"    -> Vim UI/UX 
"    -> Search and Replace
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> Vimgrep Searching and Cope Displaying
"    -> Spell Checking - TODO
"    -> Misc - TODO
"    -> Helper Functions
"    -> Latex
"    -> Plugins Settings
"    -> FileType Settings
"    -> Source Local Settings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle, Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","

" Allow to use mouse on vim
if has('mouse')
   set mouse=a
   set mousehide        " hide mouse pointer when typing
endif

"Share Clipboard Between Vim And Os
set clipboard^=unnamed,unnamedplus

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null

" Numbers
set number                      " Show current line number
set numberwidth=5
"set relativenumber             " Show relative line numbers

" Switch to relative numbering with ease
function! NumberToggle()
  if(&rnu == 1)
    set nornu
  else
    set rnu
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

" Source vimrc upon save
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim UI/UX 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
" set scrolloff=7

" " Avoid garbled characters in Chinese language windows OS
" let $LANG='en'
" set langmenu=en
" source $VIMRUNTIME/delmenu.vim
" source $VIMRUNTIME/menu.vim

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Turn on the WiLd menu
set wildmenu
set wildmode=list:longest,list:full

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

"Go to next line when scrolling horizontally after EOL
" set whichwrap+=<,>,h,l

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif


" Add a bit extra margin to the left
set foldcolumn=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search and Replace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

 "stop highlighting the current search match.
 map <silent> <Leader><Space> :noh<CR>

" Replace current selection
:nnoremap <Leader>r :%s/\<<C-r><C-w>\>/


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

highlight LineNr ctermfg=grey
try
    let g:solarized_termtrans = 1
    colorscheme solarized
    " colorscheme solarized8
    " colorscheme gruvbox
catch
endtry

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

 " Let's save undo info!
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif

set undodir=~/.vim/undo-dir
set undofile



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Tab completion will insert tab at beginning of line, will use completion if not at beginning
 set complete=.,w,t
 function! InsertTabWrapper()
     let col = col('.') - 1
     if !col || getline('.')[col - 1] !~ '\k'
         return "\<tab>"
     else
         return "\<c-p>"
     endif
 endfunction
 inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Smart way to move between windows (splits)
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>
nnoremap <Tab> :bnext<cr>
nnoremap <C-Tab> :bprevious<cr>

" Useful mappings for managing tabs

" use gt for next, gT for prev or num gt to tab num instead
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext<cr>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader><Tab> :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


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
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
" => Status line and Airline
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Format the status line, alaso with paste on/off (HasPaste defined in section Helper Funtions)
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
" let g:airline_theme='solarized'
" Enable w0rp/ale extension for airline
let g:airline#extensions#ale#enabled = 1

" use tabline from airline - currently i use a specific plugin
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#tabline#buffer_idx_mode = 1
" nmap <leader>1 <Plug>AirlineSelectTab1
" nmap <leader>2 <Plug>AirlineSelectTab2
" nmap <leader>3 <Plug>AirlineSelectTab3
" nmap <leader>4 <Plug>AirlineSelectTab4
" nmap <leader>5 <Plug>AirlineSelectTab5
" nmap <leader>6 <Plug>AirlineSelectTab6
" nmap <leader>7 <Plug>AirlineSelectTab7
" nmap <leader>8 <Plug>AirlineSelectTab8
" nmap <leader>9 <Plug>AirlineSelectTab9


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fast :
nnoremap ; :

" Swap Implementations Of 0 And ^
nnoremap 0 ^
nnoremap ^ 0

"Esc triggered when press jk together
inoremap jk <esc>
inoremap kj <esc>


" " Move a line of text using ALT+[jk] or Command+[jk] on mac i wish but it doesn't work
" nmap <M-j> mz:m+<cr>`z
" nmap <M-k> mz:m-2<cr>`z
" vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
" vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
" is a part of Move a line of text
" if has("mac") || has("macunix")
"   nmap <D-j> <M-j>
"   nmap <D-k> <M-k>
"   vmap <D-j> <M-j>
"   vmap <D-k> <M-k>
" endif

"Ignore Whitespace In Diff Mode (Focus On Code Changes Only)
if has("diff") | set diffopt+=iwhite | endif

"View Unsaved Changes In The Current Buffer As A Diff
if has("diff")
  function! DiffWithSaved()
    let filetype=&ft
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
  endfunction
  nnoremap <leader>di :call DiffWithSaved()<CR>
endif

"Provide Mapping To Reselect Text That Was Just Selected (Or Pasted)
nnoremap <leader>gv `[v`]


" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking - TODO
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
" map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
" map <leader>sn ]s
" map <leader>sp [s
" map <leader>sa zg
" map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc - TODO
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickly open a buffer for scribble
" map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
" map <leader>x :e ~/buffer.md<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Latex
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"tex file type
let g:tex_flavor = "latex"

"change vimtex preview app
let g:vimtex_view_method = 'skim'

"remoove warning when opening vimtex
let g:vimtex_compiler_latexmk = {'callback' : 0}

"shortcut for see preview
"  map § <Leader>lv


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fuzzy finder: ignore stuff that can't be opened, and generated files
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup
  let g:grep_cmd_opts = '--line-numbers --noheading'

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_ruby_checkers = ['mri']
let g:syntastic_enable_highlighting=0
let g:syntastic_check_on_open = 1

let g:syntastic_c_include_dirs = [ '/Users/alessandrosteri/mclab/devenv/lib/mclabutils/include', 'include', '../include', '/Users/alessandrosteri/mclab/jmodelica/jmodelica.org/RuntimeLibrary/src/fmi2', '/Users/alessandrosteri/mclab/jmodelica/jmodelica.org/build/FMIL_install/include/FMI2', '/Users/alessandrosteri/mclab/jmodelica/jmodelica.org/RuntimeLibrary/src/jmi' ]

"NERDTree
":pwd show current working directory
"C change tree root to selected directory
"u move tree root up one dir ..
"cd change cwd to selected dir
"toggle NERDTree thann use o to open file, i to open in horizontal split, s in vertical
"q close
map <C-t> :NERDTreeToggle<CR>

"toggle tagbar
nnoremap <silent> <Leader>d :TagbarToggle<CR>
"search through your tags file and jump to where tags are defined using ctrP
nnoremap <leader>. :CtrlPTag<cr>

"This will check the current folder for tags file and keep going one directory up all the way to the root folder. SO you can be in any sub-folder in your project and it'll be able to find the tags files. sembra non funzionare
set tags=tags;/

" Fast toggle for Goyo
map <leader>z :Goyo<cr>
map <leader>Z :Goyo 100<cr>

" hide file in nerdtree
let NERDTreeIgnore = [ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$',
      \ '\.so$', '\.egg$', '^\.git$', '^\.hg$', '^\.svn$', '^\.DS_Store',
      \ '\.png$', '\.jpg$', '\.jpeg$', '\.bmp$', '\.svg$', '\.gif$',
      \ '\.zip$', '\.gz$', '\.lock$', '\.swp$', '\.bak$', '\~$' ]

" autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>
" let g:autopep8_disable_show_diff=1

" Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Undotree
nnoremap <F5> :UndotreeToggle<cr>

if !exists('g:undotree_WindowLayout')
  let g:undotree_WindowLayout = 1
endif
  

" [startify] When A Bookmark Is Opened Via Startup Screen, Switch To Its Directory
let g:startify_change_to_dir = 1
nmap <silent> <leader>as :Startify<CR>
let g:startify_session_dir = expand("~/.vim") . "/sessions/"
let g:session_autosave = 'no'

" [vim-session]
map <Leader>ss :SaveSession
map <Leader>os :OpenSession
map <Leader>cs :CloseSession
map <Leader>ds :DeleteSession


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FileType Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile *.md set filetype=markdown

"Set Whitespace Settings For Python Related Files
augroup setup_whitespace
  au filetype python   setl ts=4 sw=4 sts=4 tw=80 et
augroup end
" Warns When Text Width Exceeds Predefined Width In Python Files
augroup exceeded_text_width
  au filetype python match ErrorMsg '\%>80v.\+'
augroup end

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Source Local Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Allow local vimrc
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" Local bundle on ~/.vimrc.bundles
