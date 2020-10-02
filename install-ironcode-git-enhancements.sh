#!/bin/bash -i

# A Quick and Dirty Install file for Iron Code Git Enhancements

# clone the project repo
git clone https://github.com/ironcodestudio/ironcode-git-enhancements.git ~/ironcode-git-enhancements

# Add line to ~/.gitconfig to load our gitconfig settings
printf "\n[include]\n\tpath = ~/ironcode-git-enhancements/gitconfig\n" >> ~/.gitconfig
