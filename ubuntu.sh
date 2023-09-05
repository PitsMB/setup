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
#ssh-keygen -t ed25519 -C "mark.joseph.balagtas@outlook.com"
#ssh-add ~/.ssh/id_ed25519

#copy ssh key
#cat ~/.ssh/id_ed25519.pub
#paste the string from cli to github

#test ssh
#ssh -T git@github.com

#install google-chrome
mkdir ~/Downloads/deb && cd ~/Downloads/deb

#install google-chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y

#install docker engine
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

#run docker without root privileges
sudo groupadd docker
sudo usermod -aG docker $USER
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R

#start docker on boot
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

cd ~

#install node
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
sudo apt-get update
sudo apt-get install nodejs -y

#install python3.11
# sudo apt update
# sudo add-apt-repository ppa:deadsnakes/ppa
# sudo apt update
# sudo apt install python3.11 -y
# sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1
# sudo ln -s /usr/bin/python3.11 /usr/bin/python

#install python packages
sudo apt install python3-pip -y
sudo apt install python3.10-venv

#install postgres
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install postgresql libpq-dev postgresql-server-dev-12 postgresql-client-12

#install spotify
curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client -y

#install vscode
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https -y
sudo apt update
sudo apt install code -y # or code-insiders
