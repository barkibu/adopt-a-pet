require 'json'
require 'aws/s3'

class Tentacles::Importer
  def run(feed)
    if Rails.env.production? || Rails.env.staging?
      data = get_json_from_s3 feed[:name]
    else
      data = get_json_from_local feed[:name]
    end
    return unless data

    data.each do |object|
      save_object object
    end
    true
  end

  def save_object(object)
    pet = Pet.find_or_initialize_by(Tentacles::PetImporter.get_attributes(object))

    if pet.new_record?
      imported = ImportedPet.new
      imported.data = object.to_s
      pet.created_at = object['created_at']
    else
      imported = pet.imported_pet
      imported.add_fail_to_log(imported.data.to_s)
      imported.data = object.to_s
      imported.add_fail_to_log("Updated pet at: #{Time.current}")
    end
    imported.save!

    unless object['breed'].present?
      imported.add_fail_to_log('Breed is empty')
      imported.save!
      return
    end

    pet.status = object['status']
    pet.urgent = object['urgent']

    if object['img'].present? && pet.new_record?
      picture = pet.pet_pictures.new
      begin
        picture.asset = object['img']
      rescue OpenURI::HTTPError, SocketError => e
        imported.add_fail_to_log("Img <#{object['img']}> is not valid. Error: #{e.message}.")
        picture.destroy
      end
    end

    if pet.save
      imported.pet_id = pet.id
    else
      imported.add_fail_to_log(pet.errors.messages.to_s)
    end
    imported.save!
  end

  def get_json_from_local(name)
    return unless File.exist? file_name(name)

    json_file = File.new file_name(name), 'r'
    raw_content = json_file.read
    content_parsed = JSON.parse(raw_content)
  end

  def get_json_from_s3(name)
    s3 = AWS::S3.new(
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
    )
    resp = s3.buckets[ENV['S3_BUCKET_NAME']].objects["tentacles/data/#{name}.json"]
    raw_content = resp.read
    content_parsed = JSON.parse(raw_content)
  end

  def file_name(name)
    "db/tentacles/data/#{name}.json"
  end
end
