require 'json'

class Tentacles::PetImporter
  def self.object_to_pet(object, pet, imported_pet)
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
