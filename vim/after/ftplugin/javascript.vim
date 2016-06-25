setlocal makeprg=jslint\ %
setlocal ts=2 sts=2 sw=2

" Configure syntastic to use ESLint
" https://jaxbot.me/articles/setting-up-vim-for-react-js-jsx-02-03-2015
let g:syntastic_javascript_checkers = ['eslint']
