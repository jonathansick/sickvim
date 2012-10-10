" Error codes http://pypi.python.org/pypi/flake8
" W293 - blank line contains whitespace
" E701 - multiple statements on one line
" E128, E127 - Indent level of continuation levels
" E712 - comparisons to True
let g:syntastic_python_checker_args='--ignore=W293,E701,E128,E127,E712'
