# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :shelter do
    name 'MyString'
    description 'MyText'
    web_url 'MyString'
    location 'MyString'
  end
end
