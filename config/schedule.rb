# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

env :PATH, ENV['PATH'] 

 every 30.minutes do
   rake "websta:api",  :output => "log/websta_api.log", :environment => ENV['RAILS_ENV']
 end

# Learn more: http://github.com/javan/whenever
