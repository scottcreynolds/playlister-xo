Given /^I am logged in$/ do
  login_as FactoryGirl.create(:user)
end

Given /^I exist as a user$/ do
  FactoryGirl.create(:user)
  @user = FactoryGirl.attributes_for(:user)
end

Given(/^I am on the sign in page$/) do
  visit new_user_session_path
end

When(/^I sign in with valid credentials$/) do
  fill_in "Email", with: @user[:email]
  fill_in "Password", with: @user[:password]
  click_on "Sign in"
end
