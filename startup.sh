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
	echo "Updating OSX settings and installing brew "
	/usr/bin/osascript ./installbrew.app
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

	echo "Installing programs"
	sh ./.programs
	sh ./.osx
	sudo bash -c "echo /usr/local/bin/bash >> /private/etc/shells"
	chsh -s /usr/local/bin/bash
fi

echo "Finished"
