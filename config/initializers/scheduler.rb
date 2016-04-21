require 'rufus-scheduler'
require 'birthday_wisher.rb'

scheduler = Rufus::Scheduler.new

scheduler.cron '5 0 * * *' do
  Facebook.all.each do |account|
    run account.email, account.password
  end
end

scheduler.join
