""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" init.vim
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('s:loaded') != 0
    finish
else
    let s:loaded = 1
endif

let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')

command! -nargs=1 LoadScript exec 'source ' .  s:home . '/' . '<args>'

exec 'set rtp+=' . s:home

set rtp+=~/.vim

LoadScript init/basic.vim
LoadScript init/plugins.vim
LoadScript init/keymaps.vim
