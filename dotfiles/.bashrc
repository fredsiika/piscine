echo "==> 👢 Bootstrapping with Fred Siika's Dotfiles";
echo "";

echo "This may overwrite existing files in your home directory.";
	echo "";
	read -p "Are you about that life or nah? (y/n) " -n 1;
	echo "";
	
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		echo "Copying files into home directory...";
		echo "====================================";
		echo "";
		doIt;
		result;
		printError;
	fi;
unset doIt;
unset result;

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
function doIt() {
	for file in ~/Projects/piscine/dotfiles/.{bash_profile,bash_prompt,functions,exports,aliases,path,extra}; do
        [ -r "$file" ] && [ -f "$file" ] && \
		cp -v "$file" ~/ && source "$file"; 
	done;
	unset file;
}

function result() {
	if doIt; then
		echo "Bashrc: Success! 🤠";
		echo "====================================";
		echo "";
	else
		echo "Bashrc: Failure 🤬";
		echo "Bashrc: The following files were not found...";
	fi
}

function printError() {
	STR="~/Projects/piscine/dotfiles/.{bash_profile,bash_prompt,functions,exports,aliases,path,extra}";
	BASE=${STR##*.}
	DIR=${STR%$BASE}
	echo "DIRECTORY PATH: $DIR";
	echo "Basepath: $BASE";
}

# Load primary user profile
[ -n "$PS1" ] && source ~/.bash_profile;
