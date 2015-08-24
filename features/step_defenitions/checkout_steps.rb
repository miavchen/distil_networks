And(/^I click on the product$/) do
  @browser.click(@browser.product)
end

And(/^I click on Add to Cart$/) do
  @browser.click(@browser.add_to_cart)
end

And(/^I change the quantity to (\d+)$/) do |arg1|
  @browser.clear_text(@browser.quantity)
  @browser.type(@browser.quantity, arg1)
  @browser.click(@browser.update_cart)
end

And(/^click on Checkout$/) do
  @browser.click(@browser.checkout)
end

Then(/^I should be redirected to shopify for checkout$/) do
  assert((@browser.current_url.include? 'checkout.shopify.com'), "FAILURE: Checkout not initiated.")
end


