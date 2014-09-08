# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pet do
    name "MyString"
    specie "MyString"
    breed "MyString"
    sex 1
    description "MyText"
    location "MyString"
    state 1
    age 1
    size 1
    more_info_url "MyString"
    urgent false
  end
end
