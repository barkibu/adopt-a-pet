require 'json'

class Tentacles::Importer
  def run(feed)
    data = get_json feed[:name]
    return unless data

    data.each do |object|
      save_object object
    end
    true
  end

  def save_object(object)
    return unless object['breed'].present?

    Pet.new do |pet|
      pet.age = object['age']
      pet.breed = object['breed']
      pet.created_at = object['created_at']
      pet.description = object['description']
      pet.location = object['location']
      pet.more_info_url = object['more_info_url']
      pet.name = object['name']
      pet.sex = object['sex']
      pet.size = object['size']
      pet.specie = object['specie']
      pet.status = object['status']
      pet.urgent = object['urgent']
      pet.province_id = get_province_id(object['location'])

      if object['img'].present?
        picture = pet.pet_pictures.new
        begin
          picture.asset = object['img']
        rescue OpenURI::HTTPError
          return
        end
      end

      pet.save!
    end
  end

  def get_json(name)
    return unless File.exist? file_name(name)

    json_file = File.new file_name(name), 'r'
    raw_content = json_file.read
    content_parsed = JSON.parse(raw_content)
  end

  def file_name(name)
    "db/tentacles/data/#{name}.json"
  end

  def get_province_id(province)
    match_data = province.match(/\((.*)\)/)
    return unless match_data

    province = Province.where('slug ILIKE ?', match_data[1].parameterize).first
    province.try :id
  end
end
