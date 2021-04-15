""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" keymaps.vim
"
" @author gawain
" @version 0.1
" @last 2021/04/14 19:23:00
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: set ts=4 sw=4 tw=78 et :

"=============================================================================="
" Leader键
"=============================================================================="

let mapleader = ','

"=============================================================================="
" 编辑、加载 Vim 配置文件
"=============================================================================="

nnoremap <Leader>ev :vsp $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

" 保存
nnoremap <Leader>s :w<CR>
inoremap <Leader>s <Esc>:w<CR>

" 退出
noremap <Leader>q :q<CR>

" 超级用户权限编辑
cmap sw w !sudo tee >/dev/null %

" jk 绑定为 <Esc> 键
inoremap jk <Esc>

" <sapce> 进入命令模式
noremap <Space> :

" 快速切换到行首行尾
noremap H ^
noremap L $

" 行切换
nnoremap k gk
nnoremap j gj

" 大小写转换
nnoremap gu gU
nnoremap gl gu

" INSERT 模式下使用 Emacs 键位
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-d> <Del>
inoremap <C-_> <C-k>

" 命令行使用 Emacs 风格按键
:cnoremap <C-A>	<Home>
:cnoremap <C-B>	<Left>
:cnoremap <C-D>	<Del>
:cnoremap <C-E>	<End>
:cnoremap <C-F>	<Right>
:cnoremap <C-N>	<Down>
:cnoremap <C-P>	<Up>
:cnoremap <Esc><C-B> <S-Left>
:cnoremap <Esc><C-F> <S-Right>

" 设置 CTRL + HJKL 移动光标

noremap <C-H> <Left>
noremap <C-J> <Down>
noremap <C-K> <Up>
noremap <C-L> <Right>

inoremap <C-H> <Left>
inoremap <C-J> <Down>
inoremap <C-K> <Up>
inoremap <C-L> <Right>

" 命令模式的快速移动
cnoremap <C-H> <Left>
cnoremap <C-J> <Down>
cnoremap <C-K> <Up>
cnoremap <C-L> <Right>

cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-F> <C-d>
cnoremap <C-B> <Left>
cnoremap <C-D> <Del>
cnoremap <C-_> <C-k>

" <Leader> + 数字键 切换Tab
noremap <silent> <Leader>1 1gt<CR>
noremap <silent> <Leader>2 2gt<CR>
noremap <silent> <Leader>3 3gt<CR>
noremap <silent> <Leader>4 4gt<CR>
noremap <silent> <Leader>5 5gt<CR>
noremap <silent> <Leader>6 6gt<CR>
noremap <silent> <Leader>7 7gt<CR>
noremap <silent> <Leader>8 8gt<CR>
noremap <silent> <Leader>9 9gt<CR>
noremap <silent> <Leader>0 10gt<CR>

" ALT + N 切换 Tab
noremap <silent> <M-1> :tabn 1<CR>
noremap <silent> <M-2> :tabn 2<CR>
noremap <silent> <M-3> :tabn 3<CR>
noremap <silent> <M-4> :tabn 4<CR>
noremap <silent> <M-5> :tabn 5<CR>
noremap <silent> <M-6> :tabn 6<CR>
noremap <silent> <M-7> :tabn 7<CR>
noremap <silent> <M-8> :tabn 8<CR>
noremap <silent> <M-9> :tabn 9<CR>
noremap <silent> <M-0> :tabn 10<CR>

inoremap <silent> <M-1> <Esc>:tabn 1<CR>
inoremap <silent> <M-2> <Esc>:tabn 2<CR>
inoremap <silent> <M-3> <Esc>:tabn 3<cr>
inoremap <silent> <M-4> <Esc>:tabn 4<CR>
inoremap <silent> <M-5> <Esc>:tabn 5<CR>
inoremap <silent> <M-6> <Esc>:tabn 6<CR>
inoremap <silent> <M-7> <Esc>:tabn 7<CR>
inoremap <silent> <M-8> <Esc>:tabn 8<CR>
inoremap <silent> <M-9> <Esc>:tabn 9<CR>
inoremap <silent> <M-0> <Esc>:tabn 10<CR>

" TAB：创建，关闭，上一个，下一个，左移，右移
noremap <silent> <Leader>tc :tabnew<CR>
noremap <silent> <Leader>tq :tabclose<CR>
noremap <silent> <Leader>tn :tabnext<CR>
noremap <silent> <Leader>tp :tabprev<CR>
noremap <silent> <Leader>to :tabonly<CR>

" 行号
nnoremap <F3> :set invnumber<CR>:set invrelativenumber<CR>

" Paste 模式切换
set pastetoggle=<F12>
nnoremap <F5> :grep <C-R><C-W> *<CR>
" Insert current dir
inoremap <C-F2> <C-R>=expand('%:p:h')<CR>

" 单引号 替代`
map ' `
nnoremap ; :

map <Enter> o<Esc>
map <S-Enter> O<Esc>

" 清除搜索高亮
noremap <silent><Esc> <Esc>:nohlsearch<CR><Esc>

" 消除两边的空白:
nnoremap <F2> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"" 十六进制编器
"" vim -b : edit binary using xxd-format!
"augroup Binary
"  au!
"  au BufReadPre  *.bin let &bin=1
"  au BufReadPost *.bin if &bin | %!xxd
"  au BufReadPost *.bin set ft=xxd | endif
"  au BufWritePre *.bin if &bin | %!xxd -r
"  au BufWritePre *.bin endif
"  au BufWritePost *.bin if &bin | %!xxd
"  au BufWritePost *.bin set nomod | endif
"augroup END
"
"" 背景色切换
"function! ToggleBG()
"    let s:tbg = &background
"    " Inversion
"    if s:tbg == 'dark'
"        set background=light
"    else
"        set background=dark
"    endif
"endfunction
"noremap <Leader>bg :call ToggleBG()<CR>

" ALT + h/l 快速左右按单词移动 (正常模式 + 插入模式)
noremap <M-H> b
noremap <M-L> w
inoremap <M-H> <C-Left>
inoremap <M-L> <C-Right>

" ALT+ j/k 逻辑跳转下一行/上一行 (按 wrap 逻辑换行进行跳转)
noremap <M-j> gj
noremap <M-k> gk
inoremap <M-j> <C-\><C-o>gj
inoremap <M-k> <C-\><C-o>gk

" 命令模式下的相同快捷键
cnoremap <M-H> <C-Left>
cnoremap <M-L> <C-Right>

" ALT + y 删除到行末
noremap <M-Y> d$
inoremap <M-Y> <C-\><C-o>d$

" 窗口切换 Alt + Shift + hjkl
nnoremap <M-H> <C-W>h
nnoremap <M-L> <C-W>l
nnoremap <M-J> <C-W>j
nnoremap <M-K> <C-W>k

inoremap <M-H> <Esc><C-W>h
inoremap <M-L> <Esc><C-W>l
inoremap <M-J> <Esc><C-W>j
inoremap <M-K> <Esc><C-W>k

" Shift + Direction to Change Tabs
noremap <S-L> gt
noremap <S-H> gT

" Control + Direction to Change Panes
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
