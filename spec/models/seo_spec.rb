require 'rails_helper'

RSpec.describe SEO do
  describe '.description_for_index' do
    it 'returns the right text' do
      desc = SEO.description_for_index(:dog, 'Valencia', nil, nil)
      expect(desc).to eq 'Adopta a un perro en Valencia. Aquí encontrarás a tu mascota ideal.'

      desc = SEO.description_for_index(:pet, 'Madrid', nil, 2)
      expect(desc).to eq 'Adopta a una mascota en Madrid. Aquí encontrarás a tu mascota ideal (página 2).'

      desc = SEO.description_for_index(:dog, '', nil, 1)
      expect(desc).to eq 'Adopta a un perro. Aquí encontrarás a tu mascota ideal.'

      desc = SEO.description_for_index(:cat, 'Lugo', 'Persa', 3)
      expect(desc).to eq 'Adopta a un gato Persa en Lugo. Aquí encontrarás a tu mascota ideal (página 3).'
    end
  end
end