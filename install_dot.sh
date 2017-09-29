#!/bin/bash

###variables

dir=~/.dotfiles/dotfiles
olddir=~/.dotfiles/dotfiles_old
files_user="zshrc zshrc.local vimrc xinitrc Xdefaults"
files_awesome="rc.lua theme.lua metall_wp.png"
files_mpv="mpv.conf"

### create dotfiles_old in .dotfiles dir:
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files_user; do
    if [ ! -L ~/.$file ]; then
        echo "Moving any existing dotfiles from ~ to $olddir"
        mv ~/.$file $olddir
        echo "Creating symlink to $file in home directory."
        ln -s $dir/$file ~/.$file
    else
        echo "symlink exists"
        ls -al ~/.$file
    fi
done

# move any existing awesome config files to dotfiles_old directory, then create symlinks 
for file in $files_awesome; do
    if [ ! -L ~/.awesome/$file ]; then
        echo "Moving any existing configs from ~/.awesome/ to $olddir"
        mv ~/.awesome/$file $olddir
        echo "Creating symlink to $file in home directory."
        ln -s $dir/$file ~/.awesome/$file
    else
        echo "symlink exists"
        ls -al ~/$file
    fi
done

# move any existing mpv config files to dotfiles_old directory, then create symlinks 
for file in $files_mpv; do
    if [ ! -L ~/.config/mpv/$file ]; then
        echo "Moving any existing configs from ~/.config/mpv/ to $olddir"
        mv ~/.config/mpv/$file $olddir
        echo "Creating symlink to $file in home directory."
        ln -s $dir/$file ~/.config/mpv/$file
    else
        echo "symlink exists"
        ls -al ~/$file
    fi
done


