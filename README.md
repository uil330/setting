# setting

必要软件：  

1. vim
2. tmux
3. zsh
4. curl

步序  

0.	cd ~	
1.	git clone https://github.com/uil330/setting.git
2.	mkdir .vim
3.	ln -s ~/setting/vimrc ~/.vimrc	
4.	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
5.	cd ~/.vim/plugged/YouCompleteMe
6.  ./install.sh --clang-completer

