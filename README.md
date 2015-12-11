Primo Tests
===========================
Automated UI regression testing for OSU's Primo discovery service using [Selenium WebDriver](http://docs.seleniumhq.org/docs/03_webdriver.jsp)

Currently this is set to execute tests using your locally installed Firefox browser.  Other browsers can be set by 
changing the symbol in this line `@driver = Selenium::WebDriver.for :firefox` in each test file to:
:ie, :internet_explorer, :remote, :chrome, :firefox, :ff, :android, :iphone, :opera, :phantomjs, :safari


To Run
-----------------
From the command line, set any ENV variables as shown below and specify the test(s) to be run.  The default format for 
output is **documentation** which is colored and verbose.
 
`rspec spec/scope_on_change.rb`

or for a script that uses ENV variables:

`user=USERNAME pass=PASSWORD rspec spec/sms_fields_hidden.rb`

Additional resources for customizing tests can be found here:

- [Selenium WebDriver](http://docs.seleniumhq.org/docs/03_webdriver.jsp)

- [Selenium Ruby Bindings](https://code.google.com/p/selenium/wiki/RubyBindings)

