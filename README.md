# byronmansfield's .vim setup (Based off of drGrove's .vim) #

<http://github.com/byronmansfield/dotvim>


## About ##

So let's face it. Stock Vim on most machines is pretty painful for a seasoned
programmer. Things like managing history, proper language indention, syntax
checking, auto complete etc., are just not there. To that end, here is my setup
that I have lovingly refined through many years of vimming. Vim, with this
setup, is the only IDE I use. (Yes, I just called Vim an IDE. Deal.)

## Current Features ##

  * NerdTree - nice tree-view file browsing [F2]
  * Command-T - fuzzy searching to quickly switch files [Meta-T]
  * Conque-Shell - built in terminals [F3] & [F4]
  * Gundo - undo history management [F5]
  * Supertab - tab-complete anything you have used in the curent buffer
  * Fugitive - built in Git management
  * Syntastic - syntax checking and correction helpers for most major languages
  * Vim-Indent-Guides - easily see indentions. Customized to match Solarized
  * Pathogen - for easily managing plugins as git submodules
  * Other various helper plugins to aid programming as I find them useful
  * NerdCommenter - Adds support for comment toggle in JavaScript

## Usage / Installation ##

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

3. Install dummy vimrc file

    ```bash
    echo "runtime vimrc" > ~/.vimrc
    ```

## Notes ##

  Use at your own risk. You may be eaten by a grue.

## Wishlist ##

  * I would still like to get Tab Bar working properly for JavaScript
  * I would like to map keys to switch vim tabs quickly similar to switching tabs in browsers

