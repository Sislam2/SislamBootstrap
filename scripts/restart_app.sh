#!/bin/bash
##################################################
# Description: Script for restart SislamBootStrap webapp
# Author: Yuri T. Poloni <yuripoloni@gmail.com>
# Copyright: Sislam Tecnologia LTDA.
# Created At: 2017-07-14 14:20:00 +GTM -0300
##################################################

. ~/.bash_profile
source ~/.bash_profile

rvm use 2.4.0

PUMA_PID=/tmp/puma.pid
# SIDEKIQ_PID=/tmp/sidekiq.pid

cd /srv/sislam_bootstrap
if [ $(ps ax | grep puma | grep sislam_bootstrap -c) -gt 0 ]; then
  pumactl -P ${PUMA_PID} restart
else
  bundle exec puma -d --pidfile ${PUMA_PID} -C config/puma.rb
fi

# if [ $(ps ax | grep sidekiq | grep onechess -c) -gt 0 ]; then
#   sidekiqctl stop /tmp/sidekiq.pid
# fi
#
# bundle exec sidekiq -d -e production -P ${SIDEKIQ_PID} -L log/sidekiq.log
