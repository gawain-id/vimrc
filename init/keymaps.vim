""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" keymaps.vim
"
" @author gawain
" @version 0.1
" @last 2021/4/26 16:16:15
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: set ts=4 sw=4 tw=78 et :

"=============================================================================="
" Leader键
"=============================================================================="

let g:mapleader = ","
let localmapleader = "\<Space>"
"let g:window_leader = 's'

"=============================================================================="
" 文件
"=============================================================================="

" 保存
nnoremap <Leader>fs :w<CR>
nnoremap <Leader>fw :w !sudo tee % >/dev/null<CR>

" 重新加载配置文件
nnoremap <silent> <Leader>sv :source $MYVIMRC<CR>

" 当前目录快速切换
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

"=============================================================================="
" 缓冲区切换
"=============================================================================="

noremap <silent> <Leader>bn :bn<CR>
noremap <silent> <Leader>bp :bp<CR>

"=============================================================================="
" 窗口切换 SPACE + 数字, SPACE + w + r/R 切换, SPACE + w + hljk 移动(正常 + 插入)
"=============================================================================="

noremap <silent> <Space>1 <C-W>1w
noremap <silent> <Space>2 <C-W>2w
noremap <silent> <Space>3 <C-W>3w
noremap <silent> <Space>4 <C-W>4w
noremap <silent> <Space>5 <C-W>5w
noremap <silent> <Space>6 <C-W>6w
noremap <silent> <Space>7 <C-W>7w
noremap <silent> <Space>8 <C-W>8w
noremap <silent> <Space>9 <C-W>9w

noremap <silent> <Space>wr <C-W>w
noremap <silent> <Space>wR <C-W>W

noremap <silent> <Space>wh <C-W>h
noremap <silent> <Space>wl <C-W>l
noremap <silent> <Space>wj <C-W>j
noremap <silent> <Space>wk <C-W>k
inoremap <silent> <Space>wh <Esc><C-W>h<CR>
inoremap <silent> <Space>wl <Esc><C-W>l<CR>
inoremap <silent> <Space>wj <Esc><C-W>j<CR>
inoremap <silent> <Space>wk <Esc><C-W>k<CR>

"=============================================================================="
" 标签页管理: 创建, 关闭, 上一个, 下一个, 左移, 右移, 关闭其它所有
" 标签页切换: <Leader> + 数字键, ALT + 数字键, gr 循环切换
"=============================================================================="

" 新建标签页
noremap <silent> <Leader>t :tabnew<CR>

" 跳至下一个/前一个 Tab
noremap <silent> <Leader>wo gt
noremap <silent> <Leader>wO gT

" 智能关闭窗口,  标签页
noremap <silent> <Leader>wq :<C-W>q<CR>

"左移 Tab
function! Tab_MoveLeft()
    let l:tabnr = tabpagenr() - 2
    if l:tabnr >= 0
        exec 'tabmove '.l:tabnr
    endif
endfunction

" 右移 Tab
function! Tab_MoveRight()
    let l:tabnr = tabpagenr() + 1
    if l:tabnr <= tabpagenr("$")
        exec 'tabmove '.l:tabnr
    endif
endfunction

"  标签页移动
noremap <silent> <Leader>tl :call Tab_MoveLeft()<CR>
noremap <silent> <Leader>tr :call Tab_MoveRight()<CR>
noremap <silent> <M-Left> :call Tab_MoveLeft()<CR>
noremap <silent> <M-Right> :call Tab_MoveRight()<CR>

" <Leader> + 数字键
noremap <silent> <Leader>1 1gt<CR>
noremap <silent> <Leader>2 2gt<CR>
noremap <silent> <Leader>3 3gt<CR>
noremap <silent> <Leader>4 4gt<CR>
noremap <silent> <Leader>5 5gt<CR>
noremap <silent> <Leader>6 6gt<CR>
noremap <silent> <Leader>7 7gt<CR>
noremap <silent> <Leader>8 8gt<CR>
noremap <silent> <Leader>9 9gt<CR>

" ALT + 数字键
noremap <silent> <M-1> :tabn 1<CR>
noremap <silent> <M-2> :tabn 2<CR>
noremap <silent> <M-3> :tabn 3<CR>
noremap <silent> <M-4> :tabn 4<CR>
noremap <silent> <M-5> :tabn 5<CR>
noremap <silent> <M-6> :tabn 6<CR>
noremap <silent> <M-7> :tabn 7<CR>
noremap <silent> <M-8> :tabn 8<CR>
noremap <silent> <M-9> :tabn 9<CR>

inoremap <silent> <M-1> <Esc>:tabn 1<CR>
inoremap <silent> <M-2> <Esc>:tabn 2<CR>
inoremap <silent> <M-3> <Esc>:tabn 3<CR>
inoremap <silent> <M-4> <Esc>:tabn 4<CR>
inoremap <silent> <M-5> <Esc>:tabn 5<CR>
inoremap <silent> <M-6> <Esc>:tabn 6<CR>
inoremap <silent> <M-7> <Esc>:tabn 7<CR>
inoremap <silent> <M-8> <Esc>:tabn 8<CR>
inoremap <silent> <M-9> <Esc>:tabn 9<CR>

" MacVim 允许 CMD + 数字键快速切换标签
if has("gui_macvim")
    set macmeta
    noremap <silent> <D-1> :tabn 1<CR>
    noremap <silent> <D-2> :tabn 2<CR>
    noremap <silent> <D-3> :tabn 3<CR>
    noremap <silent> <D-4> :tabn 4<CR>
    noremap <silent> <D-5> :tabn 5<CR>
    noremap <silent> <D-6> :tabn 6<CR>
    noremap <silent> <D-7> :tabn 7<CR>
    noremap <silent> <D-8> :tabn 8<CR>
    noremap <silent> <D-9> :tabn 9<CR>

    inoremap <silent> <D-1> :tabn 1<CR>
    inoremap <silent> <D-2> :tabn 2<CR>
    inoremap <silent> <D-3> :tabn 3<CR>
    inoremap <silent> <D-4> :tabn 4<CR>
    inoremap <silent> <D-5> :tabn 5<CR>
    inoremap <silent> <D-6> :tabn 6<CR>
    inoremap <silent> <D-7> :tabn 7<CR>
    inoremap <silent> <D-8> :tabn 8<CR>
    inoremap <silent> <D-9> :tabn 9<CR>
endif

"=============================================================================="
" 折叠级别快速设置
"=============================================================================="

noremap <silent> <Leader>f0 :set foldlevel=0<CR>
noremap <silent> <Leader>f1 :set foldlevel=1<CR>
noremap <silent> <Leader>f2 :set foldlevel=2<CR>
noremap <silent> <Leader>f3 :set foldlevel=3<CR>
noremap <silent> <Leader>f4 :set foldlevel=4<CR>
noremap <silent> <Leader>f5 :set foldlevel=5<CR>
noremap <silent> <Leader>f6 :set foldlevel=6<CR>
noremap <silent> <Leader>f7 :set foldlevel=7<CR>
noremap <silent> <Leader>f8 :set foldlevel=8<CR>
noremap <silent> <Leader>f9 :set foldlevel=9<CR>

"=============================================================================="
" 功能切换
"=============================================================================="

" 重做
noremap U :redo<CR>

" 可视模式 重复动作
vnoremap . :normal .<CR>

"  隐藏字符显示
nmap <silent> <Leader>tl :set list!<CR>:set list?<CR>

" 搜索区分大小写
nmap <silent> <Leader>si :set ic!<CR>:set ic?<CR>

" 清除搜索高亮
nmap <silent> <Leader><Space> :set hls!<CR>
nmap <silent> <Leader>sc :set hls!<CR>

" 行号切换
nmap <silent> <Leader>tn :set nu!<CR>
nmap <silent> <Leader>trn :set rnu!<CR>

" Paste 切换
nmap <Leader>tp <Esc>:set paste!<CR>:set paste?<CR>

" 背景切换
nmap <silent> <Leader>tb :call ToggleBackground()<CR>

" 全屏切换
nmap <silent> <Leader>TF :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

"=============================================================================="
" 功能函数
"=============================================================================="

" 背景切换
function ToggleBackground()
    if &background == "dark"
        set background=light
    else
        set background=dark
    endif
endfunction

