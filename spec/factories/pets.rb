# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pet do
    name          { "#{case specie when :dog then 'Perrito'; when :cat then 'Gatito'; end} #{%w[guay viejete happy].sample}" }
    specie        { %i[dog cat].sample }
    breed         { case specie when :dog then %w[dogo pontier golden].sample; when :cat then %w[persa tigre].sample; end }
    sex           { Pet.sexes.keys.sample }
    description   { Faker::Lorem.paragraphs(rand(1..4)).join "\n\n" }
    shelter_name  { Faker::Company.name }
    province_id   { Province.where(id: [46, 8, 28, 50, 20, 41, 27]).to_a.sample.id }
    location      { province.name }
    age           { Pet.ages.keys.sample }
    size          { Pet.sizes.keys.sample }
    more_info_url { Faker::Internet.http_url }
    urgent        { [true, false].sample }
  end
end
