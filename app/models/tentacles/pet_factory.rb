class Tentacles::PetFactory
  def self.pet_from_imported_pet_or_object(imported_pet, object)
    imported_pet.pet || Pet.new(Tentacles::PetAttributesJSONParser.new.parse(object))
  end

  def self.imported_pet_from_object(object)
    imported_pet = ImportedPet.find_by(url: object['more_info_url'])
    imported_pet ||= ImportedPet.find_or_initialize_by(data: object.to_s)
  end

  def self.save_pet_and_imported_pet(pet, imported_pet, object)
    if pet.new_record?
      pet.created_at = object['created_at']
    end

    imported_pet.add_log("Updated at: #{Time.current}")

    pet.status = object['status']
    pet.urgent = object['urgent']

    if object['img'].present?
      picture = pet.pet_pictures.new
      begin
        picture.asset = object['img']
      rescue OpenURI::HTTPError, SocketError => e
        imported_pet.add_log("Img <#{object['img']}> is not valid. Error: #{e.message}.")
        picture.destroy
      end
    end

    if pet.save
      imported_pet.pet_id = pet.id
    else
      imported_pet.add_log(pet.errors.messages.to_s)
    end
    imported_pet.save!
  end
end
