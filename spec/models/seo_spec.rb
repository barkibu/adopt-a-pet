require 'rails_helper'

RSpec.describe SEO do
  let(:pet) { Specie.find_by_key(:pet) }
  let(:dog) { Specie.find_by_key(:dog) }
  let(:cat) { Specie.find_by_key(:cat) }

  describe '.description_for_index' do
    it 'returns the right text' do
      desc = SEO.description_for_index(dog, 'Valencia', nil, nil)
      expect(desc).to eq 'Adopta a un perro en Valencia. Aquí encontrarás a tu mascota ideal.'

      desc = SEO.description_for_index(pet, 'Madrid', nil, 2)
      expect(desc).to eq 'Adopta a una mascota en Madrid. Aquí encontrarás a tu mascota ideal (página 2).'

      desc = SEO.description_for_index(dog, '', nil, 1)
      expect(desc).to eq 'Adopta a un perro. Aquí encontrarás a tu mascota ideal.'

      desc = SEO.description_for_index(cat, 'Lugo', 'Persa', 3)
      expect(desc).to eq 'Adopta a un gato Persa en Lugo. Aquí encontrarás a tu mascota ideal (página 3).'
    end

    it 'returns default_description if only there is :pet as specie' do
      desc = SEO.description_for_index(pet, nil, nil, nil)
      default_description = SEO.default_description
      expect(desc).to eq default_description
    end
  end

  describe '.title_for_adopt' do
    it 'returns the default description if only there is :pet as specie' do
      title = SEO.title_for_adopt(pet, nil, nil)
      expect(title).to eq 'Adopta a una mascota'
    end
  end
end
