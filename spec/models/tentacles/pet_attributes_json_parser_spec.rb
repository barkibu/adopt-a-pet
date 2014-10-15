require 'spec_helper'

RSpec.describe Tentacles::PetAttributesJSONParser do
  describe '#parse' do
    context 'with data' do
      let(:object) { { 'breed' => 'Galgo', 'description' => 'A good dog' } }

      it 'returns valid data' do
        attributes = subject.parse(object)
        expect(attributes[:breed]).to eq 'Galgo'
        expect(attributes[:description]).to eq 'A good dog'
      end
    end

    context 'without data' do
      let(:object) { {} }

      it 'returns default data' do
        attributes = subject.parse(object)
        expect(attributes[:breed]).to eq 'Desconocida'
        expect(attributes[:description]).to eq 'Sin descripción'
      end
    end
  end

  it '#get_province_id returns a valid province_id' do
    expect(subject.get_province_id('Picanya (Valencia)')).to eq 46
    expect(subject.get_province_id('Torrejón de Ardoz (Madrid)')).to eq 28
    expect(subject.get_province_id('Madrid')).to eq 28
    expect(subject.get_province_id('El Tablero (santa cruz de tenerife)')).to eq 38
    expect(subject.get_province_id('Mijas (Málaga)')).to eq 29
    expect(subject.get_province_id('Mijas (Malaga)')).to eq 29
    expect(subject.get_province_id('Mijas (malaga)')).to eq 29
    expect(subject.get_province_id('Mijas (málaga)')).to eq 29
    expect(subject.get_province_id('Mijas ()')).to eq nil
    expect(subject.get_province_id('Mijas')).to eq nil
  end
end
