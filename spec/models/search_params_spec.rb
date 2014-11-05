require 'rails_helper'

RSpec.describe SearchParams do
  subject { SearchParams.new(params) }
  let(:params) { {} }

  describe '#get' do
    context 'with empty params' do
      it 'only returns accepted keys' do
        expect(subject.get).to be_empty
        expect(subject.get).not_to include(:young, :big)
      end
    end

    context 'with params without any key' do
      let(:params) { { a: 1, b: 2, c: 3 } }

      it 'only returns accepted keys' do
        expect(subject.get).not_to include(:young, :big)
      end
    end

    context 'with params with one key' do
      let(:params) { { a: 1, big: 2, c: 3 } }

      it 'only returns accepted keys' do
        expect(subject.get).to include(:big)
        expect(subject.get).not_to include(:young)
      end
    end

    context 'with params with all keys' do
      let(:params) { { young: 1, big: 2 } }

      it 'only returns accepted keys' do
        expect(subject.get).to include(:young, :big)
      end
    end
  end

  describe '#species_to_url_params' do
    let(:default_value) { 'mascotas' }

    context 'with empty params' do
      it '' do
        expect(subject.species_to_url_params).to eql default_value
      end
    end

    context 'with an invalid key' do
      let(:params) { { foo: ''} }

      it 'returns default value' do
        expect(subject.species_to_url_params).to eql default_value
      end
    end

    context 'with dog and cat' do
      let(:params) { { dog: '', cat: ''} }

      it 'returns default value' do
        expect(subject.species_to_url_params).to eql default_value
      end
    end

    context 'with dog' do
      let(:params) { { dog: '' } }

      it 'returns perros' do
        expect(subject.species_to_url_params).to eql 'perros'
      end
    end

    context 'with cat' do
      let(:params) { { cat: '' } }

      it 'returns gatos' do
        expect(subject.species_to_url_params).to eql 'gatos'
      end
    end
  end

  describe '#valid_province' do
    context 'with empty params' do
      it 'returns false' do
        expect(subject.valid_province).to be_falsey
      end
    end

    context 'with an invalid province' do
      let(:params) { { province: 'foo' } }

      it 'returns false' do
        expect(subject.valid_province).to be_falsey
      end
    end

    context 'with a wrong province' do
      let(:params) { { province: 'Valencia' } }

      it 'returns false' do
        expect(subject.valid_province).to be_falsey
      end
    end

    context 'with a valid province' do
      let(:params) { { province: 'valencia' } }

      it 'returns true' do
        expect(subject.valid_province).to be_truthy
      end
    end
  end
end
