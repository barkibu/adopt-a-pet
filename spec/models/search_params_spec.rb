require 'rails_helper'

RSpec.describe SearchParams do
  describe '.get' do
    it 'only returns accepted keys' do
      expect(SearchParams.get({})).to be_empty
      expect(SearchParams.get({})).not_to include(:young, :big)
      expect(SearchParams.get({ a: 1, b: 2, c: 3})).not_to include(:young, :big)
      expect(SearchParams.get({ a: 1, big: 2, c: 3})).to include(:big)
      expect(SearchParams.get({ a: 1, big: 2, c: 3})).not_to include(:young)
      expect(SearchParams.get({ young: 1, big: 2 })).to include(:young, :big)
    end
  end

  describe '.species_to_url_params' do
    it 'returns the corresponding string' do
      expect(SearchParams.species_to_url_params({})).to eql 'mascotas'
      expect(SearchParams.species_to_url_params({ foo: ''})).to eql 'mascotas'
      expect(SearchParams.species_to_url_params({ dog: '', cat: ''})).to eql 'mascotas'
      expect(SearchParams.species_to_url_params({ dog: '' })).to eql 'perros'
      expect(SearchParams.species_to_url_params({ cat: '' })).to eql 'gatos'
    end
  end

  describe '.valid_province' do
    it 'returns true if Province exists' do
      expect(SearchParams.valid_province({})).to be_falsey
      expect(SearchParams.valid_province({ province: 'foo' })).to be_falsey
      expect(SearchParams.valid_province({ province: 'Valencia' })).to be_falsey
      expect(SearchParams.valid_province({ province: 'valencia' })).to be_truthy
    end
  end
end
