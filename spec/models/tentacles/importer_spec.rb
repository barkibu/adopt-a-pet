require 'spec_helper'
require_relative '../../../app/models/tentacles/importer'

RSpec.describe Tentacles::Importer do
  let(:feed) { { api_id: '11111', name: 'prueba' } }
  let(:file_name) { 'spec/data/kimono_formatted.json' }

  context 'file exists' do
    before { allow(subject).to receive(:file_name).and_return(file_name) }

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
end
