# /usr/bin/env bash

rm ~/.bash
ln -s $PWD/.bash ~/.bash

rm ~/.bash_profile
ln -s $PWD/.bash_profile ~/.

rm ~/.bashrc
ln -s $PWD/.bashrc ~/.bashrc

rm ~/.gitconfig
ln -s $PWD/.gitconfig ~/.gitconfig

rm ~/.gitmessage
ln -s $PWD/.gitmessage ~/.

rm ~/.theme.sh
ln -s $PWD/.theme.sh ~/.theme.sh

rm ~/.tmux.conf
ln -s $PWD/.tmux.conf ~/.tmux.conf
