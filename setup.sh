#!/bin/sh
#not save this command in history
export HISTIGNORE='*sudo -S*'

#install git
echo "6222" | sudo -S -k sudo apt install git-all -y