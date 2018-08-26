# Fred Siika's Piscine Dotfiles
42 Silicon Valley August 2018 Piscine dotfiles and iMac configuration
---
![Screenshot of my shell prompt](https://i.imgur.com/{customhash.png)

## Installation

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

### Using Git and the bootstrap script

You can clone the repository wherever you want (I like to keep it in `~/Piscine/dotfiles`). 
The bootstrapper script will pull in the latest version and copy the files to your home folder.

```bash
git clone https://github.com/fredsiika/piscine.git && cd dotfiles/piscine && source bootstrap.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
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

Make a directory for global installations:
1. ```bash
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

| [![twitter/fredsiika](http://gravatar.com/avatar/insert-gravatar-hash)](http://twitter.com/fredsiika "Follow @fredsiika on Twitter") |
|---|https://twitter.com/fredsiika/photo
| [Fred Siika](https://github.com/fredsiika/) |

## Thanks to…
* [Mathias Bynens](https://mathiasbynens.be/)
* @ptb and [his _macOS Setup_ repository](https://github.com/ptb/mac-setup)
* [Cătălin Mariș](https://github.com/alrra) and his [dotfiles repository](https://github.com/alrra/dotfiles)
