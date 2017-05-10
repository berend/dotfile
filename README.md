# dotfiles

here are my dot files and configs I want to carry over to new sytems. This is for mac osX


## Commands

To setup things up, 3 files are needed.

* system_Setup.sh - putting all install script into one
* .zshrc
* env.sh

Get them all into your home directory with this command

```bash
cd; curl -#L https://github.com/berend/dotfile/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,LICENSE}
```

To install all stuff, run this.
```bash
cd; ./systemsetup.sh
```
(If you want to copy this, go line by line if you really need this - or more)


## Other stuff

Here is some stuff I want on my computer that are not yet automated in the setup script. I tend to forget half of it, that why they are collected here.

### sublime packages

* Pretty JSON (auto indent JSON, use jq on JSON)
* SublimeJedi (for python in sublime)
* SublimeLinter
* SublimeLinter-flake8



## To do:
* gpg tools & setup
* finding a secure place to store ssh keys and gpg keys and automate importing from there
* change shell zsh
* install sublime plugin manager and plugin automated
* restore pycharm settings automated
* edit prompt to proper handle showing the virtualenv and not the deprecated way