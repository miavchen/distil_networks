Given /^I am on the homepage$/ do
  start_time = Time.new.to_f
  @browser.open('http://www.swedishfurnitureparts.com')
  end_time = Time.new.to_f
  @homepage_load_time= (end_time - start_time)*1000.0
end

Then(/^shopify_s cookie should be set$/) do
  assert(!@browser.manage.cookie_named('_shopify_s').nil?, "FAILURE: _shopify_s cookie not set.")
end

Then(/^page load time should be less than (\d+) ms$/) do |arg1|
  assert(@homepage_load_time<arg1.to_f, "FAILURE: Page load time is #{@homepage_load_time}")
end




