" => ����(ABOUT) {{{1
"======================
" Author:
"   erjun
"   993911924@qq.com
"
"Last Chang:
"   2012-09-19->16:46:37

" => ϵͳ(OS){{{1
"======================

" ���û�������
if has('win32') || has('win64')
    let $MYVIMRC = '$VIM/vimrc'
elseif has('unix')
    if $USER == 'root'
        let $MYVIMRC = '$VIM/vimrc'
    endif
endif

" ��չ�ļ���ʱʹ����б��
if exists('+shellslash')
    set ssl
endif

" => ����(General){{{1
"======================
" ����vim���뱣������ʷ��¼���� 
set history=500

"ʹ��bundle���������
filetype plugin on 
filetype indent on 

" ���ļ����ⲿ�޸Ķ�vimû���޸�����������
set autoread


" => ���Ӳ���{{{1
"======================
"��������������ٱ�������Ļ������
set so=9

"�����в�ȫ����ǿģʽ����
set wildmenu 

"set wildignore=

"�ļ��Ƚϱ��ʽ
set diffexpr=MyDiff()

"�������������
set mouse=
" => �ı� (TEXT){{{1
"======================
"�ÿո�����Ʊ��"
set expandtab

"����tab����shiftwidth����հ�
set smarttab

"һ��tab==4���ո�
set tabstop=4
set shiftwidth=4

"ѡ��趨
set showtabline=2 " always show tabs in gvim, but not vim
set guitablabel=%{GuiTabLabel()}

set guitabtooltip=%{GuiTabToolTip()}

set wrap "���Ƴ������ڿ�ȵ��ı�"

"set softtabstop=4
set autoindent 
set si

" �кźͱ��
set number
set ruler
set rulerformat=%15(%c%V\ %p%%%)
"set cuc "������ǰ��

" �����־�۵�
set foldmethod=marker

" ����Ҫ����������ʱ,vim��ֹʱʱƥ��
set nois
set hls "ģʽ����

" ����
set titlestring=%F\ \ \ %{FileTime()}\ \ \ \ username\ :\ %{expand($username)}\ \ \ \pid\ :\ %{getpid()}
" ״̬��
set ch=1
set stl=\ [File]\ %F%m%r%h%y[%{&fileformat},%{&fileencoding}]\ %w\ \ [PWD]\ %r%{GetPWD()}%h\ %=\ [Line]%l/%L\ %=\[%P]
set ls=2 " ʼ����ʾ״̬��

" ����ģʽ��ʹ�� <BS>��<Del> <C-W> <C-U>
set backspace=indent,eol,start

" ���ݺͻ���
set nobackup

set nowritebackup
set backupext=.bak "�����ļ�����չ��
"set patchmode=.orig  "����ԭʼ�汾
"set backupdir=D:\bkup\vimbackupfile "�����Զ�����·��

""""""""hahah
"������ʹ�ý����ļ�
set swapfile

" Diff ģʽ��ʱ�����ͬ������ for Vim7.3
if has('cursorbind')
    set cursorbind
end

set nomore "ȡ������
set nocompatible "��Ҫvimģ��viģʽ

"_vimrc������Զ�����
autocmd! bufwritepost _vimrc source $vim/_vimrc
autocmd GUIEnter * simalt ~x

"ʧȥ������Զ�����  
"au FocusLost * silent! up 
au FocusLost * silent! up

"��ɫ��
syntax on
"��ɫ����
colorscheme molokai
"���
"highlight iCursor guifg=white guibg=green
"set guicursor+=i:ver50-iCursor


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ��ɫ������
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"==========
"ͼ�ν���
"==========

if has('gui_running')

    "���ع�����
    "set guioptions-=T
    "���ز˵���
    "set guioptions-=m

    " ����������ڵ���
    set cursorline

    if has("win32")
        "windows��������
        source $VIMRUNTIME/mswin.vim 
        "����(font)
        "exe 'set guifont='.iconv('Consolas', &enc, 'gbk').':h12:i:cANSI'
        exe 'set guifont='.iconv('Envy_Code_R', &enc, 'gbk').':h12:cDEFAULT'
        set gfw=��Բ:h11:cGB2312
    endif
endif

"=================================================================
" => �Զ����� (AUTO){{{1
"======================
" �Զ��ı䵱ǰĿ¼
if has('netbeans_intg')
    set autochdir
endif
"au FileType html,css,javascript :call AutoClose()

"�����ֵ� 
let g:dict_dir="set dictionary+=$vim/vimfiles/dict/"
au FileType css,html,htm,php,less exe dict_dir."css.dict"
au FileType css,html,htm,php,less exe dict_dir."css3.dict"

"�˳�vim��ʱ�򱣴�session
au VimLeave * call SaveSess()
"��vim��ʱ������session
"au VimEnter * call RestoreSess()

"���ʷ���
"nmap <silent><leader>e :!curl dict://dict.org/d:<cword><CR><CR>

au FileType javascript call JavascriptAuto()
au FileType css call CssAuto()
au FileType html call HtmlAuto()
au FileType python call PythonAuto()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ����ӳ�� (MAP){{{1
"======================
" ���ð���ӳ�����ͷ,ȱʡΪ \
let mapleader=","
let g:mapleader = ","

" ���ٱ��� 
nmap <leader>w :w!<cr>

" �۵���־
let @a="{{{"
map <leader>{ $"apa

"����ģʽ�� F4 ���뵱ǰʱ��
imap <f4> <C-r>=GetDateStamp()<cr>

"netrw setting �ļ����������(��Ŀ¼)
nmap <leader>d :Sexplore!<cr>
"�õ�ǰĿ¼���ҵ����ͬ��
let g:netrw_keepdir= 0

"���Զ������session
map <leader>rr :call RestoreSess()<cr>

" �л���ʾ�кţ�����к� / �����к�
nnoremap <leader>wn :call Lilydjwg_toggle_number()<CR>

"�û��������
nmap <leader>tf :call Lilydjwg_open_url()<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ����(CODING){{{1
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

"����(LANG){{{2
"��Ϣ
language messages en_US.utf-8
"language messages zh_CN.utf-8
set helplang=cn
"�˵�
"source $VIMRUNTIME/delmenu.vim
set fencs=utf-8,gbk,chinese,latin1,gb2312 "���gb2312��������
set ff=dos

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ������� (PLUGIN){{{1
"======================
" ===�Դ���� ===
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

"������ ���1
let g:indent_guides_guide_size=1

"viki
let g:vimwiki_list = [{'path': 'D:/Dropbox/vimwiki/',
\ 'path_html': 'D:/Dropbox/html/',
\ 'html_header': 'D:/Dropbox/template/header.tpl',}]
let g:vimwiki_use_mouse = 1
" �Ƿ������﷨�۵�  �����ļ��Ƚ���
"let g:vimwiki_folding = 1
" �Ƿ��ڼ����ִ�����ʱ���ر��������ַ�
let g:vimwiki_CJK_length = 1

nnoremap <leader>ot :TlistToggle<CR>
let Tlist_Use_Right_Window=1
set tags=D://


" => ���� (FUNCTION){{{1
"======================
"{{{2 => => ��ȡ��ǰĿ¼
fu! GetPWD()
    return substitute(getcwd(), "", "", "g")
endf

"{{{2 => => �ļ��ϴ��޸�����
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

" ����ҳͷע�ͣ�������ʵ�ʴ���{{{2
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

" ���ص�ǰʱ��{{{2
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

"�����Զ���ȫ{{{2
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

"�����ļ�������ͬ�汾�� ed ���{{{2
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

"����ɾ���Ự��info{{{2
"�����Ự��info{{{3
fu! SaveSess()
	set sessionoptions-=curdir "�ָ���ǰĿ¼
	set sessionoptions+=sesdir "���õ�ǰĿ¼Ϊ�Ự�ļ����ڵ�λ��
	set sessionoptions+=winpos "GUI VIM ����λ��
	set sessionoptions+=resize "�ָ���Ļ��С
	set sessionoptions+=buffers "�ָ����л�����
	set sessionoptions+=slash
	set sessionoptions+=unix
    set sessionoptions+=options "ȫ��ӳ���ѡ��
    "�����Ự�ļ�
    exe 'mksession! $HOME/session.vim'
    exe 'wviminfo! $HOME/viminfo'
endf

"�ָ��Ự��info{{{3
fu! RestoreSess()
	exe 'source $HOME/session.vim'
	exe 'rviminfo $HOME/viminfo'
endf

" ѡ�{{{2
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
"  �л���ʾ�кţ�����к� / �����к� {{{2
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
"{{{2 => => �û��������{{{2
fu! Lilydjwg_open_url()
  let s:url = Lilydjwg_get_pattern_at_cursor('\v(https?://|ftp://|file:/{3}|www\.)(\w|[.-])+(:\d+)?(/(\w|[~@#$%^&+=/.?:-])+)?')
  if s:url == ""
    echohl WarningMsg
    echomsg '�ڹ�괦δ����URL��'
    echohl None
  else
    echo '��URL��' . s:url
    if has("win32") || has("win64")
      " start ���ǳ���������Ч�����ң�cmd ֻ��ʹ��˫����
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
"{{{2 => => ��ȫ
fun! CompleteMonths(findstart, base)
  if a:findstart
    " ��λ���ʵĿ�ʼ��
    let line = getline('.')
    let start = col('.') - 1
    while start > 0 && line[start - 1] =~ '\a'
      let start -= 1
    endwhile
    return start
  else
    " Ѱ��ƥ�� a:base ���·�
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
" => �˵� (MENU){{{1
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
