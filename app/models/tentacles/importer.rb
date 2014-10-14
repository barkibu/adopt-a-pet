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
    pet = Pet.find_or_initialize_by(Tentacles::PetAttributesJSONParser.new.parse(object))

    if pet.new_record?
      imported_pet = ImportedPet.find_or_initialize_by(data: object.to_s)
      pet.created_at = object['created_at']
    else
      imported_pet = pet.imported_pet
      imported_pet.add_log(imported_pet.data.to_s)
      imported_pet.data = object.to_s
      imported_pet.add_log("Updated pet at: #{Time.current}")
    end
    imported_pet.save!

    Tentacles::PetImporter.object_to_pet(object, pet, imported_pet)
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
