require 'rufus-scheduler'
require 'birthday_wisher.rb'

scheduler = Rufus::Scheduler.new

scheduler.every '10s' do
  run
end

scheduler.join
