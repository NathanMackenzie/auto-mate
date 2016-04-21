require 'watir-webdriver'
require 'phantomjs'

BASE_URL = "http://facebook.com"

def run(email, password)
  login(email, password)
  #wish_happy_birthdays get_birthdays
  close
end

def login(email, password)
  @browser = Watir::Browser.new :firefox #:phantomjs
  @browser.goto(BASE_URL)
  @browser.text_field(name: 'email').set(email)
  @browser.text_field(name: 'pass').set(password)
  @browser.button(type: 'submit').click
end
  
def get_birthdays
  @browser.goto(BASE_URL+'/events/birthdays')
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