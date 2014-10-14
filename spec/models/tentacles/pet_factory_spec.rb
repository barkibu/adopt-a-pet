require 'spec_helper'
require_relative '../../../app/models/tentacles/pet_factory'

RSpec.describe Tentacles::PetFactory do
  describe '.imported_pet_from_object' do
    it 'returns a new imported_pet' do
      imported_pet = described_class.imported_pet_from_object({})
      expect(imported_pet).to be_new_record
    end
  end

  describe '.pet_from_imported_pet_or_object' do
    let(:imported_pet) { FactoryGirl.build(:imported_pet) }

    it 'returns a new pet' do
      pet = described_class.pet_from_imported_pet_or_object(imported_pet, {})
      expect(pet).to be_new_record
    end
  end
end
