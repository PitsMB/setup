#!/bin/sh

#not save this command in history
export HISTIGNORE='*sudo -S*'

#install git
echo "6222" | sudo -S -k sudo apt install git-all -y

#configure git
git config --global user.email "mark.joseph.balagtas@outlook.com"
git config --global user.name "514sh"
git config --global init.defaultBranch main

#generate ssh-key for git
ssh-keygen -t ed25519 -C "mark.joseph.balagtas@outlook.com"
ssh-add ~/.ssh/id_ed25519

#copy ssh key
cat ~/.ssh/id_ed25519.pub
#paste the string from cli to github

#test ssh
ssh -T git@github.com