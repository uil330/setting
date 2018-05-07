set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/vundle
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'taglist.vim'
Plugin 'mileszs/ack.vim'
Plugin 'kshenoy/vim-signature'
Plugin 'rking/ag.vim'
"太久了所以换成linter
"Plugin 'scrooloose/syntastic'
Plugin 'DoxygenToolkit.vim'
" 自动调用tags
Plugin 'ludovicchabant/vim-gutentags'
" 错误检测
Plugin 'w0rp/ale'
" 函数列表 alt+p
Plugin 'Yggdroot/LeaderF'
call vundle#end()            " required
filetype plugin indent on    " required

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/c/ycm/ycm.c.py'
let g:ycm_python_binary_path = '/usr/local/bin/python'

set nu
syntax on
set tabstop=4
set shiftwidth=4

"Vim中copy的所有内容都会上系统剪切板
set clipboard=unnamed
set noexpandtab

set encoding=utf-8

au BufNewFile,BufRead *.py
\ set tabstop=4|
\ set softtabstop=4|
\ set shiftwidth=4|
\ set textwidth=79|
\ set noexpandtab|
\ set smartindent|
\ set autoindent|
\ set fileformat=unix

set hlsearch
set backspace=indent,eol,start

let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口 "
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的"
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
set tags=tags;/

command! BcloseOthers call <SID>BufCloseOthers()  
function! <SID>BufCloseOthers()  
	let l:currentBufNum   = bufnr("%")  
	let l:alternateBufNum = bufnr("#")  
	for i in range(1,bufnr("$"))  
		if buflisted(i)  
			if i!=l:currentBufNum  
				execute("bdelete ".i)  
			endif  
		endif  
	endfor  
endfunction  
map <leader>bdo :BcloseOthers<cr>
set clipboard=unnamed


""Syntastic setting
"" 设置错误符号
"let g:syntastic_error_symbol='✗'
"" 设置警告符号
"let g:syntastic_warning_symbol='⚠'
"" 是否在打开文件时检查
"let g:syntastic_check_on_open=0
"" 是否在保存文件后检查
"let g:syntastic_check_on_wq=1
"let g:c_syntax_for_h = 1

nnoremap gl :YcmCompleter GoToDeclaration <cr>
nnoremap gf :YcmCompleter GoToDefinition <cr>
"nnoremap gg :YcmCompleter GoToDefinitionElseDeclaration <cr>
"g:ackprg = 'ag --nogroup --nocolor --column'

autocmd FileType python set expandtab
"
"我们希望在新建c文件时，自动在文件头部加入一些代码，比如预处理命令，和编码设置，可以将以下配置放到/etc/vimrc或者 ~/.vimrc 文件底部，然后退出vim在进入vim即可生效。<br>"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.[ch],*.py exec ":call SetTitle()"
"""定义函数SetTitle，自动插入文件头
func SetTitle()
if &filetype == 'python'
	call setline(1, "#!/usr/bin/env python")
	normal o
	call setline(2, "# -*- coding: utf-8 -*-")
	normal o
	call setline(3, "")
	normal o
	call setline(4, "'''*************************************************************************")
else
	call setline(1, "/*************************************************************************")
endif
call append(line("."), " > File Name: ".expand("%"))
call append(line(".")+1, " > Author: liu")
call append(line(".")+2, " > Mail: liu@prodrone.jp ")
call append(line(".")+3, " > Created Time: ".strftime("%c"))
call append(line(".")+4, " //                       _oo0oo_")
call append(line(".")+5, " //                      o8888888o")
call append(line(".")+6, " //                      88' . '88")
call append(line(".")+7, " //                      (| -_- |)")
call append(line(".")+8, " //                      0\\  =  /0")
call append(line(".")+9, " //                    ___/`---'\\___")
call append(line(".")+10, " //                  .' \\\\|     |// '.")
call append(line(".")+11, " //                 / \\\\|||  :  |||// \\ ")
call append(line(".")+12, " //                / _||||| -:- |||||- \\ ")
call append(line(".")+13, " //               |   | \\\\\\  -  /// |   |")
call append(line(".")+14, " //               | \\_|  ''\\---/''  |_/ |")
call append(line(".")+15, " //               \\  .-\\__  '-'  ___/-. /")
call append(line(".")+16, " //             ___'. .'  /--.--\\  `. .'___")
call append(line(".")+17, " //          .'' '<  `.___\\_<|>_/___.' >' ''.")
call append(line(".")+18, " //         | | :  `- \\`.;`\\ _ /`;.`/ - ` : | |")
call append(line(".")+19, " //         \\  \\ `_.   \\_ __\\ /__ _/   .-` /  /")
call append(line(".")+20, " //     =====`-.____`.___ \\_____/___.-`___.-'=====")
call append(line(".")+21, " //                       `=---=' ")
call append(line(".")+22, " // ")
call append(line(".")+23, " //     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
call append(line(".")+24, " //               佛祖保佑         永无BUG ")
call append(line(".")+25, " // ")

if &filetype == 'python'
	call append(line(".")+26,"*************************************************************************'''")
else
	call append(line(".")+26,"*************************************************************************/")
endif
call append(line(".")+27, "")
if &filetype == "h"
	call append(line(".")+28, "#ifndef")
	call append(line(".")+29, "#define")
	call append(line(".")+30, "#endif")
endif
"新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal G
endfunc


"gutentags的设定
set tags=./.tags;,.tags
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
"gutentags的设定
"

"ale的设定
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
"let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
"
"let g:ale_lint_on_text_changed = 'normal'
"let g:ale_lint_on_insert_leave = 1
"o
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
"let g:ale_c_cppcheck_options = ''
"let g:ale_cpp_cppcheck_options = ''
"let g:ale_sign_error = "\ue009\ue009"
"hi! clear SpellBad
"hi! clear SpellCap
"hi! clear SpellRare
"hi! SpellBad gui=undercurl guisp=red
"hi! SpellCap gui=undercurl guisp=blue
"hi! SpellRare gui=undercurl guisp=magenta
"ale的设定
