require 'selenium-webdriver'
require 'rspec'
require 'spec_helper'

describe 'Search scopes dropdown' do

  before(:all) do
    @driver = Selenium::WebDriver.for :firefox
    base_url = 'http://search.library.oregonstate.edu/'
    @driver.manage.timeouts.implicit_wait = 15
    @scope_select = "//div[@id='resultsNumbersTile']/h1/em[2]"

    # Run this as guest.
    @driver.get base_url
    @driver.find_element(:link, 'All others continue as guest').click
  end
  
  after(:all) do
    @driver.quit
  end

  context 'as guest' do
    it 'default is books media and articles' do
      # The default scope should be set to 'Books, media and articles'
      expect(@driver.find_element(:css, 'span.EXLSearchFieldStrippedText').text).to match('Books, media and articles')
    end

    it 'changing scope triggers new search' do
      # Search for something, then change the search scope and the search should trigger automatically.
      @driver.find_element(:id, 'search_field').clear
      @driver.find_element(:id, 'search_field').send_keys 'stuff'
      @driver.find_element(:id, 'goButton').click
      @driver.find_element(:id, 'showMoreOptions').click
      @driver.find_element(:css, '#osu_alma_summit-Div > a > span.EXLSearchFieldStrippedText > label').click
      expect(@driver.find_element(:xpath, @scope_select).text).to match('OSU Libraries + Summit')
    end
  end

end
