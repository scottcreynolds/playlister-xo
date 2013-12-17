FactoryGirl.define do
  factory :user do
    email 'joe@email.com'
    password 'joeJoeJOE!'
    password_confirmation 'joeJoeJOE!'
  end
end
