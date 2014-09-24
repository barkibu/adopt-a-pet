require 'spec_helper'
require_relative '../../../app/models/tentacles/importer'

RSpec.describe Tentacles::Importer do
  let(:feed) { { api_id: '11111', name: 'prueba' } }
  let(:file_name) {"spec/data/kimono_formatted.json"}

  context 'file exists' do
    before { allow(subject).to receive(:file_name).and_return(file_name)}

    it 'imports data' do
      allow(subject).to receive :save_object
      expect(subject.run(feed)).to eq true
    end
  end

  context 'file not exists' do
    before { allow(subject).to receive(:get_json_from_local) }

    it 'exits' do
      expect(subject.run(feed)).to be_falsey
    end
  end

  it '#get_province_id returns a valid province_id' do
    expect(subject.get_province_id('Picanya (Valencia)')).to eq 46
    expect(subject.get_province_id('Torrejón de Ardoz (Madrid)')).to eq 28
    expect(subject.get_province_id('El Tablero (santa cruz de tenerife)')).to eq 38
    expect(subject.get_province_id('Mijas (Málaga)')).to eq 29
    expect(subject.get_province_id('Mijas (Malaga)')).to eq 29
    expect(subject.get_province_id('Mijas (malaga)')).to eq 29
    expect(subject.get_province_id('Mijas (málaga)')).to eq 29
    expect(subject.get_province_id('Mijas ()')).to eq nil
    expect(subject.get_province_id('Mijas')).to eq nil
  end
end
