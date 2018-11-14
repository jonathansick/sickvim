let python_highlight_all = 1 " Supposedly better python syntax

setlocal tabstop=4

" Error formats
setlocal efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

let g:syntastic_python_checkers = ['flake8']
