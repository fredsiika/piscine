# Fred Siika's Piscine Dotfiles
Dotfiles and iMac configuration
---
[![iTerm-screenshot](/iterm-screenshot.png)](https://asciinema.org/a/eU6brNyNJ3KMzQdw4mLq8iWiU?t=2:10)

## Installation

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

### Using Git and the bootstrap script
You can clone the repository wherever you want (I like to keep it in `~/Piscine/dotfiles`). 
The bootstrapper script will pull in the latest version and copy the files to your home folder.

```bash
# Clone this repository
git clone https://github.com/fredsiika/piscine.git 

# Move into the dotfiles directory
cd piscine/dotfiles 

# To Update, start the bootstrap script
source bootstrap.sh
```


Alternatively, to update while avoiding the confirmation prompt:

```bash
set -- -f; source bootstrap.sh
```

### Git-free install

To install these dotfiles without Git:

```bash
cd; curl -#L https://github.com/fredsiika/piscine/tarball/master | tar -xzv --strip-component 1 --exclude={README.md,bootstrap.sh,.osx,LICENSE-MIT.txt}
```

To update later on, just run that command again.

## Prevent / Fix NPM (Node Package Manager) Permission Errors
Due to local environment configuration set by 42 Silicon's admins, we do not have 'sudoer' (root) access. Commands like ```bash
chmod +x <file-name>```do not work resulting in an **EACES** error when trying to install a node package globally. 
Fortunately there's a workaround by changing the directory where npm is installed. 

**To minimize the chance of permissions errors, you can configure npm to use a different directory. In this example, it will be a hidden directory on your home folder.**

1. Make a directory for global installations:
```bash
mkdir ~/.npm-global
```

2. Configure npm to use the new directory path:
```bash
npm config set prefix '~/.npm-global'
```

3. Open or create a **~/.profile** file and add this line:
 ```bash
 export PATH=~/.npm-global/bin:$PATH
 ```
4. Back on the command line, update your system variables:
 ```bashsource ~/.profile
 ```
 5. On the command line, update your system variables:
 ```bash
 source ~/.profile
 ```
 6. To test your new configuration, install a package globally without using `**sudo**`:
 ```bash
 npm install -g jshint
 ```
Instead of steps 2-4, you can use the corresponding ENV variable (e.g. if you don’t want to modify **~/.profile** ):
```bash
NPM_CONFIG_PREFIX=~/.npm-global
```

[Here's the official tutorial from NPM](https://docs.npmjs.com/getting-started/fixing-npm-permissions).

## Sensible macOS defaults
When setting up a new Mac, you may want to set some sensible macOS defaults:
```bash
./.macos
```
## Feedback

Suggestions/improvements
[welcome](https://github.com/fredsiika/piscine/issues)!

## Author
[Fred Siika](https://github.com/fredsiika/)<br>
Follow @fredsiika on
[Twitter](http://twitter.com/fredsiika) <br>


## Thanks to the following for inspiration.…
* [Mathias Bynens](https://mathiasbynens.be/)
* @ptb and [his _macOS Setup_ repository](https://github.com/ptb/mac-setup)
* [Cătălin Mariș](https://github.com/alrra) and his [dotfiles repository](https://github.com/alrra/dotfiles)
