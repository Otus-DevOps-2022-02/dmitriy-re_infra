#!/bin/bash
sudo apt-get install git
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
bundle update --bundler
puma -d
