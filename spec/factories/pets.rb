# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pet do
    name        { "#{ case specie when 'perro' then 'Perrito';when 'gato' then 'Gatito';end } #{ %w(guay viejete happy).sample }" }
    specie      { %w(perro gato).sample }
    breed       { case specie when 'perro' then %w(dogo pontier golden).sample;when 'gato' then %w(persa tigre).sample;end }
    sex         { Pet.sexes.keys.sample }
    description "MyText"
    location "MyString"
    age 1
    size        { Pet.sizes.keys.sample }
    more_info_url "MyString"
    urgent      { [true, false].sample }
  end
end
