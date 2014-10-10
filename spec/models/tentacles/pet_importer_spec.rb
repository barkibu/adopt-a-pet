require 'spec_helper'
require_relative '../../../app/models/tentacles/pet_importer'

RSpec.describe Tentacles::PetImporter do
  it '#get_province_id returns a valid province_id' do
    expect(described_class.get_province_id('Picanya (Valencia)')).to eq 46
    expect(described_class.get_province_id('Torrejón de Ardoz (Madrid)')).to eq 28
    expect(described_class.get_province_id('Madrid')).to eq 28
    expect(described_class.get_province_id('El Tablero (santa cruz de tenerife)')).to eq 38
    expect(described_class.get_province_id('Mijas (Málaga)')).to eq 29
    expect(described_class.get_province_id('Mijas (Malaga)')).to eq 29
    expect(described_class.get_province_id('Mijas (malaga)')).to eq 29
    expect(described_class.get_province_id('Mijas (málaga)')).to eq 29
    expect(described_class.get_province_id('Mijas ()')).to eq nil
    expect(described_class.get_province_id('Mijas')).to eq nil
  end
end
