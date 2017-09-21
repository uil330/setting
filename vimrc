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
Plugin 'scrooloose/syntastic'
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


"Syntastic setting
" 设置错误符号
let g:syntastic_error_symbol='✗'
" 设置警告符号
let g:syntastic_warning_symbol='⚠'
" 是否在打开文件时检查
let g:syntastic_check_on_open=0
" 是否在保存文件后检查
let g:syntastic_check_on_wq=1

nnoremap gl :YcmCompleter GoToDeclaration <cr>
nnoremap gf :YcmCompleter GoToDefinition <cr>
nnoremap gg :YcmCompleter GoToDefinitionElseDeclaration <cr>
"g:ackprg = 'ag --nogroup --nocolor --column'
