# https://github.com/osulp/primo/issues/6
#
# Hide the SMS label and input box in "My Account"

require 'selenium-webdriver'
require 'rspec'
require 'spec_helper'

describe 'On My Account > Personal Settings form' do

  before(:context) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = 'http://search.library.oregonstate.edu/'
    @driver.manage.timeouts.implicit_wait = 15

    # Run this as an ONID user.
    @driver.get @base_url
    @driver.find_element(:link, 'Current OSU students, faculty and staff').click
    @driver.find_element(:id, 'username').send_keys ENV['user']
    @driver.find_element(:id, 'password').send_keys ENV['pass']
    @driver.find_element(:name, 'submit').click

    # Bring up the My Account tab and edit form.
    @driver.find_element(:link, 'My Account').click
    @driver.find_element(:id, 'exlidMyAccountMenu1-5').click
    @driver.find_element(:id, 'editPersonalDetails').click
  end
  
  after(:context) do
    @driver.quit
  end

  context 'for ONID authenticated user' do
    it '"SMS" label is hidden' do
      test_hidden_element(:xpath, "//table[@id='ilsFields']/tbody/tr[8]/th/label")
    end
    it '"SMS" input is hidden' do
      test_hidden_element(:xpath, "//table[@id='ilsFields']/tbody/tr[8]/th/label")
    end
  end

end
