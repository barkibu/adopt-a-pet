# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email 'sample@example.com'
    password 'MyString'

    factory :admin do
      role :admin
    end
  end
end
