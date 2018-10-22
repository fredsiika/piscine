#!/usr/bin/env bash

echo "==> 👢 Bootstrapping with Fred Siika's Dotfiles"
cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;
echo "==> 🔌 Pulling from the origin master..."

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;
	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	echo "This may overwrite existing files in your home directory.";
	echo ""; 
	read -p "Are you about that life or nah? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
