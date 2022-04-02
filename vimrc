scriptencoding utf-8
" Based on https://github.com/sontek/dotfiles/
" and influenced by http://amix.dk/vim/vimrc.html
" tailored to fit by Jonathan Sick, jonathansick@mac.com

set nocompatible              " Don't be compatible with vi
set hidden                    " Lusty plugin prefers this
set encoding=utf-8            " Force UTF-8; maybe presumptive?

let mapleader=","             " change the leader to be a comma vs slash
" Use \ to complement ; for reverse character search
nnoremap \ ,

" ==========================================================
" vim-plug
" ==========================================================
if filereadable(expand("~/.vimrc.bundles"))
      source ~/.vimrc.bundles
  endif

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
set path+=** " :find will now do recursive fuzzy file finding

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc,*.aux
" set grepprg=ack-grep          " replace the default grep program with ack

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
set foldmethod=marker       " just fold with markers (efficient)
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
" Shortcuts 
" ==========================================================

" Get back to normal mode faster
:inoremap kj <Esc>

" Seriously guys. It's not like :W is bound to anything anyway.
command! W :w

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

" Load the Gundo window
map <leader>g :GundoToggle<CR>

" Redraw windows
map <leader>r :redraw!<CR>

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

" Prose writing settings
" inspired by http://www.drbunsen.org/writing-in-vim.html
func WordProcessorMode()
    setlocal formatoptions=1
    setlocal expandtab
    map j gj
    map k gk
    setlocal spell spelllang=en_ca
    setlocal wrap
    setlocal linebreak
    setlocal nolist
    setlocal ts=2
    setlocal sts=2
    setlocal sw=2
    setlocal cc=
    setlocal guifont=*
    " setlocal guifont=Nitti\ Light:h18
    " setlocal linespace=9
    " setlocal guifont=Nitti\ Light:h16
    setlocal guifont=Source\ Code\ Pro:h14
    setlocal linespace=4
    highlight Cursor guifg=#002B36 guibg=#268DB2
    highlight iCursor guifg=#268DB2 guibg=#002B36
    " disable syntastic error checking
    SyntasticToggleMode
endfu
com! WP call WordProcessorMode()

" Formd mappings - Convert inline to referenced style markdown
" http://drbunsen.github.com/formd/
nmap <leader>fr :%! formd -r<CR>
nmap <leader>fi :%! formd -i<CR>

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
set spellfile="~/.vim/en.utf-8.add"

" === Ctags/Taglist
map <leader>tags :TlistToggle<CR>
let Tlist_Ctags_Cmd="/usr/local/bin/ctags" " use exuberant ctags
nmap ,tagup :!(cd %:p:h;ctags *)<CR>        " rebuild tag index
set tags=./tags,tags                    " configure Ctags to use global project tags
let Tlist_Auto_Open = 1                 " automatically open taglist
let Tlist_Use_Right_Window = 1          " only open taglist on the right
let Tlist_Exit_OnlyWindow = 1           " automatically close taglist when we close the window
" LaTeX support! See http://vim-taglist.sourceforge.net/extend.html
let tlist_tex_settings   = 'latex;s:sections;g:graphics;l:labels;b:bibitem'
let tlist_make_settings  = 'make;m:makros;t:targets'

" === UltiSnips =============================================================
" Rather than using <tab>, these bindings are compatible out-of-the box with
" YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" === NerdTree ===============================================================
let NERDTreeIgnore = ['\.pyc$', '\.aux$', '\.blg$', '\.fdb_latexmk$', '\.fls$', '\.upa$', '\.upb', '\.cb', '\.cb2', '\.lof', '\.toc', '\.lot']
let NERDTreeShowHidden=1
nmap <leader>tree :NERDTreeToggle<CR>


" === Misc Hacks ============================================================
" So that latex-suite always sets 'tex' filetype rather than 'plaintex'
" sometimes
let g:tex_flavor='latex'

" === VimRoom
" https://github.com/mikewest/vimroom/issues/7
let g:vimroom_sidebar_height = 0
if has('gui_running')
    let g:vimroom_guibackground = '#fdf6e4'
else
    let g:vimroom_ctermbackground = 8
endif

" === vim-pencil =============================================================
" Awesome prose writing mode for vim
" https://github.com/reedes/vim-pencil
" See after/ftplugin files to enabling pencil for specific syntaxes
"
" By default, use softwrapping. It will still autodetect and use hardwrap
" Use :HardPencil to force hard wrapping
let g:pencil#wrapModeDefault = 'soft'

" In hard-wrap mode, autoformat by default unless syntax element is excluded
" Toggle via :PFormatToggle
let g:pencil#autoformat = 1

" Disable syntax concealing
" let g:pencil#conceallevel = 0

" === Goyo + limelight writing mode ==========================================
" https://github.com/junegunn/goyo.vim
" https://github.com/junegunn/limelight.vim
" The colors from from solarizedlight
" http://ethanschoonover.com/solarized
" I need to manually set the concealed text foreground color since Solarized
" messes with color palettes to customize the 256 color palette
let g:limelight_conceal_ctermfg = 245  " Solarized Base1
let g:limelight_conceal_guifg = '#8a8a8a'  " Solarized Base1
" let g:limelight_conceal_ctermfg = 254  " Solarized Base2
" let g:limelight_conceal_guifg = '#eee8d5'  " Solarized Base2

function! s:goyo_enter()
  " Changes when starting Goyo
  " silent !tmux set status off
  " set noshowmode
  " set noshowcmd
  " set scrolloff=999
  " FDF6E3
  " highlight NonText guifg=#FDF6E3 guibg=#FDF6E3
  Limelight
endfunction

function! s:goyo_leave()
  " Restore environment when leaving Goyo
  " silent !tmux set status on
  " set showmode
  " set showcmd
  " set scrolloff=5
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()


" === Enable SWIG highlighting =============================

augroup filetypedetect
    autocmd BufNew,BufNewFile,BufRead *.i :setfiletype SWIG
augroup END

" ==========================================================
" JSX / mxw/vim-jsx
" ==========================================================
" Allow JSX in .js files
let g:jsx_ext_required = 0

" ==========================================================
" Configure fzf
" ==========================================================
nnoremap <C-p> :<C-u>FZF<CR>
" call fzf#run({'source': 'git ls-files', 'sink': 'e'})

" ==========================================================
" Configure neoformat (prettier, etc)
" ==========================================================
autocmd BufWritePre *.js,*.jsx,*.scss,*.css,*.graphql,*.prisma Neoformat

" ==========================================================
" Configure ale (linting)
" ==========================================================
" Only run linters named in ale_linters settings.
" Linters are defined in the after/ftplugin/ files of each language
let g:ale_linters_explicit = 1
" Have fun with symbols
let g:ale_sign_error = '•'
let g:ale_sign_warning = '#'
" Always keep sign column open to avoid redraw bugs
let g:ale_sign_column_always = 1

" ==========================================================
" GraphQL
" ==========================================================
augroup filetypedetect
    autocmd BufNew,BufNewFile,BufRead *.prisma :setfiletype graphql
augroup END

" ==========================================================
" local vimrc extensions
" ==========================================================

" vimrc extensions specific to an rcm tag for a platform; e.g. mac
if filereadable(expand("~/.vimrc.arch"))
    source ~/.vimrc.arch
endif

" vimrc extensions specific to this user account
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
