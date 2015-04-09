""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Hank.Z vimrc 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nu               " 打开行提示
"color asmanian2     " 默认颜色
set guifont=Courier_New:h10:cANSI   " 字体设置
syntax on           " syntax on
set nocompatible     " 不要使用vi的键盘模式，而是vim自己的
set history=100      " history文件中需要记录的行数
set confirm          " 在处理未保存或只读文件的时候，弹出确认
set clipboard+=unnamed              " 与windows共享剪贴板
filetype on          " 侦测文件类型
filetype plugin on   " 载入文件类型插件
set viminfo+=!       " 保存全局变量
set iskeyword+=_,$,@,%,#,-          " 带有如下符号的单词不要被换行分割
":highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white " 高亮字符，让其不受100列限制
":match OverLength '\%101v.*'
highlight StatusLine guifg=SlateBlue guibg=Yellow  " 状态行颜色
highlight StatusLineNC guifg=Gray guibg=White
set cursorline       "a 高亮光标所在的行
set laststatus=2     " 总是显示状态行
autocmd! bufwritepost .vimrc source ~/.vimrc       "a修改 vmirc 后自动生效
set ruler            " 在状态行上显示光标所在位置的行号和列号
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)
set cmdheight=2      " 命令行（在状态行下）的高度，默认为1，这里是2
set noerrorbells     " 不让vim发出讨厌的滴滴声
set fillchars=vert:\ ,stl:\ ,stlnc:\               " 在被分割的窗口间显示空白，便于阅读
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936" 设定默认解码
set enc=utf-8         " 设定编码
set fileencodings=ucs-bom,utf-8,chinese
set foldmethod=indent "开启折叠
	

func SetTitle() 
    if &filetype == 'sh' 
        call setline(1,"\#########################################################################") 
        call append(line("."), "\# File Name: ".expand("%")) 
        call append(line(".")+1, "\# Author: hank") 
        call append(line(".")+2, "\# mail: chenhanhank@icloud.com ") 
        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+4, "\#########################################################################") 
        call append(line(".")+5, "\#!/bin/bash") 
        call append(line(".")+6, "") 
""    else 
""        call setline(1, "/*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "    > Author: hank") 
        call append(line(".")+2, "    > Mail: chenhanhank@icloud.com ") 
        call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    autocmd BufNewFile * normal G
endfunc 
