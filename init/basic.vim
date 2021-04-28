""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" @file basic.vim
" 
" @author gawain
" @version 0.1
" @last 2021/4/26 23:14:07
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: set ts=4 sw=4 tw=78 et :

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
" 通用设置
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

set nocompatible                                " 禁用 VI 兼容模式

let g:is_windows= has("win32") || has("win64")
let g:is_linux = has("linux") && !has("unix") && !has("macunix") && !has("win32unix")
let g:is_osx=has("mac") || has("macunix")

                                                " 操作系统类型.
if has("autocmd")
    "filetype plugin indent on                   " 开启文件类型检测，包括自动缩进及设置.
endif

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
" 文件
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

if has("multi_byte")                            " 编码设置.
    set encoding=utf-8                          " 内部工作编码.
    scriptencoding utf-8                        " Vim 脚本编码.
    set fileencoding=utf-8                      " 文件默认编码.
    set fileencodings=usc-bom,utf-8,
        \gbk,gb18030,big5,euc-jp,euc-kr,latin1
                                                " 打开文件时自动尝试下面顺序的编码.
endif
set fileformats=unix,dos,mac                    " 文件 <EOL> 的格式, 默认使用 unix 换行符.

set autoread                                    " 有 Vim 之外的改动时自动重读文件.
set autowrite                                   " 有改动时自动写回文件.
set autowriteall                                " 有改动时自动写回所有文件.
set autochdir                                   " 根据当前窗口的文件切换目录.
set confirm                                     " 询问如何处理未保存/只读的文件.

set backup                                      " 允许备份.
set writebackup                                 " 保存时备份.
set backupext=.bak                              " 备份文件扩展名.
set noswapfile                                  " 禁用交换文件.

if has("persistent_undo")                       " undo 设置.
    set undofile                                " 把撤销信息写入一个文件里.
    set undolevels=1000                         " 最多可以撤销的改变个数.
    set undoreload=10000                        " 保存缓冲区重载撤销的最大行数.
endif

set backupdir=~/.vim/.bak//                     "备份文件目录.
set directory=~/.vim/.swp//                     " 交换文件目录.
set undodir=~/.vim/.undo//                      " 撤销信息文件目录.

set history=1000                                " 记住的命令行的行数.
set report=0                                    " 始终报告已更改的行数.
set viminfo='1000,f1,<500                       " viminfo 文件选项.
set viewoptions+=curdir,folds,options,cursor,unix,slash
                                                " 保存和恢复的内容.

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
" 用户界面
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

let $LANG = "en"                                " 默认语言.
set langmenu=en_US.UTF-8                        " 菜单使用的语言.
source $VIMRUNTIME/delmenu.vim                  " 删除菜单.
source $VIMRUNTIME/menu.vim                     " 重新转入菜单, 避免中文Windows OS中出现乱码.
set helplang=cn                                 " 帮助文档语言.

" GUI 字体设置
if has("gui_running")
    if g:is_linux
set guifont=Hack\ Regular\ 11,Consolas\ Regular\ 12,Courier\ New\ Regular\ 14
    elseif g:is_osx
        set guifont=Hack\ Regular:h11,Consolas\ Regular:h12,Courier\ New\ Regular:h14
    elseif g:is_windows
        set guifont=Hack:h10.5,Consolas:h10,Courier_New:h10
    endif
endif

" GUI 界面
if has("gui_running")
    set guicursor=a:block-blinkon0              " 禁止光标闪烁.
    set guioptions-=m                           " 禁用菜单栏.
    set guioptions-=T                           " 禁用工具栏.
    set guioptions-=l                           " 禁用左边的滚动条.
    set guioptions-=L                           " 禁用垂直分割窗口左边的滚动条.
    set guioptions-=r                           " 禁用右边的滚动条.
    set guioptions-=R                           " 禁用垂直分割窗口右边的滚动条.
    set guioptions-=                            " 禁用底部滚动条.
    set guioptions-=e                           " 启动GUI标签页.
    "set showtabline=0                          " 禁用标签页.
    "set guitablabel=%N/\ %t\ %M                " GUI 标签页行使用的标签的文体.
    set t_Co=256                                " 启用终端256色支持.
endif

" 开启语法高亮
if has("syntax")
    syntax on
endif

" 在Gnome终端中启用256色调色板
if $COLORTERM == "gnome-terminal"
    set t_Co=256
endif

set background=dark                             " 设置默认背景色.
colorscheme desert                              " 设置配色方案.

" 鼠标
set mouse=a                                     " 启用鼠标.
set mousehide                                   " 输入时隐藏鼠标指针.
set selection=exclusive                         " 选择时允许光标越界.
set selectmode=mouse,key                        " 启用鼠标选择.
"set selectmode=key                             " 只启用键盘选择.
"set mouse=                                     " 禁用鼠标.

" 剪贴板
if has("clipboard")
    if has("unnamedplus")
        set clipboard=unnamed,unnamedplus
    else
        set clipboard=unnamed
    endif
endif

" 按键设置
set backspace=indent,eol,start                  " 设置 Backspace 键模式.
set keymodel=startsel,stopsel                   " 允许用键击开始/停止选择.
set scrolljump=5                                " 滚动所需的最少行数.
set scrolloff=3                                 " 光标上下的最少行数.
set timeout                                     " 映射等待超时.
set ttimeoutlen=50                              " 设置<ESC>键响应时间.

" 行号
set number                                      " 显示行号.
set relativenumber                              " 显示相对行号.
"set signcolumn=yes                              " 总是显示标号列(用于显示 mark/gitdiff/诊断信息).

" 高亮显示
set showmatch                                   " 显示匹配的括号.
set matchtime=2                                 " 显示括号匹配的时间.
set cursorline                                  " 高亮光标所在屏幕行.

"highlight clear SignColumn                      " 清除列高亮.
"highlight clear LineNr                         " 清除行号高亮.
"highlight clear CursorLineNr                   " 清除光标所在行高亮.

" 错误提示
set errorbells                                  " 有错误信息时响铃.
set visualbell                                  " 使用可视铃声而不是响铃.

" 缓冲区 & 标签 & 窗口
set hidden                                      " 允许隐藏未保存的缓冲区.
set tabpagemax=15                               " 设置Tabpage最大数量.
set showtabline=2                               " 显示 Tabpage 标签页.

set title                                       " 让 Vim 设置窗口标题.
set splitright                                  " 新窗口在当前窗口之右.
set splitbelow                                  " 分割窗口时新窗口在当前窗口之下.

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
" 格式设置
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

set textwidth=120                               " 插入文本的最大宽度.
set winminheight=0                              " 任何窗口的最少行数.
set scrolloff=3                                 " 光标上下两侧最少保留的屏幕行数
set sidescrolloff=3                             " 光标左右两侧保留的最少屏幕列数.
set virtualedit=block,onemore                   " 允许光标出现在最后一个字符后面.

set nolist                                      " 不显示 <Tab> 和 <EOL>.
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.  " list 模式下显示用的字符.
set display+=lastline                           " 始终尝试显示段落的最后一行.

" 行格式
set nowrap                                      " 关闭自动换行.
set wrapmargin=1                                " 折行边距.

set linebreak                                   " 避免在单词中间换行.
set showbreak=+++                               " 折行后的连字符.

set formatoptions+=j                            " 连接行时删除注释前导符.
set formatoptions+=m                            " 可以在任何值高于 255 的多字节字符上分行.
set formatoptions+=B                            " 在连接行时，不要在两个多字节字符之间插入空格.
set nojoinspaces                                " 关闭 连接命令在句号之后加两个空格.

" 缩进
set autoindent                                  " 自动缩进, 根据上一行决定新行的缩进.
set smartindent                                 " 开启新行时使用智能自动缩进.
set copyindent                                  " 自动缩进新行时，复制已有的行的缩进结构.
set cindent                                     " 打开 C/C++ 语言缩进优化.
set nostartofline                               " 关闭命令移动光标到行的首个非空白处.

" 制表符和空格
set smarttab                                    " 插入 <Tab> 时使用 "shiftwidth".
set tabstop=4                                   " 编辑时 <Tab> 使用的空格数.
set expandtab                                   " 键入 <Tab> 时使用空格.
set softtabstop=4                               " 编辑时 <Tab> 使用的空格数.
set shiftwidth=4                                " (自动) 缩进使用的步进单位，以空白数目计.
set noshiftround                                " 关闭缩进取整.

" 代码折叠
set nofoldenable                                " 允许代码折叠.
set foldmarker={,}                              " 折叠标志.
set foldlevel=0                                 " 设置折叠级别: 高于此级别的折叠会被关闭.
set foldmethod=marker                           " 当前窗口使用的折叠方式.
set foldnestmax=-1                              " 设置 "indent" 和 "syntax" 方法的最大折叠嵌套层数.
set foldcolumn=1                                " 设定指示折叠的列宽度.

" 搜索
set hlsearch                                    " 高亮搜索内容.
set incsearch                                   " 查找输入时动态增量显示查找结果.
set ignorecase                                  " 搜索时忽略大小写.
set smartcase                                   " 智能搜索大小写判断, 默认忽略大小写, 除非搜索内容包含大写字母.
"set gdefault                                   " 全局替换.
"set nowrapscan                                 " 禁止搜索在文件尾折回文件头.
set magic                                       " 转义搜索模式所用的特殊字符.
set regexpengine=1                              " 使用旧的正则表达式引擎 .

" 状态栏
set laststatus=2                                " 总是显示状态行.
                                                " 状态栏的定制格式.
set statusline=%<%f\                            " 文件名.
set statusline+=%w%h%m%r                        " 选项.
set statusline+=\ [%{&ff}/%Y]                   " 文件类型.
set statusline+=\ [%{getcwd()}]                 " 当前目录.
set statusline+=%=%-14.(%l,%c%V%)\ %p%%         " 导航信息靠右对齐.

set ruler                                       " 显示标尺.
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
                                                " 标尺格式.
" 命令行
set cmdheight=1                                 " 命令行使用的行数.
set showcmd                                     " 在状态行里显示 (部分) 命令.
set showmode                                    " 在状态行上显示当前模式的消息.

" 命令行自动补全菜单
set wildmenu                                    " 命令行自动补全所使用的菜单.
set wildmode=list,longest,full                  " 指定的字符所用的补全模式.

set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class
                                                " 文件搜索和补全时忽略下面扩展名.
set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz
set wildignore+=*DS_Store*,*.ipch
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
set wildignore+=*/.nx/**,*.app,*.git,.git
set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android
                                                " 匹配这些模式的文件不会参与自动补全.
" 字符相关
set whichwrap=b,s,h,l,<,>,[,]                   " 跨行移动光标.
set iskeyword-=.,#,-,_$,@,%                     " 指定哪些字母可以出现在一个单词.
set nrformats-=octal                            " 递增或递减数字时，0开头为八进制，否则为十进制.
set nrformats+=alpha                            " 递增或递减字母.

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
" 拼写设置
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

set nospell                                     " 打开拼写检查.
set spelllang=en_us                             " 拼写检查使用的语言.

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
" 其它配置
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

set complete-=i                                 " 指定插入模式的自动补全如何工作.
set completeopt=longest,preview,menu            " 插入模式补全使用的选项.

set nomodeline                                  " 忽略文件的模式行.
set cryptmethod=blowfish2                       " 文件写入时所用的加密方式.

set winaltkeys=no                               " Windows 禁用 ALT 操作菜单 (使得 ALT 可以用到 Vim 里).

set ttyfast                                     " 使用快速终端连接.
set lazyredraw                                  " 延时绘制(提升性能).
set redrawtime=10000                            " 延时绘制时间.
set shortmess+=filmnrxoOtT                      " 文件信息显示选项.

set errorformat+=[%f:%l]\ ->\ %m,[%f:%l]:%m     " 错误文件行格式的描述.
set tags=./.tags;,.tags                         " 标签命令使用的文件名列表.

