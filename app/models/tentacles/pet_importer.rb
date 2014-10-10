require 'json'

class Tentacles::PetImporter
  def self.get_attributes(object)
    breed = object['breed'].present? ? object['breed'] : 'Desconocida'
    description = object['description'].present? ? object['description'] : 'Sin descripción'

    {
      age: Pet.ages[object['age']],
      breed: breed,
      description: description,
      location: object['location'],
      more_info_url: object['more_info_url'],
      name: object['name'],
      sex: Pet.sexes[object['sex']],
      size: Pet.sizes[object['size']],
      specie: Pet.species[object['specie']],
      province_id: get_province_id(object['location'])
    }
  end

  def self.get_province_id(province)
    match_data = province.match(/\((.*)\)/)
    match_data = province.match(/(.*)/) unless match_data
    return unless match_data

    province = Province.where('slug ILIKE ?', match_data[1].parameterize).first
    province.try :id
  end
end
