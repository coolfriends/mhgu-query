#!/bin/bash

# Install packages
sudo su ec2-user
sudo yum install -y git gcc make readline-devel openssl-devel

# Install rbenv
cd ~
git clone git://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc

# Install ruby-build system-wide
git clone git://github.com/rbenv/ruby-build.git /tmp/ruby-build
cd /tmp/ruby-build
sudo ./install.sh

# Setup RVM and Ruby
rbenv install 2.5.1 && rbenv global 2.5.1

# Pull the backend repo and change into the source code directory
mkdir ~/src
cd ~/src
git clone http://github.com/coolfriends/mhgu-query.git
cd mhgu-query

# Install Ruby dependencies and start the server
bundle install --without development
bundle exec bin/server
