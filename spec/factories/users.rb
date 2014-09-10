# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email     { Faker::Internet.email }
    password 'MyString'

    factory :admin do
      role :admin
    end
  end
end
