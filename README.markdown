# My dotfiles

These are my dotfiles, including my .bashrc and .vimrc and also my vimplugins.

## Installation

First clone this repository from github into a new folder called 'dotfiles' in your home directory 
using the command below:

`git clone https://github.com/marc92w/dotfiles.git ~/dotfiles`

After that create symlinks for each configuration file running these commands:

`ln -s ~/dotfiles/vimrc ~/.vimrc`
`ln -s ~/dotfiles/bashrc ~/.bashrc`
`ln -s ~/dotfiles/bash_aliases ~/.bash_aliases`

## Update vim plugins

You can simply update the vim plugins to the latest version by fetching the git submodules of this
repository running these commands:

`cd ~/dotfiles`
`git submodule init`
`git submodule update`

