" Based on https://github.com/sontek/dotfiles/
" and influenced by http://amix.dk/vim/vimrc.html
" tailored to fit by Jonathan Sick, jonathansick@mac.com

" ==========================================================
" Shortcuts 
" ==========================================================
set nocompatible              " Don't be compatible with vi
let mapleader=","             " change the leader to be a comma vs slash

" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w

" Toggle the tasklist
map <leader>td <Plug>TaskList

" Compile markdown into Marked
" http://support.markedapp.com/kb/how-to-tips-and-tricks/marked-bonus-pack-scripts-commands-and-bundles
:nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>

" run py.test's
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

" Run django tests
map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>

" open/close the quickfix window
nmap <leader>c :copen<CR>
nmap <leader>cc :cclose<CR>

" for when we forget to use sudo to open/edit a file
cmap w!! w !sudo tee % >/dev/null

" ctrl-jklm  changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" and lets make these all work in insert mode too ( <C-O> makes next cmd
"  happen as if in command mode )
imap <C-W> <C-O><C-W>

" Open NerdTree
map <leader>n :NERDTreeToggle<CR>

" Run command-t file search
map <leader>f :CommandT<CR>
" Ack searching 
nmap <leader>a <Esc>:Ack! 

" Load the Gundo window
map <leader>g :GundoToggle<CR>

" Jump to the definition of whatever the cursor is on
map <leader>j :RopeGotoDefinition<CR>

" Rename whatever the cursor is on (including references to it)
map <leader>r :RopeRename<CR>
" ==========================================================
" Pathogen - Allows us to organize our vim plugins
" ==========================================================
" Load pathogen with docs for all plugins
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" ==========================================================
" Basic Settings 
" ==========================================================
syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
set number                    " Display line numbers
set numberwidth=1             " using only 1 column (and 1 space) while possible
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc 
set grepprg=ack-grep          " replace the default grep program with ack

" Auto change the directory to the current file I'm working on
"autocmd BufEnter * lcd %:p:h

""" Insert completion
" don't select first item, follow typing in autocomplete
set completeopt=menuone,longest,preview
set pumheight=6             " Keep a small completion window

" show a line at column 79
 if exists("&colorcolumn")
    set colorcolumn=79
endif

""" Moving Around/Editing
"set cursorline              " have a line indicate the cursor location
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=3             " Keep 3 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
set matchtime=2             " (for only .2 seconds).
set nowrap                  " don't wrap text
set linebreak               " don't wrap textin the middle of a word
set autoindent              " always set autoindenting on
set tabstop=4               " <tab> inserts 4 spaces 
set shiftwidth=4            " but an indent level is 2 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>         " show matching <> (html mainly) as well
set foldmethod=indent       " allow us to fold on indents
set foldlevel=99            " don't fold by default

" close preview window automatically when we move around
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"""" Reading/Writing
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noswapfile
set nobackup
set nowb
set autoread                " automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.

"""" Messages, Info, Status
set ls=2                    " allways show status line
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler                   " Show some info, even without statuslines.
set laststatus=2            " Always show statusline, even if only 1 window.
set statusline=%<%f\ (%{&ft})%=%-19(%3l,%02c%03V%)%{fugitive#statusline()}

" displays tabs with :set list & displays when a line runs off-screen
" Courtesy http://vimcasts.org/episodes/show-invisibles/
" see also :help listchars
set listchars=tab:▸\ ,eol:¬
set list

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

" ==========================================================
" Python
" ==========================================================
let python_highlight_all = 1 " Supposedly better python syntax

"au BufRead *.py compiler nose
au FileType python set omnifunc=pythoncomplete#Complete
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m


" ==========================================================
" Javascript
" ==========================================================
au BufRead *.js set makeprg=jslint\ %

" ==========================================================
" SuperTab - Allows us to get code completion with tab
" ==========================================================
" Try different completion methods depending on its context
let g:SuperTabDefaultCompletionType = "context"

" Add the virtualenv's site-packages to vim path
" py << EOF
" import os.path
" import sys
" import vim
" if 'VIRTUALENV' in os.environ:
"     project_base_dir = os.environ['VIRTUAL_ENV']
"     sys.path.insert(0, project_base_dir)
"     activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"     execfile(activate_this, dict(__file__=activate_this))
" EOF
" 
" " Load up virtualenv's vimrc if it exists
" if filereadable($VIRTUAL_ENV . '/.vimrc')
"     source $VIRTUAL_ENV/.vimrc
" endif

" Mac-like shift+movement selection
if has("gui_macvim")
	let macvim_hig_shift_movement = 1
endif

" Jonathan Sick's Major Additions ============================================

" Display, use the Solarized colour scheme,
" http://ethanschoonover.com/solarized/vim-colors-solarized
syntax enable
set background=light
let g:solarized_termtrans=1
"let g:solarized_contrast = "normal"
"let g:solarized_visibility = "low"
colorscheme solarized

" === LaTeX, see
" http://vim-latex.sourceforge.net/documentation/latex-suite/recommended-settings.html
let g:tex_flavor='latex'
" See http://www.phys.psu.edu/~collins/software/latexmk-jcc/ for latex
" options. I use:
" -f force latexmk to continue a compilation with errors
" -bibtex-cond regenerates bbl only if the bibtex file can be found
" -pdf uses pdflatex
let g:LatexBox_latexmk_options="-f -pdf -bibtex-cond"
map <silent> <Leader>ls :silent !/Applications/Skim.app/Contents/SharedSupport/displayline
		\ <C-R>=line('.')<CR> "<C-R>=LatexBox_GetOutputFile()<CR>" "%:p"

" Refine settings for specific filetypes
if has("autocmd")
    " Enable file type detection
    filetype on
    
    " auto-wrap prose
    autocmd FileType text,markdown,html,tex,rst setlocal wrap linebreak nolist

    autocmd FileType gitconfig setlocal ts=4 sts=4 sw=4 noexpandtab
endif

" Auto-update vim with modified vimrc
" http://vimcasts.org/episodes/updating-your-vimrc-file-on-the-fly/
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
" Press ``,vimrc`` to edit vimrc file
nmap <leader>vimrc :tabedit $MYVIMRC<CR>


" Dan Foreman-Mackey's Additions =============================================

let g:snips_author=$MYNAME     " automatically insert your name (from bashrc)

" End of line behaviour
set ww=<,>,[,],h,l,b,s,~

" Make it so that the arrow keys don't kill visual mode
vnoremap <Left> h
vnoremap <Right> l
vnoremap <Up> k
vnoremap <Down> j

" === File templates
" http://tumblr.com/xuz29tkj6a

function! LoadTemplate()
    silent! 0r ~/.vim/skel/tmpl.%:e
    silent! %s/%DATE%/\=strftime("%Y-%m-%d")/g
    silent! %s/%AUTHOR%/\=$MYNAME/g
    silent! %s/%FILENAME%/\=expand("%:t")/g
    silent! %s/%START%//g
endfunction
autocmd! BufNewFile * call LoadTemplate()

" === Spellcheck

nmap <silent> <leader>s :set spell!<CR>
set spelllang=en_ca " choose en / en_us / en_ca etc.

" === Ctags/Taglist

map <leader>tt :TlistToggle<CR>
let Tlist_Ctags_Cmd="/usr/local/bin/ctags" " use exuberant ctags
nmap ,t :!(cd %:p:h;ctags *)<CR>        " rebuild tag index
set tags=./tags,tags                    " configure Ctags to use global project tags
let Tlist_Auto_Open = 1                 " automatically open taglist
let Tlist_Use_Right_Window = 1          " only open taglist on the right
let Tlist_Exit_OnlyWindow = 1           " automatically close taglist when we close the window

" LaTeX support! See http://vim-taglist.sourceforge.net/extend.html
let tlist_tex_settings   = 'latex;s:sections;g:graphics;l:labels;b:bibitem'
let tlist_make_settings  = 'make;m:makros;t:targets'
