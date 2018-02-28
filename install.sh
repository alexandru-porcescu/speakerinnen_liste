#!/bin/bash

# Set environment
set -e

# Ensure utf8 encoding
update-locale LC_ALL=en_US.utf8

apt-get update

# This will prevent the password setting dialogue
export DEBIAN_FRONTEND=noninteractive

# Enable the add-apt-repository command
apt-get install -y software-properties-common

# Install build essentials & libraries
apt-get install -y git curl python-software-properties build-essential \
                   imagemagick libmagick++-dev libxslt-dev libxml2-dev \
                   zlib1g-dev vim ruby ruby-dev git

# Install latest release of node.js 9.x PPA
apt-get update
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -

# Install packages node.js and npm
apt-get install nodejs

# Create a symlink for nodejs and node
ln -s `which nodejs` /usr/bin/node

# Install bundler
gem install bundler

# Install Java (required for Elasticsearch)
apt-get install -y openjdk-9-jre-headless

# Install Ruby Version Manager (rvm)
apt-add-repository -y ppa:rael-gc/rvm
apt-get update
apt-get install -y rvm
rvm install "ruby-2.2.7"

# If you run into trouble try following
# apt-get install rvm
# rvm group add rvm "$USER"
# rvm fix-permissions
# rvm install "ruby-2.2.7"

# Install Postgres & packages
apt-get update
apt-get install -y postgresql postgresql-contrib libpq-dev