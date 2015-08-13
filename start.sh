#!/usr/bin/env bash

cp ./z.sh /usr/local/bin/z.sh
cp ./.bash_profile ~/.bash_profile
cp ./.bashrc ~/.bashrc
cp ./.inputrc ~/.inputrc
cp ./.gitconfig ~/.gitconfig
cp ./.gitignore ~/.gitignore
cp ./.gitignore_global ~/.gitignore_global
cp ./.osx_always ~/.osx_always
cp ./.profile ~/.profile
cp ./.npmrc ~/.npmrc

if [[ -f ./.osx && `uname` == "Darwin" ]]; then
	echo "Install rbenv"
	if [ -d ~/.rbenv ]; then
		sudo -v
		sudo rm -rf ~/.rbenv
	fi

	echo "Installing rbenv"
	git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
	echo export PATH="$HOME/.rbenv/bin:$PATH" >> ~/.bashrc
	echo 'eval "$(rbenv init -)"' >> ~/.bashrc

	if test ! $(which brew); then
	  echo "Installing homebrew..."
	  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi

	echo "Installing OSX programs"
	sh ./.programs

	echo "Making your Mac awesome"
	sh ./.osx
	sudo bash -c "echo /usr/local/bin/bash >> /private/etc/shells"
	chsh -s /usr/local/bin/bash
fi

git config --global user.email "robbestad@gmail.com"
git config --global user.name "Sven A Robbestad"

echo "Finished"
