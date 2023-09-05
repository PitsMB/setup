#!/bin/sh

#not save this command in history
export HISTIGNORE='*sudo -S*'

#install curl
sudo sudo apt install curl -y

#install git
sudo sudo apt install git-all -y

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

#install google-chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

mkdir ~/Downloads/deb && cd ~/Downloads/deb

#install google-chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

#install node
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
sudo apt-get update
sudo apt-get install nodejs -y

#install docker engine
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg -y
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y


wget https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/containerd.io_1.6.22-1_amd64.deb
wget https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-ce_24.0.5-1~ubuntu.22.04~jammy_amd64.deb
wget https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-ce-cli_24.0.5-1~ubuntu.22.04~jammy_amd64.deb
wget https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-buildx-plugin_0.11.2-1~ubuntu.22.04~jammy_amd64.deb
wget https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-compose-plugin_2.20.2-1~ubuntu.22.04~jammy_amd64.deb

sudo dpkg -i ./containerd.io_1.6.22-1_amd64.deb \
 ./docker-ce_24.0.5-1~ubuntu.22.04~jammy_amd64.deb \
 ./docker-ce-cli_24.0.5-1~ubuntu.22.04~jammy_amd64.deb \
 ./docker-buildx-plugin_0.11.2-1~ubuntu.22.04~jammy_amd64.deb \
 ./docker-compose-plugin_2.20.2-1~ubuntu.22.04~jammy_amd64.deb

sudo chmod 666 /var/run/docker.sock