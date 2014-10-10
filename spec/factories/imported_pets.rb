# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :imported_pet do
    pet nil
    data "MyText"
    logs "MyText"
  end
end
