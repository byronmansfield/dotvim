# My personal Vim setup

[https://github.com/byronmansfield/dotvim](https://github.com/byronmansfield/dotvim)

![My VIM setup screenshot](screenshot.jpg)

Screenshot - MacOS + iTerm2 + TMUX + VIM 8

## About

My VIM configuration. I use it to quickly pull changes for my other computers.
If you find it a good starting place for yourself, fork it, clone it, take what
you like, change what you don't.  If there are corrections or broken things feel
free to send me a PR, otherwise just fork it and keep it for your own. Most of
the setup instructions are for Mac, and I need to add in the Linux ones one day.

## Featured Plug-in Highlights

* [Vim-Go](https://github.com/fatih/vim-go) - for some nice Golang specific
  conveniences
* [Pathogen](https://github.com/tpope/vim-pathogen) - for easily managing plugins as git submodules
* [NerdTree](https://github.com/scrooloose/nerdtree) - nice tree-view file browsing [C-n]
* [Rainbow Parentheses](https://github.com/kien/rainbow_parentheses.vim) - easily see when and where you are missing a closing bracket
* [Syntastic](https://github.com/scrooloose/syntastic) - syntax checking and correction helpers for most major languages
* [Solarized](http://ethanschoonover.com/solarized) - Solarized Dark Theme
* [Airline](https://github.com/bling/vim-airline) - Powerful Vim status bar light as air

Just to name a few...

## Featured Personal Customizations

* Spell checking customizations
* Search customizations
* Custom text wrapping
* Hack for multiple pastes
* Fixes for italics
* Kills unneeded white spaces
* Repurposed arrow keys (because we should be staying on home row)
* Color theme settings
* Ctags set-up
* Custom settings for specific coding
* Custom configs for the list of plug-ins
* Custom functions to do really neat things
* A whole bunch of custom key mappings to save me key strokes for all my
  favorite vim commands

And many many more things

## Usage / Installation

### General

This should get you all the basics to get started

1. Clone .vim directory

```shell
git clone https://github.com/byronmansfield/dotvim.git ~/.vim
```

2. Install submodules

```shell
cd ~/.vim
git submodule init
git submodule update
```

3. Symlink vimrc

```shell
ln -s ~/.vim/vimrc ~/.vimrc
```

### Other

Until I get around to writing a bash script to do all this automagically for
me. There will be a few extra things you will need to install in order for this
full list of vim goodies to work.

#### Install YouCompleteMe

To completely install YouCompleteMe you need to do a few extra steps. I suggest
using their repo installation instructions in case something has changed.
Since I'm usually setting this up for myself, and I write a lot of Golang. My typical installation looks something like this

Make sure we have CMake installed (preq for C lang support) via Homebrew

```shell
brew install CMake
```

Update the submodules

```shell
git submodule update --init --recursive
```

Then use their installer script with C and Go flags

```shell
cd ~/.vim/bundle/YouCompleteMe
./install.py --gocode-completer
```

#### iTerm2 Solarized Theme

iTerm2 need the solarized theme as well in order for this to work. There are a
few choices, though the only one I have experience with and know for a fact
works is [iterm-colors](https://github.com/bahlo/iterm-colors). I'm sure the
others work just fine. Then you will need to go into your iTerm2 preferences
> profiles > colors > load presets. Then just import solarized from the cloned
iterm-colors repo.

#### Airline Support

In order to get the full on Airline support on a mac, you'll need to install
the missing [Menlo Powerline patched
fonts](https://github.com/abertsch/Menlo-for-Powerline).

```shell
git clone https://github.com/abertsch/Menlo-for-Powerline.git
```
* Double click the fonts to install them.
* Then set iTerm2 to use the Menlo fonts

## Notes

Use at your own risk. You may be eaten by a grue.

Other things to note. Using on OSX in iTerm2 + tmux can yield all kinds of weird
things you will have to troubleshoot, such as copy and paste issues, italic font
support, color theme settings, and many more fun things. I will try to annotate
this more as I come across it. Some of this support overlaps to my [dotfile
repo](https://github.com/byronmansfield/dotfiles). You may want to check there
for some of these issues, tmux in particular.

