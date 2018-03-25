#!/bin/sh

# update the system
apt-get update
apt-get upgrade

################################################################################
# Install the mandatory tools
################################################################################

# install utilities
apt-get -y install git curl

#install parity
curl -L "$(curl -s https://api.github.com/repos/paritytech/parity/releases | grep ubuntu_amd64 | grep stable | cut -d '|' -f 24 | cut -d'(' -f 2 | cut -d')' -f 1 | head -n 1)" -o parity.deb
dpkg --install parity.deb


# install node.js
#curl -sL https://deb.nodesource.com/setup_8.x | bash -
#apt-get install -y nodejs unzip python g++ build-essential

# install Heroku toolbelt
#wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# install oh-my-zsh
#git clone git://github.com/robbyrussell/oh-my-zsh.git /home/vagrant/.oh-my-zsh
#cp /home/vagrant/.oh-my-zsh/templates/zshrc.zsh-template /home/vagrant/.zshrc
#chsh -s /bin/zsh vagrant
#echo 'SHELL=/bin/zsh' >> /etc/environment

# change user to vagrant
#chown -R vagrant:vagrant /home/vagrant/.zshrc /home/vagrant/.oh-my-zsh


# install latest Docker
#curl -sL https://get.docker.io/ | sh

# install latest docker-compose
#curl -L "$(curl -s https://api.github.com/repos/docker/compose/releases | grep browser_download_url | head -n 4 | grep Linux | grep -v sha256 | cut -d '"' -f 4)" > /usr/local/bin/docker-compose
#chmod +x /usr/local/bin/docker-compose

# configure docker group (docker commands can be launched without sudo)
#usermod -aG docker vagrant

# fix ownership of home
#chown -R vagrant:vagrant /home/vagrant/

# clean the box
apt-get -y autoclean
apt-get -y clean
apt-get -y autoremove
dd if=/dev/zero of=/EMPTY bs=1M > /dev/null 2>&1
rm -f /EMPTY
