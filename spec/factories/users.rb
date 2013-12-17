# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email 'joe@email.com'
    password 'joeJoeJOE!'
    password_confirmation 'joeJoeJOE!'
  end
end
