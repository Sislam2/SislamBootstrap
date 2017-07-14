#!/bin/bash
##################################################
# Description: Script for install SislamBootStrap
# Author: Yuri T. Poloni <yuripoloni@gmail.com>
# Copyright: Sislam Tecnologia LTDA.
# Created At: 2017-07-14 14:20:00 +GTM -0300
##################################################
. ~/.bash_profile
source ~/.bash_profile

function share_assets {
  sudo mkdir -p /srv/shared/
  sudo chown ec2-user /srv/shared/
  cp -rfu public/assets /srv/shared/
  rm -rf public/assets
  ln -s /srv/shared/assets public/assets
}

rvm use 2.4.0

cd /srv/sislam_bootstrap

share_assets

bundle install --without development test --quiet --no-deployment
bundle exec rake db:migrate
bundle exec rake tmp:clear

bundle exec rake assets:precompile
