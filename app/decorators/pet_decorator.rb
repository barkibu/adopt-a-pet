class PetDecorator < Draper::Decorator
  delegate_all

  def adopt_specie_path(extra_params = {})
    h.adopt_specie_path(adopt_specie_params(extra_params))
  end

  def adopt_specie_url(extra_params = {})
    h.adopt_specie_url(adopt_specie_params(extra_params))
  end

  def adopt_specie_params(extra_params)
    specie = object.enum_to_s(:specie).pluralize.parameterize
    province = object.province
    breed = object.breed.parameterize

    {
      specie: specie,
      province: province,
      breed: breed,
      id: self
    }.merge(extra_params)
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def location_formatted
    if province_id
      location.sub(/\(.*\)/, '').strip
    else
      location
    end
  end

  def name_formatted
    name.titleize
  end

  def show_province?
    province.name != location_formatted
  end

  def breed_formatted
    breed.titleize
  end

  def specie_formatted
    Specie.find_by_key(object.specie.to_sym).to_s.titleize
  end

  def sex_label
    "Sexo del #{specie_formatted.downcase.singularize}"
  end
end
