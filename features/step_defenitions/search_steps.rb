And(/^I search for  (.*)/) do |search_text|
  @browser.type(@browser.search, search_text)
  @browser.submit(@browser.search_form)
end

Then(/^I should get exactly one result$/) do
  assert_equal(1, @browser.get_count(@browser.search_results), "FAILURE: Search results not equal expected.")
end




