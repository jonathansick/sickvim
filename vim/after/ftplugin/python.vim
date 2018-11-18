let python_highlight_all = 1 " Supposedly better python syntax

setlocal tabstop=4

" Error formats
setlocal efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

" Enable flake8 linting with Ale
let b:ale_linters = ['flake8']
