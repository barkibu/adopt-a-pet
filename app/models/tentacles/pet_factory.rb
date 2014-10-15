class Tentacles::PetFactory
  def initialize(object = {}, imported_pet = nil)
    @object = object
    @imported_pet = imported_pet || imported_pet_from_object
  end

  def update
    pet = pet_from_imported_pet_or_object
    if pet.new_record?
      pet.created_at = @object['created_at']
    end

    if !@imported_pet.new_record? && !pet.new_record?
      @imported_pet.add_log(@imported_pet.data.to_s)
      @imported_pet.data = @object.to_s
    end

    @imported_pet.add_log("Updated at: #{Time.current}")

    pet.status = @object['status']
    pet.urgent = @object['urgent']

    add_image(pet)

    if pet.save
      @imported_pet.pet_id = pet.id
    else
      @imported_pet.add_log(pet.errors.messages.to_s)
    end
    @imported_pet.save!
  end

  def pet_from_imported_pet_or_object
    @imported_pet.pet || Pet.new(Tentacles::PetAttributesJSONParser.new.parse(@object))
  end

  def imported_pet_from_object
    found_imported_pet = ImportedPet.find_by(url: @object['more_info_url'])
    found_imported_pet ||= ImportedPet.find_or_initialize_by(data: @object.to_s)
  end

  def add_image(pet)
    if @object['img'].present?
      picture = pet.pet_pictures.new
      begin
        picture.asset = @object['img']
      rescue OpenURI::HTTPError, SocketError => e
        @imported_pet.add_log("Img <#{@object['img']}> is not valid. Error: #{e.message}.")
        picture.destroy
      end
    end
  end
end
