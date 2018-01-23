require 'spec_helper'
require_relative '../../../app/models/tentacles/pet_factory'

RSpec.describe Tentacles::PetFactory do
  it '#imported_pet_from_object returns a new imported_pet' do
    imported_pet = subject.imported_pet_from_object
    expect(imported_pet).to be_new_record
  end

  describe '#pet_from_imported_pet_or_object' do
    let(:imported_pet) { FactoryBot.build(:imported_pet) }
    subject { Tentacles::PetFactory.new({}, imported_pet) }

    it 'returns a new pet' do
      pet = subject.pet_from_imported_pet_or_object
      expect(pet).to be_new_record
    end
  end
end
