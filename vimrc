" => 关于(ABOUT) {{{1
"======================
" Author:
"   erjun
"   993911924@qq.com
"
"Last Chang:
"   2012-09-19->16:46:37

" => 系统(OS){{{1
"======================

" 设置环境变量
if has('win32') || has('win64')
    let $MYVIMRC = '$VIM/vimrc'
elseif has('unix')
    if $USER == 'root'
        let $MYVIMRC = '$VIM/vimrc'
    endif
endif

" 扩展文件名时使用正斜杠
if exists('+shellslash')
    set ssl
endif

" => 常规(General){{{1
"======================
" 设置vim必须保留的历史记录条数 
set history=500

"使用bundle插件和缩进
filetype plugin on 
filetype indent on 

" 当文件在外部修改而vim没有修改则重新载入
set autoread


" => 可视操作{{{1
"======================
"光标上下两侧最少保留的屏幕行数。
set so=9

"命令行补全以增强模式运行
set wildmenu 

"set wildignore=

"文件比较表达式
set diffexpr=MyDiff()

"缓冲区禁用鼠标
set mouse=
" => 文本 (TEXT){{{1
"======================
"用空格代替制表符"
set expandtab

"行首tab根据shiftwidth插入空白
set smarttab

"一个tab==4个空格
set tabstop=4
set shiftwidth=4

"选项卡设定
set showtabline=2 " always show tabs in gvim, but not vim
set guitablabel=%{GuiTabLabel()}

set guitabtooltip=%{GuiTabToolTip()}

set wrap "回绕超出窗口宽度的文本"

"set softtabstop=4
set autoindent 
set si

" 行号和标尺
set number
set ruler
set rulerformat=%15(%c%V\ %p%%%)
"set cuc "高亮当前列

" 定义标志折叠
set foldmethod=marker

" 输入要搜索的文字时,vim禁止时时匹配
set nois
set hls "模式高亮

" 标题
set titlestring=%F\ \ \ %{FileTime()}\ \ \ \ username\ :\ %{expand($username)}\ \ \ \pid\ :\ %{getpid()}
" 状态行
set ch=1
set stl=\ [File]\ %F%m%r%h%y[%{&fileformat},%{&fileencoding}]\ %w\ \ [PWD]\ %r%{GetPWD()}%h\ %=\ [Line]%l/%L\ %=\[%P]
set ls=2 " 始终显示状态行

" 插入模式下使用 <BS>、<Del> <C-W> <C-U>
set backspace=indent,eol,start

" 备份和缓存
set nobackup

set nowritebackup
set backupext=.bak "备份文件的扩展名
"set patchmode=.orig  "保存原始版本
"set backupdir=D:\bkup\vimbackupfile "设置自动备份路径

""""""""hahah
"缓冲区使用交换文件
set swapfile

" Diff 模式的时候鼠标同步滚动 for Vim7.3
if has('cursorbind')
    set cursorbind
end

set nomore "取消更多
set nocompatible "不要vim模仿vi模式

"_vimrc保存后，自动重载
autocmd! bufwritepost _vimrc source $vim/_vimrc
autocmd GUIEnter * simalt ~x

"失去焦点就自动保存  
"au FocusLost * silent! up 
au FocusLost * silent! up

"颜色打开
syntax on
"配色方案
colorscheme molokai
"光标
"highlight iCursor guifg=white guibg=green
"set guicursor+=i:ver50-iCursor


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 颜色和字体
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"==========
"图形界面
"==========

if has('gui_running')

    "隐藏工具栏
    "set guioptions-=T
    "隐藏菜单栏
    "set guioptions-=m

    " 高亮光标所在的行
    set cursorline

    if has("win32")
        "windows兼容配置
        source $VIMRUNTIME/mswin.vim 
        "字体(font)
        "exe 'set guifont='.iconv('Consolas', &enc, 'gbk').':h12:i:cANSI'
        exe 'set guifont='.iconv('Envy_Code_R', &enc, 'gbk').':h12:cDEFAULT'
        set gfw=幼圆:h11:cGB2312
    endif
endif

"=================================================================
" => 自动命令 (AUTO){{{1
"======================
" 自动改变当前目录
if has('netbeans_intg')
    set autochdir
endif
"au FileType html,css,javascript :call AutoClose()

"设置字典 
let g:dict_dir="set dictionary+=$vim/vimfiles/dict/"
au FileType css,html,htm,php,less exe dict_dir."css.dict"
au FileType css,html,htm,php,less exe dict_dir."css3.dict"

"退出vim的时候保存session
au VimLeave * call SaveSess()
"打开vim的时候载入session
"au VimEnter * call RestoreSess()

"单词翻译
"nmap <silent><leader>e :!curl dict://dict.org/d:<cword><CR><CR>

au FileType javascript call JavascriptAuto()
au FileType css call CssAuto()
au FileType html call HtmlAuto()
au FileType python call PythonAuto()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 键盘映射 (MAP){{{1
"======================
" 设置按键映射组合头,缺省为 \
let mapleader=","
let g:mapleader = ","

" 快速保存 
nmap <leader>w :w!<cr>

" 折叠标志
let @a="{{{"
map <leader>{ $"apa

"插入模式按 F4 插入当前时间
imap <f4> <C-r>=GetDateStamp()<cr>

"netrw setting 文件浏览器设置(打开目录)
nmap <leader>d :Sexplore!<cr>
"让当前目录和我的浏览同步
let g:netrw_keepdir= 0

"打开自动保存的session
map <leader>rr :call RestoreSess()<cr>

" 切换显示行号：相对行号 / 绝对行号
nnoremap <leader>wn :call Lilydjwg_toggle_number()<CR>

"用火狐打开链接
nmap <leader>tf :call Lilydjwg_open_url()<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 编码(CODING){{{1
"======================
if has("win32")
    "set fileencoding=utf-8
    set fileencoding=chinese
else
    set fileencoding=utf-8
endif
"let &termencoding = &encoding
set encoding=utf-8
set termencoding=cp936

"语言(LANG){{{2
"信息
language messages en_US.utf-8
"language messages zh_CN.utf-8
set helplang=cn
"菜单
"source $VIMRUNTIME/delmenu.vim
set fencs=utf-8,gbk,chinese,latin1,gb2312 "解决gb2312编码乱码
set ff=dos

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 插件设置 (PLUGIN){{{1
"======================
" ===自带插件 ===
" python
autocmd FileType python set omnifunc=pythoncomplete#Complete

if $USER == 'root'
else
    " === Vundle ====
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    " let Vundle manage Vundle
    Bundle 'gmarik/vundle'
    " common
        " indent-guides
    Bundle 'nathanaelkane/vim-indent-guides'
        " comment
    Bundle 'scrooloose/nerdcommenter'
        " Easy color scheme browsing 
    Bundle 'sjas/csExplorer'
        " outline 
    Bundle 'VOoM'
        " vimwiki
    Bundle 'vimwiki'
        " beautify html,css,javascript,json files 
    Bundle 'michalliu/sourcebeautify.vim'
        " Snippet
    Bundle 'msanders/snipmate.vim'
        " AutoComplPop
    Bundle 'AutoComplPop'
        " colorscheme
    Bundle 'molokai'
    " front-end web developer
    Bundle 'mattn/zencoding-vim' 
    " python
        "code check
    Bundle 'kevinw/pyflakes-vim'
    " c
    "lisp
    Bundle 'slimv.vim'
endif

"对齐线 宽度1
let g:indent_guides_guide_size=1

"viki
let g:vimwiki_list = [{'path': 'D:/Dropbox/vimwiki/',
\ 'path_html': 'D:/Dropbox/html/',
\ 'html_header': 'D:/Dropbox/template/header.tpl',}]
let g:vimwiki_use_mouse = 1
" 是否开启按语法折叠  会让文件比较慢
"let g:vimwiki_folding = 1
" 是否在计算字串长度时用特别考虑中文字符
let g:vimwiki_CJK_length = 1

nnoremap <leader>ot :TlistToggle<CR>
let Tlist_Use_Right_Window=1
set tags=D://


" => 函数 (FUNCTION){{{1
"======================
"{{{2 => => 获取当前目录
fu! GetPWD()
    return substitute(getcwd(), "", "", "g")
endf

"{{{2 => => 文件上次修改日期
fu! FileTime()
    let ext=tolower(expand("%:e"))
    let fname=tolower(expand('%<'))
    let filename=fname . '.' . ext
    let msg=""
    let msg=msg." ".strftime("(Modified %b,%d %y %H:%M:%S)",getftime(filename))
    return msg
endf
fu! CurTime()
    let ftime=""
    let ftime=ftime." ".strftime("%b,%d %y %H:%M:%S")
    return ftime
endf

" 跳过页头注释，到首行实际代码{{{2
fu! GotoFirstEffectiveLine()
    let l:c = 0
    while l:c<line("$") && (
                \ getline(l:c) =~ '^\s*$'
                \ || synIDattr(synID(l:c, 1, 0), "name") =~ ".*Comment.*"
                \ || synIDattr(synID(l:c, 1, 0), "name") =~ ".*PreProc$"
                \ )
        let l:c = l:c+1
    endwhile
    exe "normal ".l:c."Gz\<CR>"
endf

" 返回当前时期{{{2
fu! GetDateStamp()
    return strftime('%Y-%m-%d->%X')
endf

fu! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
    return "\<Right>"
    else
    return a:char
    endif
endf

"括号自动补全{{{2
fu! AutoClose()
    :inoremap ( ()<ESC>i
    :inoremap " ""<ESC>i
    :inoremap ' ''<ESC>i
    :inoremap ) <c-r>=ClosePair(')')<CR>
    :inoremap { {}<ESC>i
    :inoremap } <c-r>=ClosePair('}')<CR>
    :inoremap [ []<ESC>i
    :inoremap ] <c-r>=ClosePair(']')<CR>
    :inoremap < <><ESC>i
    :inoremap > <c-r>=ClosePair('>')<CR>
endf

"计算文件两个不同版本的 ed 风格{{{2
fu! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent exe '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endf

"创建删除会话和info{{{2
"创建会话和info{{{3
fu! SaveSess()
	set sessionoptions-=curdir "恢复当前目录
	set sessionoptions+=sesdir "设置当前目录为会话文件所在的位置
	set sessionoptions+=winpos "GUI VIM 窗口位置
	set sessionoptions+=resize "恢复屏幕大小
	set sessionoptions+=buffers "恢复所有缓冲区
	set sessionoptions+=slash
	set sessionoptions+=unix
    set sessionoptions+=options "全局映射和选项
    "创建会话文件
    exe 'mksession! $HOME/session.vim'
    exe 'wviminfo! $HOME/viminfo'
endf

"恢复会话和info{{{3
fu! RestoreSess()
	exe 'source $HOME/session.vim'
	exe 'rviminfo $HOME/viminfo'
endf

" 选项卡{{{2
" set up tab labels with tab number, buffer name, number of windows{{{3
fu! GuiTabLabel()
  let label = ''
  let bufnrlist = tabpagebuflist(v:lnum)
  " Add '+' if one of the buffers in the tab page is modified
  for bufnr in bufnrlist
    if getbufvar(bufnr, "&modified")
      let label = '+'
      break
    endif
  endfor
  " Append the tab number
  let label .= v:lnum.': '
  " Append the buffer name
  let name = bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
  if name == ''
    " give a name to no-name documents
    if &buftype=='quickfix'
      let name = '[Quickfix List]'
    else
      let name = '[No Name]'
    endif
  else
    " get only the file name
    let name = fnamemodify(name,":t")
  endif
  let label .= name
  " Append the number of windows in the tab page
  let wincount = tabpagewinnr(v:lnum, '$')
  return label . '  [' . wincount . ']'
endf

" set up tab tooltips with every buffer name{{{3
fu! GuiTabToolTip()
  let tip = ''
  let bufnrlist = tabpagebuflist(v:lnum)
  for bufnr in bufnrlist
    " separate buffer entries
    if tip!=''
      let tip .= " \n "
    endif
    " Add name of buffer
    let name=bufname(bufnr)
    if name == ''
      " give a name to no name documents
      if getbufvar(bufnr,'&buftype')=='quickfix'
        let name = '[Quickfix List]'
      else
        let name = '[No Name]'
      endif
    endif
    let tip.=name
    " add modified/modifiable flags
    if getbufvar(bufnr, "&modified")
      let tip .= ' [+]'
    endif
    if getbufvar(bufnr, "&modifiable")==0
      let tip .= ' [-]'
    endif
  endfor
  return tip
endf

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  切换显示行号：相对行号 / 绝对行号 {{{2
fu! Lilydjwg_toggle_number()
  if &nu
    setl rnu
  else
    setl nu
  endif
endf
" javascript Auto {{{2
fu! JavascriptAuto()
    set omnifunc=javascriptcomplete#CompleteJS
    exe g:dict_dir."javascript.dict"
    exe g:dict_dir."jquery.dict"
    iab us "use strict"
endf
fu! CssAuto()
    set omnifunc=csscomplete#CompleteCSS
endf
" html Auto {{{2
fu! HtmlAuto()
    call TagChecker()
    exe g:dict_dir."html5.dict"
endf
" python auto {{{2
fu! PythonAuto()
    set omnifunc=pythoncomplete#Complete
endf
"{{{2 => => 用火狐打开链接{{{2
fu! Lilydjwg_open_url()
  let s:url = Lilydjwg_get_pattern_at_cursor('\v(https?://|ftp://|file:/{3}|www\.)(\w|[.-])+(:\d+)?(/(\w|[~@#$%^&+=/.?:-])+)?')
  if s:url == ""
    echohl WarningMsg
    echomsg '在光标处未发现URL！'
    echohl None
  else
    echo '打开URL：' . s:url
    if has("win32") || has("win64")
      " start 不是程序，所以无效。并且，cmd 只能使用双引号
      " call system("start '" . s:url . "'")
      call system("cmd /q /c start \"" . s:url . "\"")
    elseif has("mac")
      call system("open '" . s:url . "'")
    else
      " call system("gnome-open " . s:url)
      call system("setsid firefox '" . s:url . "' &")
    endif
  endif
  unlet s:url
endf
"{{{2 => => 补全
fun! CompleteMonths(findstart, base)
  if a:findstart
    " 定位单词的开始处
    let line = getline('.')
    let start = col('.') - 1
    while start > 0 && line[start - 1] =~ '\a'
      let start -= 1
    endwhile
    return start
  else
    " 寻找匹配 a:base 的月份
    let res = []
    for m in split("Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec")
      if m =~ '^' . a:base
    call add(res,{'word':m,'abbr':'','menu':'week','info':'is week'})
      endif
    endfor
    return res
    "return {'word':res,'abbr':'s'}
  endif
endfun
set completefunc=CompleteMonths

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 菜单 (MENU){{{1
"======================
"gccSingle Plugin"
menu Plugin.gcc.gcc :call Gcc()<cr>
menu Plugin.gcc.Run :call Run()<cr>
menu Plugin.gcc.HideOutput :call HideOutput()<cr>


fu! Js()
    let filename = expand('%')
    let root = expand('%:r')
    let makeprg  = 'set makeprg=' . root . '\ ' . filename
    silent! exe makeprg
    silent! exe ':update'

    silent! exe 'make'
endf
