require_relative 'pet_importer'

class Tentacles::PetFactory
  def self.pet_from_imported_pet_or_object(imported_pet, object)
    imported_pet.pet || Pet.new(Tentacles::PetAttributesJSONParser.new.parse(object))
  end

  def self.imported_pet_from_object(object)
    imported_pet = ImportedPet.find_by(url: object['more_info_url'])
    imported_pet ||= ImportedPet.find_or_initialize_by(data: object.to_s)
  end
end
