# dotfile

here are my dot files and configs I wnat to carry over to new sytems.


Commands

To setup things up, 3 files are needed.

* system_Setup.sh - 
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


To automate:
* gpg tools
* change shell zsh
* edit prompt to proper handle showing the virtualenv and not the deprecated way