Given /^I am logged in$/ do
  login_as FactoryGirl.create(:user)
end