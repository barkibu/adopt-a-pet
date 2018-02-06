class Tentacles::PetAttributesJSONParser
  def parse(json_object)
    breed = json_object['breed'].presence || 'Desconocida'
    description = json_object['description'].presence || 'Sin descripción'

    {
      age: Pet.ages[json_object['age']],
      breed: breed,
      description: description,
      location: json_object['location'],
      more_info_url: json_object['more_info_url'],
      name: json_object['name'],
      sex: Pet.sexes[json_object['sex']],
      size: Pet.sizes[json_object['size']],
      specie: Pet.species[json_object['specie']],
      province_id: get_province_id(json_object['location'])
    }
  end

  def get_province_id(province)
    return unless province

    match_data = province.match(/\((.*)\)/)
    match_data ||= province.match(/(.*)/)
    return unless match_data

    province = Province.where('slug ILIKE ?', match_data[1].parameterize).first
    province.try :id
  end
end
