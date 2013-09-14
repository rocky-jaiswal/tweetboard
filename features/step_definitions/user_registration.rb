Given /^I am on the application root page$/ do
  visit(root_path)
end

Given /^A valid used is logged in$/ do
  visit root_path 
  within(".sign-in") do
    fill_in('user_email', :with => "jane@example.com")
    fill_in('user_password', :with => "123456")
    click_button('Sign In')
    current_path.should == home_path
  end  
end

When /^I enter the email "(.*?)"$/ do |arg1|
  within(".sign-up") do
    fill_in('user_email', :with => arg1)
  end
end

When /^I enter the password "(.*?)"$/ do |arg1|
  within(".sign-up") do
    fill_in('user_password', :with => arg1)
  end
end

When /^I enter the password confirmation "(.*?)"$/ do |arg1|
  within(".sign-up") do
    fill_in('user_password_confirmation', :with => arg1)
  end
end

When /^I try to save the user$/ do
  within(".sign-up") do
    click_button('Sign Up')
  end
end

Then /^I should see the home page$/ do
  current_path.should == home_path
end

Then /^I should see an error message$/ do
  current_path.should == user_registration_path
  page.should have_content('Please review the problems below:')
end

