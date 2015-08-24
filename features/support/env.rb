require 'rspec/expectations'
require 'hooks'
require 'helper'
env=ENV['env'] || "production"

Before do |scenario|
 browser=AutomationFramework::TestEngine.new(:env => env)
 @browser = browser
 @browser.maximize
end

After do |scenario|
  @browser.quit
end
