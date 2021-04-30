""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
" plugins.vim
" 
" @author gawain
" @version 0.1
" @last 2021/04/12 18:07
" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: set ts=4 sw=4 tw=78 et :

function! PlugInstalled(plug)
    return has_key(g:plugs, a:plug)
endfunction

call plug#begin('~/.vim/bundle')

" COLORSCHEMES PLUGINS {
    " 配色主题包
    Plug 'flazz/vim-colorschemes'

    "Plug 'altercation/vim-colors-solarized'
    "Plug 'chriskempson/base16-vim'
    "Plug 'joshdick/onedark.vim'
    "Plug 'morhetz/gruvbox'
    "Plug 'nanotech/jellybeans.vim'
    "Plug 'romainl/apprentice'
    "Plug 'tomasr/molokai'
" }

" Default {

    " 全文快速移动，<leader><leader>f{char} 即可触发
    Plug 'easymotion/vim-easymotion'

    " 文件浏览器，代替 netrw
    Plug 'justinmk/vim-dirvish'

    " 表格对齐，使用命令 Tabularize
    Plug 'godlygeek/tabular', { 'on': 'Tabularize' }

    " Diff 增强，支持 histogram / patience 等更科学的 diff 算法
    Plug 'chrisbra/vim-diff-enhanced'

" }

"----------------------------------------------------------------------
" Dirvish 设置：自动排序并隐藏文件，同时定位到相关文件
" 这个排序函数可以将目录排在前面，文件排在后面，并且按照字母顺序排序
" 比默认的纯按照字母排序更友好点。
"----------------------------------------------------------------------
function! s:setup_dirvish()
	if &buftype != 'nofile' && &filetype != 'dirvish'
		return
	endif
	if has('nvim')
		return
	endif
	" 取得光标所在行的文本（当前选中的文件名）
	let text = getline('.')
	if ! get(g:, 'dirvish_hide_visible', 0)
		exec 'silent keeppatterns g@\v[\/]\.[^\/]+[\/]?$@d _'
	endif
	" 排序文件名
	exec 'sort ,^.*[\/],'
	let name = '^' . escape(text, '.*[]~\') . '[/*|@=|\\*]\=\%($\|\s\+\)'
	" 定位到之前光标处的文件
	call search(name, 'wc')
	noremap <silent><buffer> ~ :Dirvish ~<cr>
	noremap <buffer> % :e %
endfunc

augroup MyPluginSetup
	autocmd!
	autocmd FileType dirvish call s:setup_dirvish()
augroup END

" BASE {
    " 展示开始页面, 显示最近编辑过的文件
    Plug 'mhinz/vim-startify'

    " 支持库，给其他插件用的函数库
	Plug 'xolox/vim-misc'

    " 标记/书签管理
	" 用于在侧边符号栏显示 marks （ma-mz 记录的位置）
    Plug 'kshenoy/vim-signature'

    " 用于在侧边符号栏显示 git/svn 的 diff
	Plug 'mhinz/vim-signify'

	" 根据 quickfix 中匹配到的错误信息，高亮对应文件的错误行
	" 使用 :RemoveErrorMarkers 命令或者 <space>ha 清除错误
	Plug 'mh21/errormarker.vim'

    " 使用 ALT+e 会在不同窗口/标签上显示 A/B/C 等编号，然后字母直接跳转
	Plug 't9md/vim-choosewin'

    " 提供基于 TAGS 的定义预览，函数参数预览，quickfix 预览
	Plug 'skywind3000/vim-preview'

    " GIT支持
    Plug 'tpope/vim-fugitive'

" }

" UI PLUGINS {

    " 上次的编辑位置
    Plug 'farmergreg/vim-lastplace'

    " 菜单 & 键绑定
    Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

    " 行号
    Plug 'myusuf3/numbers.vim'

    " 彩虹括号
    Plug 'kien/rainbow_parentheses.vim'

    " 代码缩进显示
    Plug 'Yggdroot/indentLine'

    " 状态栏
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " TMUX
    Plug 'christoomey/vim-tmux-navigator'

    " 增量搜索显示
    Plug 'haya14busa/incsearch.vim'

    " 表格对齐，使用命令 Tabularize
    Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
" }

" FILES PLUGINS {
    " 文件树型目录
    Plug 'preservim/nerdtree'

    " 编辑历史管理
    Plug 'mbbill/undotree'

    "if has('nvim')
        "  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
    "else
        "  Plug 'Shougo/defx.nvim'
        "  Plug 'roxma/nvim-yarp'
        "  Plug 'roxma/vim-hug-neovim-rpc'
    "endif

    " 模糊搜索
    Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

    "Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    " 文本搜索
    " LeaderF rg

    " 标签生成
    Plug 'ludovicchabant/vim-gutentags' 
    Plug 'skywind3000/gutentags_plus'

    " 标签导览
    Plug 'liuchengxu/vista.vim'

" }

" EDIT PLUGINS {
    " 重复执行支持的插件映射
    Plug 'tpope/vim-repeat'

    " 多光标
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}

    " 可视模式选择
    Plug 'terryma/vim-expand-region' 

    " 引号/括号快速操作
    Plug 'tpope/vim-surround'

    " 自动补全括号
    Plug 'jiangmiao/auto-pairs'

    "移动和跳转
    Plug 'easymotion/vim-easymotion'

    " 文本对齐
    Plug 'junegunn/vim-easy-align'

    " 文本对像
    Plug 'kana/vim-textobj-user'

    " 代码注释
    Plug 'preservim/nerdcommenter'

    " 格式化
    Plug 'sbdchd/neoformat'

" }

" DEVELOPMENT PLUGINS {
    " 语言服务器
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    "  语法检查
    Plug 'dense-analysis/ale'
    "Plug 'neomake/neomake'
    "Plug 'vim-syntastic/syntastic'

    " 代码补全框架
    " COC

    "if has('nvim')
    "    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    "else
    "    Plug 'Shougo/deoplete.nvim'
    "    Plug 'roxma/nvim-yarp'
    "    Plug 'roxma/vim-hug-neovim-rpc'
    "endif
    "let g:deoplete#enable_at_startup = 1
    " YCM 补全
    "Plug 'Valloric/YouCompleteMe'
    "Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}

    " 代码片段
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    " 异步运行窗口
    Plug 'skywind3000/asyncrun.vim' 

    " 支持多平台统一编码格式
    Plug 'editorconfig/editorconfig-vim'

    " 编程语言文档生成
    Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }

    " 语言扩展包
    Plug 'sheerun/vim-polyglot'

    " 测试
    Plug 'vim-test/vim-test'
"}

" TOOL PLUGINS {
    " MARKDOWN 文档
    Plug 'suan/vim-instant-markdown' 

    " 笔记
    Plug 'vimwiki/vimwiki'

    " VIM 帮助文档
    Plug 'yianwillis/vimcdoc' 
" }

" LANGUAGE {
    " c/cpp
    Plug 'octol/vim-cpp-enhanced-highlight'

    " HTML
    Plug 'mattn/emmet-vim'
" }

call plug#end()

" PLUGINS CONFIGURATION {
    if PlugInstalled("vim-colorschemes")
        syntax enable
        colorscheme solarized
        set background=dark
        "colorscheme molokai

        " 解决侧边栏显示空白问题
        hi! SignColumn ctermfg=14 guifg=#586e75 guibg=#073642
    endif
    
    if PlugInstalled("vim-airline")
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#show_buffers = 0
    
        "let g:airline#extensions#tabline#left_sep = ' '
        "let g:airline#extensions#tabline#left_alt_sep = '|'
        "let g:airline#extensions#tabline#formatter = 'default'
        "let g:airline#extensions#tabline#buffer_nr_show = 1
    endif
    
    if PlugInstalled("vim-airline-themes")
        "let g:airline_theme = 'solarized'
    endif
" }
