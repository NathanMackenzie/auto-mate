require 'birthday_wisher.rb'

desc "This task is called by the Heroku scheduler add-on"

task :birthday_wish => :environment do
  Facebook.all.each do |account|
    run account.email, account.password
  end
end