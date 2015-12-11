# https://github.com/osulp/primo/issues/39
#
# Remove all of the fields from the Summit request form except:
# - Pick up location
# - Comment

require 'selenium-webdriver'
require 'rspec'
require 'spec_helper'

describe 'On Summit request form' do

  before(:context) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = 'http://search.library.oregonstate.edu/'
    @driver.manage.timeouts.implicit_wait = 15

    # Run this with ONID login.
    @driver.get @base_url
    @driver.find_element(:link, 'Current OSU students, faculty and staff').click
    @driver.find_element(:id, 'username').send_keys ENV['user']
    @driver.find_element(:id, 'password').send_keys ENV['pass']
    @driver.find_element(:name, 'submit').click

    # Search for a Print Book.
    @driver.find_element(:id, 'search_field').clear
    @driver.find_element(:id, 'search_field').send_keys 'stuff'
    @driver.find_element(:id, 'goButton').click
    @driver.find_element(:id, 'exlidFacet0-2').click # Facet for Print Books

    # Open the Summit request form.
    @driver.find_element(:link, 'Availability & Request Options').click
    @driver.switch_to.frame @driver.find_element(:tag_name, 'iframe')
    @driver.find_element(:id,'openRequest').click
  end
  
  after(:context) do
    @driver.quit
  end

  context 'for authenticated user' do
    it '"Material Type" label is hidden' do
      test_hidden_element(:css, 'label[for="selectMaterialType"]')
    end

    it '"Material Type" select is hidden' do
      test_hidden_element(:id, 'selectMaterialType')
    end

    it '"Terms of Use" label is hidden' do
      test_hidden_element(:css, 'label[for="selectLoanPeriod"]')
    end

    it '"Terms of Use" select is hidden' do
      test_hidden_element(:id, 'selectLoanPeriod')
    end

    it '"Not Needed After" label is hidden' do
      test_hidden_element(:css, 'label[for="noNeedAfterDate"]')
    end

    it '"Not Needed After" input is hidden' do
      test_hidden_element(:id, 'noNeedAfterV')
    end

    it '"Check availability" link is hidden' do
      test_hidden_element(:id, 'bookingAvailability')
    end

    it '"Start Time" label is hidden' do
      test_hidden_element(:css, 'label[for="startDate"]')
    end

    it '"Start Time" input is hidden' do
      test_hidden_element(:id, 'startDateV')
    end

    it '"End Time" label is hidden' do
      test_hidden_element(:css, 'label[for="endDate"]')
    end

    it '"End Time" input is hidden' do
      test_hidden_element(:id, 'endDateV')
    end
  end

end
