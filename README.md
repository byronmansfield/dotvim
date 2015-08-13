# My personal Vim setup

## About ##

This is to help me keep all my computers synced and also to add some history
tracking in case I need to revert. I am also using this as a way to leave notes
for myself on setting it up every time I need to set up a new computer, and save
	myself time from googling around. Take what you like, contribute if you like
	(please send PR's). Right now I'd say that most of this is set up for OS X +
	iTerm2 with Tmux. I've started using Ubuntu more and have slowly started
	adding things that make it compatible with both.
	
## Current Feature Highlights

  * [Pathogen](https://github.com/tpope/vim-pathogen) - for easily managing plugins as git submodules
  * [NerdTree](https://github.com/scrooloose/nerdtree) - nice tree-view file browsing [C-n]
	* [delimatate](https://github.com/Raimondi/delimitMate) - autocomplete closing support for quotes, brackets, etc
  * [Supertab](https://github.com/ervandew/supertab) - tab-complete anything you have used in the curent buffer
	* [Rainbow Parentheses](https://github.com/kien/rainbow_parentheses.vim) - easily see when and where you are missing a closing bracket
  * [Syntastic](https://github.com/scrooloose/syntastic) - syntax checking and correction helpers for most major languages
  * [Indent Guides](https://github.com/nathanaelkane/vim-indent-guides) - easily see indentions.
	* [Solarized](http://ethanschoonover.com/solarized) - Solarized Dark Theme
	* [Airline](https://github.com/bling/vim-airline) - Powerful Vim status bar
		light as air

just to name a few...

## Usage / Installation

### General

This should get you all the basics to get started

1. Clone .vim directory

		```bash
		git clone https://github.com/byronmansfield/dotvim.git ~/.vim
		```

2. Install submodules

		```bash
		cd ~/.vim
		git submodule init
		git submodule update
		```

3. Symlink vimrc

		```bash
		ln -s ~/.vim/vimrc ~/.vimrc
		```

### Other

Until I get around to writing a bash script to do all this automagically for
me. There will be a few extra things you will need to install in order for this
full list of vim goodies to work. 

#### Install YouCompleteMe

	I write Go and also like Typescript (for Angular2) so typically my
	installation looks like this.

	```bash
	cd ~/.vim/bundle/YouCompleteMe
	.install.sh --gocode-completer
	npm install -g typescript
	```

#### iTerm2 Solarized Theme

	iTerm2 need the solarized theme as well in order for this to work. There are
	a few choices, though the only one I have experience with and know for a fact
	works is [iterm-colors](https://github.com/bahlo/iterm-colors). I'm sure the
	others work just fine. I selected to get this one because it was the smalled
	one I could find with solarized in it. Then you will need to go into your
	iTerm2 preferences > profiles > colors > load presets. Then just import
	solarized from the cloned iterm-colors repo.

#### Airline Support

	In order to get the full on Airline support on a mac, you'll need to install
	the missing [fonts](https://github.com/powerline/fonts) as well.

	```bash
	git clone https://github.com/powerline/fonts.git
	cd /path/to/fonts
	./install.sh
	```

## Notes

  Use at your own risk. You may be eaten by a grue.

## Wishlist

	* write an installer script to handle some of the secondary installiations

