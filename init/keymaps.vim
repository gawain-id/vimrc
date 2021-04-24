""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" keymaps.vim
"
" @author gawain
" @version 0.1
" @last 2021/4/16 17:42:00
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: set ts=4 sw=4 tw=78 et :

"=============================================================================="
" Leader键
"=============================================================================="

let g:mapleader = ","
let localmapleader = "\<Space>"
let g:window_leader = 's'

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
" 窗口切换 SPACE + 数字, CTRL + 方向键, SHIFT + TAB
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

noremap <S-Tab> <C-W>W

noremap <Space>wh <C-W>h
noremap <Space>wl <C-W>l
noremap <Space>wj <C-W>j
noremap <Space>wk <C-W>k

inoremap <Space>wh <Esc><C-W>h
inoremap <Space>wl <Esc><C-W>l
inoremap <Space>wj <Esc><C-W>j
inoremap <Space>wk <Esc><C-W>k

"=============================================================================="
" 标签页管理: 创建, 关闭, 上一个, 下一个, 左移, 右移, 关闭其它所有
" 标签页切换: <Leader> + 数字键, ALT + 数字键, gr 循环切换
"=============================================================================="

noremap <silent> <Leader>tt :tabnew<CR>
noremap <silent> <Leader>tc :tabclose<CR>
noremap <silent> <Leader>tn :tabnext<CR>
noremap <silent> <Leader>tp :tabprev<CR>
noremap <silent> <Leader>to :tabonly<CR>

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

noremap <silent><Leader>tl :call Tab_MoveLeft()<CR>
noremap <silent><Leader>tr :call Tab_MoveRight()<CR>
noremap <M-Left> :call Tab_MoveLeft()<CR>
noremap <M-Right> :call Tab_MoveRight()<CR>

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

" 跳至前一个 Tab，常用于两个 Tab 来回切换
noremap gr gt

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

" 可视模式 重复动作
vnoremap . :normal .<CR>

" 清除搜索高亮
nmap <silent> <Leader><Space> :set hlsearch!<CR>
nmap <silent> <Leader>sc :set hlsearch!<CR>

" 行号切换
map <silent> <Leader>tn :set number!<CR>
map <silent> <Leader>trn :set relativenumber!<CR>

" Paste 切换
map <Leader>tp :set paste!<CR>:set paste?<CR>
imap <Leader>tp <C-O>:set paste!<CR>
set pastetoggle=<Leader>tp

" 背景切换
map <silent> <Leader>tb :call ToggleBackground()<CR>

" 全屏切换
map <silent> <Leader>TF :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

"=============================================================================="
" 功能函数
"=============================================================================="

" 背景切换
if exists("ToggleBackground") == 0
    function ToggleBackground()
        if &background == "dark"
            set background=light
        else
            set background=dark
        endif
    endfunction
endif

