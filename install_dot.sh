#!/bin/bash

###variables

dir=~/.dotfiles/dotfiles
olddir=~/.dotfiles/dotfiles_old
files_user="zshrc zshrc.local vimrc xinitrc Xresources"
files_awesome="rc4.lua theme4.lua metall_wp.png"
dir_awesome="awesome"
files_mpv="mpv.conf"
dir_mpv="config/mpv"
files_tmuxinator="daily.yml"
dir_tmuxinator="tmuxinator"



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
    if [ ! -L ~/.$dir_awesome/$file ]; then
        echo "Moving any existing configs from ~/.$dir_awesome/ to $olddir"
        mv ~/.$dir_awesome/$file $olddir
        echo "Creating symlink to $file in home directory."
        ln -s $dir/$file ~/.$dir_awesome/$file
    else
        echo "symlink exists"
        ls -al ~/.$dir_awesome/$file
    fi
done

# move any existing mpv config files to dotfiles_old directory, then create symlinks 
for file in $files_mpv; do
    if [ ! -L ~/.$dir_mpv/$file ]; then
        echo "Moving any existing configs from ~/.$dir_mpv/ to $olddir"
        mv ~/.$dir_mpv/$file $olddir
        echo "Creating symlink to $file in home directory."
        ln -s $dir/$file ~/.$dir_mpv/$file
    else
        echo "symlink exists"
        ls -al ~/.$dir_mpv/$file
    fi
done

#tmuxinator:
for file in $files_tmuxinator; do
    if [ ! -L ~/.$dir_tmuxinator/$file ]; then
        echo "Moving any existing configs from $dir_tmuxinator to $olddir"
        mv ~/.$dir_tmuxinator/$file $olddir
        echo "Creating symlink to $file in home directory."
        ln -s $dir/$file ~/.$dir_tmuxinator/$file
    else
        echo "symlink exists"
        ls -al ~/.$dir_tmuxinator/$file
    fi
done
