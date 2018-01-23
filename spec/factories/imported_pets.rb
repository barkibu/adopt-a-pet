# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :imported_pet do
    pet nil
    data "MyText"
    logs "MyText"
  end
end
