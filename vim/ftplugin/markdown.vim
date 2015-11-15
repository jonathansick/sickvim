setlocal wrap linebreak nolist
setlocal spell

" Compile markdown into Marked
" http://support.markedapp.com/kb/how-to-tips-and-tricks/marked-bonus-pack-scripts-commands-and-bundles
:nnoremap <leader>marked :silent !open -a Marked.app '%:p'<cr>

