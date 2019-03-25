Given(/^I am on the landing page$/) do
  expect(page.title).to eq('Swag Labs') 
  page.has_selector?("#login_button_container")
end

When(/^I log into the application with user "(.*?)"$/) do |user|
  # Fill in the username
  find('[data-test="username"]').send_keys(user)
  # Fill in the password
  find('[data-test="password"]').send_keys('secret_sauce')
  # Hit the login button
  find('.btn_action').click
end

Then("I see the homepage") do
  # binding.pry
  have_selector('div.inventory_list')
  expect(page.current_path).to eq('/inventory.html')
end

Given(/^I see the cart is empty$/) do
  find("#shopping_cart_container")
  # Make sure that nothing is in the cart currently
  expect(page.has_css?(".fa-layers-counter")).to eq(false)
end

When(/^I click to add the item I want$/) do
  find_all(".btn_primary")[0].click
end

Then("I see number of items in the shopping cart increment up by 1") do
  expect(find('.fa-layers-counter').text).to eq('1')
end

Given(/^I have an item in my shopping cart$/) do
  find_all(".btn_primary")[0].click
  find_all(".btn_primary")[1].click
  expect(find('.fa-layers-counter').text).to eq('2')
end

When(/^I click on the remove button$/) do
  find_all(".btn_secondary")[0].click
end

Then("I see the number of items in the cart decrease by 1") do
  expect(find('.fa-layers-counter').text).to eq('1')
end

Given(/^I select items to add to the shopping cart$/) do
  find_all(".btn_primary")[2].click
  find_all(".btn_primary")[3].click
  expect(find('.fa-layers-counter').text).to eq('2')
end

When(/^I click on the shopping cart$/) do
  click_on(class: 'shopping_cart_link')
  expect(page.current_path).to eq('/cart.html')
end

Then("I can see the items I have selected") do
  expect(find_all('.cart_item').length).to eq(2)
end

Given(/^I enter the shopping cart$/) do
  click_on(class: 'shopping_cart_link')
  expect(page.current_path).to eq('/cart.html')
end

When(/^I click the Continue Shopping link$/) do
  click_on(class: 'btn_secondary')
end

Then("I am returned to the products page") do
  have_selector('div.inventory_list')
  expect(page.current_path).to eq('/inventory.html')
end

# Given(/^I login with user "(.*?)"$/) do |user|
#   find('[data-test="username"]').send_keys(user)
#   find('[data-test="password"]').send_keys('secret_sauce')
#   find('.btn_action').click
#   have_selector('div.inventory_list')
# end

# When(/^I click on the hamburger menu and then on the About prompt$/) do
#   binding.pry
#   click_on('Open Menu')
# end

# Then("I see the Sauce Labs home page") do
#   have_selector('div.inventory_list')
# end

# Given(/^I login with user "(.*?)"$/) do |user|
  #   find('[data-test="username"]').send_keys(user)
  #   find('[data-test="password"]').send_keys('secret_sauce')
  #   find('.btn_action').click
  #   have_selector('div.inventory_list')
  # end
  
  # When(/^I click on the hamburger menu and click to log out$/) do
  #   binding.pry
  #   click_on('Open Menu')
  # end
  
  # Then("I see the login page") do
  #   expect(page.title).to eq('Swag Labs') 
  #   page.has_selector?("#login_button_container")
  # end