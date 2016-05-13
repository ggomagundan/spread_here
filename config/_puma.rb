#!/usr/bin/env puma

directory '/home/deployer/spread_here/current'
rackup "/home/deployer/spread_here/current/config.ru"
environment 'production'

pidfile "/home/deployer/spread_here/shared/tmp/pids/puma.pid"
state_path "/home/deployer/spread_here/shared/tmp/pids/puma.state"
stdout_redirect '/home/deployer/spread_here/shared/log/puma_access.log', '/home/deployer/spread_here/shared/log/puma_error.log', true


threads 0,16

bind 'unix:///home/deployer/spread_here/shared/tmp/sockets/puma.sock'

workers 0

prune_bundler


on_restart do
  puts 'Refreshing Gemfile'
  ENV["BUNDLE_GEMFILE"] = "/home/deployer/spread_here/current/Gemfile"
end



