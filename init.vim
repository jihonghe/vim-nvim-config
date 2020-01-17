" ----------------------------------------------------------------- START: Sticky Settings -----------------------------------------------------------------
let mapleader = ","    " 修改mapleader变量值为','

"  ------------------------------------- START: VIM Config without any plugins -------------------------------------
" 打开文件时自动恢复到上次光标所在位置
autocmd BufReadPost * normal! g`"
set nocompatible    " 不与Vi兼容
set autoread    " 当前文件在外部被修改时自动重新读取
set shortmess=atI    " 设置VIM窗口标题随文件变化而变化

set nobackup    " 设置覆盖文件时不保留备份文件
set title    " 设置VIM窗口标题随文件变化而变化

set noerrorbells    " 有错误信息时不响铃
set visualbell t_vb=    " 关闭响铃与闪烁

" 编码相关设置
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileformats=unix,dos,mac
set formatoptions+=m
set formatoptions+=B

" VIM界面显示设置
set ruler    " 显示光标所在的行号与列号
set number    " 显示行号
set nowrap    " 设置超过窗口宽度的行不自动回绕显示
set showcmd    " 设置屏幕最后一行显示的命令
set showmode    " 在插入、替换和VISUAL MODE中，最后一行提供消息
set showmatch    " 插入括号时短暂地跳转到与之匹配的对应的括号
set matchtime=2    " 显示配对括号的十分之一秒

" VIM查找配置
set hlsearch    " 搜索结果高亮显示
set incsearch    " 根据搜索结果预览第一处匹配的目标，并且更新搜索目标时实时更新预览内容
set ignorecase    " 当输入的搜索内容全为小写时，显示所有大小写结果
set smartcase    " 当输入的搜索内容存在大写时，则按照大小写进行智能搜索

" VIM Tab设置
set expandtab    " 在VIM中按下Tab时，设置输入到VIM中的是空格
set smarttab    " 表示插入Tab时使用shiftwidth
set shiftround    " 表示缩进对齐到shiftwidth的整数倍
" VIM缩进配置
set autoindent smartindent shiftround
set shiftwidth=4
set tabstop=4
set softtabstop=4

" 显示光标位置
set cursorcolumn
set cursorline

" --------------------------- START: 文件类型设置 --------------------------- 
filetype on
filetype plugin on
filetype indent on

autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd BufRead,BufNew *.md,*.mkd,*.markdown set filetype=markdown.mkd

autocmd BufNewFile *.sh,*.py exec \":call AutoSetFileHead()\"
function! AutoSetFileHead()
    " .sh "
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
    endif                                                                                                                                                  
         
    " python "     
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call append(1, "\# encoding: utf-8")
    endif

    normal G
    normal o
    normal o
endfunc

autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")                                                                                                                                      
    let c = col(".")
    %s/\s\+$//e     
    call cursor(l, c)
endfun
" --------------------------- END: 文件类型设置 --------------------------- 
" ------------------------------------- END: VIM Config without any plugins -------------------------------------

" ----------------------------------------------------------------- END: Sticky Settings -----------------------------------------------------------------

" ----------------------------------------------------------------- START: shortcuts mapping -----------------------------------------------------------------
" NOTE：所谓映射，就是为原本的组合键设置等值操作
" -------------------------------- START: IMP(INSERT MODE mapping) --------------------------------
" 符号自动补全
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap " ""<Esc>i
" 设置从INSERT MODE进入NORMAL MODE的快捷键
inoremap jj <Esc>
" -------------------------------- END: IMP(INSERT MODE Mapping) --------------------------------

" -------------------------------- START: NMP(NORMAL MODE Mapping) --------------------------------
" 设置";"为进入命令模式的快捷键
nnoremap ; :
" 设置"z"为向前删除的快捷键，与"x"(向后删除)进行对应
nnoremap z i<BS><Esc>l
" 设置保存快捷键
nnoremap <leader>w :w<CR>
" 设置退出快捷键
nnoremap <leader>q :q<CR>
" 设置全选快捷键
nnoremap sa ggvG$
" 设置窗口切换快捷键
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" 修改光标在屏幕的上下移动快捷键映射：在vim的默认设置中正好相反
nnoremap j gj
nnoremap k gk
nnoremap gk k
nnoremap gj j
" 设置光标在一行的首位移动
nnoremap H ^
nnoremap L $
" 设置复制到行尾的快捷键
nnoremap Y y$
" 设置取消撤销操作快捷键：已知"u"为撤销操作，"CTRL-r"为撤销操作
nnoremap U <C-r>
" 设置插入新行后回到NORMAL MODE.
nnoremap o o<Esc>
nnoremap O O<Esc>
" 在当前光标处插入新行：操作解释(1. 在NORMAL MODE下键入a进入INSERT MODE；2.
" Enter换行；<Esc>回到NORMAL MODE；k回到上一行；$回到行尾)
nnoremap <CR> a<CR><Esc>k$
" -------------------------------- END: NMP(NORMAL MODE Mapping) --------------------------------

" -------------------------------- START: VMP(VISUAL MODE Mapping) --------------------------------
" -------------------------------- END: VMP(VISUAL MODE Mapping) --------------------------------
" ----------------------------------------------------------------- END: shortcuts mapping -----------------------------------------------------------------

" ----------------------------------------------------------------- START: vim-plug config -----------------------------------------------------------------
" ----------------------------------------------------------------- END: vim-plug config -----------------------------------------------------------------
