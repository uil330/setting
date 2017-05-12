# setting

必要软件：
1 vim
2 tmux
3 zsh

步序
0.	cd ~	
1.	git clone https://github.com/uil330/setting.git
2.	mkdir .vim
3.	ln -s ~/setting/vimrc ~/.vimrc	
4.	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
5.	cd ~/.vim/bundle/YouCompleteMe
	./install.sh --clang-completer

