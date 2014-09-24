# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :imported_pet do
    pet nil
    data "MyText"
    fail_logs "MyText"
  end
end
