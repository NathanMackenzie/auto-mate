require 'watir-webdriver'
require 'phantomjs'

BASE_URL = "http://facebook.com/events/birthdays"

def run(email, password)
  login(email, password)
  wish_happy_birthdays get_birthdays
  sleep(3) #Ensures enough time for browser to send post before exiting
  close
end

def login(email, password)
  @browser = Watir::Browser.new :phantomjs  #:firefox
  @browser.goto(BASE_URL)
  @browser.text_field(name: 'email').set(email)
  @browser.text_field(name: 'pass').set(password)
  @browser.button(type: 'submit').click
end
  
def get_birthdays
  birthdays = @browser.textareas
  return birthdays
end
  
def wish_happy_birthdays(birthdays)
  birthdays.each do |birthday|
    birthday.set "Happy Birthday!"
    @browser.send_keys :enter
  end
end
  
def close
  @browser.close
end