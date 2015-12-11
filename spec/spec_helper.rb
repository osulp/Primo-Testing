RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.add_formatter :documentation
end

def test_hidden_element(type, value)
  # These should not be present in the DOM.  If they are present, the .displayed? will fail the test.
  begin
    expect(@driver.find_element(type, value).displayed?).to_not be
  rescue Selenium::WebDriver::Error::NoSuchElementError
    # This is actually what we want, so this is a pass.
    return true
  end
end

